//=============================================================================
// Copyright (c) 2016-present Allan CORNET (Nelson)
//=============================================================================
// This file is part of the Nelson.
//=============================================================================
// LICENCE_BLOCK_BEGIN
// SPDX-License-Identifier: LGPL-3.0-or-later
// LICENCE_BLOCK_END
//=============================================================================
#pragma once
//=============================================================================
#include "Types.hpp"
#include "nlsText_completion_exports.h"
#include <string>
//=============================================================================
namespace Nelson {
NLSTEXT_COMPLETION_IMPEXP wstringVector
MethodCompleter(const std::wstring& prefix);
};
//=============================================================================
