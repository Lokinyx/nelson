//=============================================================================
// Copyright (c) 2016-present Allan CORNET (Nelson)
//=============================================================================
// This file is part of the Nelson.
//=============================================================================
// LICENCE_BLOCK_BEGIN
// SPDX-License-Identifier: LGPL-3.0-or-later
// LICENCE_BLOCK_END
//=============================================================================
#include "And.hpp"
#include "Evaluator.hpp"
#include "Operators.hpp"
#include "FindCommonType.hpp"
#include "OverloadHelpers.hpp"
//=============================================================================
namespace Nelson {
//=============================================================================
ArrayOf
Evaluator::andOperator(const ArrayOfVector& args)
{
    NelsonType commonType = NLS_DOUBLE;
    bool isSparse = false;
    bool isComplex = false;
    std::string commonTypeName = NLS_DOUBLE_STR;

    ArrayOf res;
    if (FindCommonType(args, commonType, isSparse, isComplex, commonTypeName)) {
        bool overloadWasFound = false;
        res = callOverloadedFunction(this,
            NelsonConfiguration::getInstance()->getOverloadLevelCompatibility(), args, "and",
            commonTypeName, commonType, overloadWasFound);
        if (overloadWasFound) {
            return res;
        }
    }
    if (isComplex) {
        Error(_("Operands must be real."));
    }

    if (isSparse
        && (commonType != NLS_DOUBLE && commonType != NLS_DCOMPLEX && commonType != NLS_LOGICAL)) {
        Error(_("Attempt to convert to unimplemented sparse type"), "Nelson:UnableToConvert");
    }

    if (isSparse) {
        bool overloadWasFound = false;
        res = callOverloadedFunction(this, NLS_OVERLOAD_ALL_TYPES, args, "and",
            commonType == NLS_LOGICAL ? NLS_SPARSE_LOGICAL_STR : NLS_SPARSE_DOUBLE_STR, commonType,
            overloadWasFound);
        if (!overloadWasFound) {
            OverloadRequired("and");
        }
        return res;
    }

    bool neeDToOverload = false;
    res = And(args[0], args[1], commonType, neeDToOverload);
    if (!neeDToOverload) {
        return res;
    }
    bool overloadWasFound = false;
    res = callOverloadedFunction(
        this, NLS_OVERLOAD_ALL_TYPES, args, "and", commonTypeName, commonType, overloadWasFound);
    if (overloadWasFound) {
        return res;
    }
    OverloadRequired("and");
    return {};
}
//=============================================================================
ArrayOf
Evaluator::andOperator(AbstractSyntaxTreePtr t)
{
    callstack.pushID((size_t)t->getContext());
    ArrayOfVector args;
    args << expression(t->down);
    args << expression(t->down->right);
    ArrayOf retval = andOperator(args);
    callstack.popID();
    return retval;
}
//=============================================================================
} // namespace Nelson
//=============================================================================
