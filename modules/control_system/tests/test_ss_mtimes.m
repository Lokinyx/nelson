%=============================================================================
% Copyright (c) 2023-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
A = [1 2; 3 4];
B = [1 0; 0 1];
C = [1 1; 1 1];
D = [1 2; 3 4];
sys = ss(A, B, C, D);
R = sys * sys
REF_A = [1     2     1     1;
3     4     1     1;
0     0     1     2;
0     0     3     4];
REF_B = [1     2;
3     4;
1     0;
0     1];
REF_C = [1     1     3     3;
1     1     7     7];
REF_D = [7    10;
15    22];
REF = ss(REF_A, REF_B, REF_C, REF_D);
assert_isequal(R, REF);
%=============================================================================
R = sys * 2;
REF_A = [1   2;
3   4];
REF_B = [2   0;
0   2];
REF_C = ones(2, 2); 
REF_D = [2   4;
6   8];
REF = ss(REF_A, REF_B, REF_C, REF_D);
assert_isequal(R, REF);
%=============================================================================
