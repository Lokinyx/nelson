//=============================================================================
// Copyright (c) 2016-present Allan CORNET (Nelson)
//=============================================================================
// This file is part of the Nelson.
//=============================================================================
// LICENCE_BLOCK_BEGIN
// SPDX-License-Identifier: LGPL-3.0-or-later
// LICENCE_BLOCK_END
//=============================================================================
#include <algorithm>
#include "NaN.hpp"
//=============================================================================
namespace Nelson {
//=============================================================================
ArrayOf
NaN()
{
    return NaN(1, 1);
}
//=============================================================================
ArrayOf
NaN(indexType m, indexType n)
{
    Dimensions dims(m, n);
    return NaN(dims);
}
//=============================================================================
ArrayOf
NaN(Dimensions& dims)
{
    dims.simplify();
    indexType nbElements = dims.getElementCount();
    double* mat = nullptr;
    if (nbElements != 0) {
        mat = static_cast<double*>(
            ArrayOf::allocateArrayOf(NLS_DOUBLE, nbElements, stringVector(), false));
        std::fill_n(mat, nbElements, std::nan("NaN"));
    }
    return ArrayOf(NLS_DOUBLE, dims, mat, false);
}
//=============================================================================
} // namespace Nelson
//=============================================================================
