//=============================================================================
// Copyright (c) 2016-present Allan CORNET (Nelson)
//=============================================================================
// This file is part of the Nelson.
//=============================================================================
// LICENCE_BLOCK_BEGIN
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//
// Alternatively, you can redistribute it and/or
// modify it under the terms of the GNU General Public License as
// published by the Free Software Foundation; either version 2 of
// the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this program. If not, see <http://www.gnu.org/licenses/>.
// LICENCE_BLOCK_END
//=============================================================================
#include "MExceptionBuiltin.hpp"
#include "MException.hpp"
#include "Error.hpp"
#include "Exception.hpp"
//=============================================================================
using namespace Nelson;
//=============================================================================
ArrayOfVector
Nelson::ErrorManagerGateway::MExceptionBuiltin(
    Evaluator* eval, int nLhs, const ArrayOfVector& argIn)
{
    nargincheck(argIn, 1, 2);
    nargoutcheck(nLhs, 0, 1);
    ArrayOfVector retval;
    std::wstring identifier = argIn[0].getContentAsWideString();
    if (argIn.size() == 1) {
        if (identifier == L"reset") {
            eval->resetLastErrorException();
            return retval;
        }
        if (identifier == L"last") {
            retval << ExceptionToArrayOf(eval->getLastErrorException());
            return retval;
        }
        Error("'reset' or 'last' value expected.");
    }
    if (!isValidMExceptionIdentifier(identifier)) {
        Error(_W("First input argument must be a valid message identifier."));
    }
    std::wstring message = argIn[1].getContentAsWideString();
    retval << ExceptionToArrayOf(Exception(message, identifier));
    return retval;
}
//=============================================================================
