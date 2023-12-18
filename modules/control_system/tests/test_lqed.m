%=============================================================================
% Copyright (c) 2023-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
A = [1     2;  3     4];
B = [1     0; 0     1];
C = B;
D = [0,0;0,0];
R = [2,0;0,3];
Q = [5,0;0,4];
G = [6,0;0,7];
Ts = 0.002;
[l, p, z, e] = lqed(A, G, C, Q, R, Ts);

l_REF = [0.0214    0.0049; 0.0074    0.0263];
p_REF = [21.9116    7.7515;  7.7515   40.5364];
z_REF = [21.4044    7.3860; 7.3860   39.4140];
e_REF = [0.9797; 0.9824];

assert_isapprox(l, l_REF, 1e-2);
assert_isapprox(p, p_REF, 1e-4);
assert_isapprox(z, z_REF, 1e-4);
assert_isapprox(e, e_REF, 1e-4);
%=============================================================================
