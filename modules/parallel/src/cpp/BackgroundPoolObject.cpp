//=============================================================================
// Copyright (c) 2016-present Allan CORNET (Nelson)
//=============================================================================
// This file is part of the Nelson.
//=============================================================================
// LICENCE_BLOCK_BEGIN
// SPDX-License-Identifier: LGPL-3.0-or-later
// LICENCE_BLOCK_END
//=============================================================================
#include <tuple>
#include "BackgroundPoolObject.hpp"
#include "Evaluator.hpp"
#include "characters_encoding.hpp"
#include "FevalQueueObject.hpp"
#include "TimeHelpers.hpp"
#include "NelsonConfiguration.hpp"
//=============================================================================
namespace Nelson {
//=============================================================================
BackgroundPoolObject* BackgroundPoolObject::m_pInstance = nullptr;
//=============================================================================
BackgroundPoolObject*
BackgroundPoolObject::getInstance()
{
    if (m_pInstance == nullptr) {
        m_pInstance = new BackgroundPoolObject();
    }

    return m_pInstance;
}
//=============================================================================
BackgroundPoolObject::~BackgroundPoolObject()
{
    if (threadPool) {
        delete threadPool;
        threadPool = nullptr;
    }
}
//=============================================================================
void
BackgroundPoolObject::destroy()
{
    if (m_pInstance != nullptr) {
        delete m_pInstance;
        m_pInstance = nullptr;
    }
}
//=============================================================================
size_t
BackgroundPoolObject::getTasksQueued()
{
    return threadPool->get_tasks_queued();
}
//=============================================================================
size_t
BackgroundPoolObject::getTasksRunning()
{
    return threadPool->get_tasks_running();
}
//=============================================================================
size_t
BackgroundPoolObject::getNumberOfThreads()
{
    return threadPool->get_thread_count();
}
//=============================================================================
BackgroundPoolObject::BackgroundPoolObject()
    : HandleGenericObject(std::wstring(BACKGROUNDPOOL_CATEGORY_STR), this, false)
{
    threadPool = new BS::thread_pool(NelsonConfiguration::getInstance()->getMaxNumCompThreads());
    propertiesNames = { L"NumWorkers", L"Busy", L"FevalQueue" };
}
//=============================================================================
void
BackgroundPoolObject::display(Interface* io)
{
    if (io) {
        bool busy = (threadPool->get_tasks_running() != 0);
        size_t numWorkers = threadPool->get_thread_count();
        size_t nbFevalQueue = threadPool->get_tasks_running() + threadPool->get_tasks_queued();
#define BLANKS_AT_BOL std::wstring(L"   ")
        io->outputMessage(L"\n");
        io->outputMessage(BLANKS_AT_BOL + L"NumWorkers: " + std::to_wstring(numWorkers) + L"\n");
        std::wstring busyString = busy ? L"true" : L"false";
        io->outputMessage(BLANKS_AT_BOL + L"Busy: " + busyString + L"\n");

        if (nbFevalQueue > 0) {
            std::wstring msg;
            if (nbFevalQueue == 1) {
                msg = BLANKS_AT_BOL + L"FevalQueue: " + std::to_wstring(nbFevalQueue) + L" "
                    + _W("outstanding future.");
            } else {
                msg = BLANKS_AT_BOL + L"FevalQueue: " + std::to_wstring(nbFevalQueue) + L" "
                    + _W("outstanding futures.");
            }
            io->outputMessage(msg + L"\n");
        }
    }
}
//=============================================================================
bool
BackgroundPoolObject::get(const std::wstring& propertyName, ArrayOf& result)
{
    if (propertyName == L"NumWorkers") {
        size_t numWorkers = threadPool->get_thread_count();
        result = ArrayOf::doubleConstructor((double)numWorkers);
        return true;
    }
    if (propertyName == L"Busy") {
        bool busy = (threadPool->get_tasks_running() != 0);
        result = ArrayOf::logicalConstructor(busy);
        return true;
    }
    if (propertyName == L"FevalQueue") {
        result = ArrayOf::handleConstructor(FevalQueueObject::getInstance());
        return true;
    }
    return false;
}
//=============================================================================
static std::tuple<ArrayOfVector, Exception>
FunctionEvalInternal(FunctionDef* fptr, int nLhs, const ArrayOfVector& argIn,
    std::atomic<THREAD_STATE>* s, std::atomic<uint64>* startRunningDate,
    std::atomic<uint64>* endRunningDate)
{
    *s = THREAD_STATE::RUNNING;
    *startRunningDate = getEpoch();
    *endRunningDate = (uint64)0;

    Context* context = new Context;
    Evaluator* eval = new Evaluator(context, nullptr, false);
    ArrayOfVector retValues;
    THREAD_STATE finalState;
    Exception retException;
    try {
        retValues = fptr->evaluateFunction(eval, argIn, nLhs);
        finalState = THREAD_STATE::FINISHED;
    } catch (Exception& e) {
        retException = e;
        finalState = THREAD_STATE::FAILED;
    }
    std::tuple<ArrayOfVector, Exception> result = std::make_tuple(retValues, retException);
    *endRunningDate = (uint64)getEpoch();
    *s = finalState;
    return result;
}
//=============================================================================
ArrayOf
BackgroundPoolObject::feval(FunctionDef* fptr, int nLhs, const ArrayOfVector& argIn)
{
    FevalFutureObject* retFuture = nullptr;
    try {
        retFuture = new FevalFutureObject(utf8_to_wstring(fptr->getName()));
    } catch (std::bad_alloc&) {
        Error(ERROR_MEMORY_ALLOCATION);
    }
    retFuture->state = THREAD_STATE::QUEUED;
    retFuture->setFuture(threadPool->submit(FunctionEvalInternal, fptr, nLhs, argIn,
        &retFuture->state, &retFuture->startDateTime, &retFuture->endDateTime));
    FevalQueueObject::getInstance()->add(retFuture);
    ArrayOf result = ArrayOf::handleConstructor(retFuture);
    nelson_handle* qp = (nelson_handle*)(result.getDataPointer());
    retFuture->asNelsonHandle = qp[0];
    return result;
}
//=============================================================================
wstringVector
BackgroundPoolObject::fieldnames()
{
    return propertiesNames;
}
//=============================================================================
} // namespace Nelson
//=============================================================================