//=============================================================================
// Copyright (c) 2016-present Allan CORNET (Nelson)
//=============================================================================
// LICENCE_BLOCK_BEGIN
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// LICENCE_BLOCK_END
//=============================================================================
#include "SLICOTWrapperBuiltin.hpp"
#include "SlicotWrapper.hpp"
#include "Error.hpp"
//=============================================================================
using namespace Nelson;
//=============================================================================
ArrayOfVector
Nelson::SlicotGateway::SLICOTWrapperBuiltin(Evaluator* eval, int nLhs, const ArrayOfVector& argIn)
{
    ArrayOfVector retval;
    if (nLhs > 1) {
        Error(ERROR_WRONG_NUMBERS_OUTPUT_ARGS);
    }
    switch (argIn.size()) {
    case 1: {
        std::wstring param1 = argIn[0].getContentAsWideString();
        if (param1 == L"load") {
            retval.push_back(ArrayOf::logicalConstructor(loadSlicotLibrary()));
        } else if (param1 == L"free") {
            retval.push_back(ArrayOf::logicalConstructor(freeSlicotLibrary()));
        } else {
            Error(_W("Wrong value for #1: 'load' or 'free' expected."));
        }
    } break;
    case 2: {
        std::wstring param1 = argIn[0].getContentAsWideString();
        if (param1 == L"load") {
            std::wstring slicotName = argIn[0].getContentAsWideString();
            retval.push_back(ArrayOf::logicalConstructor(loadSlicotLibrary(slicotName)));
        } else {
            Error(_W("Wrong value for #1: 'load' expected."));
        }
    } break;
    default: {
        Error(ERROR_WRONG_NUMBERS_INPUT_ARGS);
    } break;
    }
    return retval;
}
//=============================================================================