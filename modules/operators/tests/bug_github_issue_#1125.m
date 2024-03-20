%=============================================================================
% Copyright (c) 2017 Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% <-- Issue URL -->
% https://github.com/nelson-lang/nelson/issues/1125
% <-- Short Description -->
% Unsupported colon operator with char operands
%=============================================================================
R = 'Z':-1:'A';
REF = 'ZYXWVUTSRQPONMLKJIHGFEDCBA';
assert_isequal(R, REF);
%=============================================================================
