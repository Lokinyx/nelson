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
#include "GORestrictedStringProperty.hpp"
//=============================================================================
namespace Nelson {
//=============================================================================
enum class TEXT_INTERPRETER_FORMAT
{
    TEX_MARKUP,
    LATEX_MARKUP,
    NONE
};
//=============================================================================
class GOTextInterpreterProperty : public GORestrictedStringProperty
{
public:
    GOTextInterpreterProperty();
    ~GOTextInterpreterProperty() override = default;
    TEXT_INTERPRETER_FORMAT
    getAsEnum();
};
//=============================================================================
};
//=============================================================================
