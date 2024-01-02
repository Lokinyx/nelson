%=============================================================================
% Copyright (c) 2023-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
p = [-0.2410+ 0.5573i;  -0.2410- 0.5573i; 0.1503; -0.0972;-0.2590];
[R, idx] = esort(p);
REF = [0.1503 + 0.0000i;
-0.0972 + 0.0000i;
-0.2410 + 0.5573i;
-0.2410 - 0.5573i;
-0.2590 + 0.0000i];
assert_isapprox(R, REF)
%=============================================================================
IDX = [3; 4; 1; 2; 5];
assert_isequal(idx, IDX);
%=============================================================================
