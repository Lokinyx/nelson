%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
R = bartlett([]);
REF = zeros(0, 1);
assert_isequal(R, REF);
%=============================================================================
R = bartlett(1);
REF = 1;
assert_isequal(R, REF);
%=============================================================================
assert_checkerror('R = bartlett(-4)', _('M must be a positive integer.'));
%=============================================================================
R = bartlett(8);
REF = [0; 0.2857; 0.5714; 0.8571; 0.8571; 0.5714; 0.2857; 0];
assert_isapprox(R, REF, 1e-4);
%=============================================================================
