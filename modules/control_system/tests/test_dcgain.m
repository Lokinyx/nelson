%=============================================================================
% Copyright (c) 2023-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
H = [1 tf([1 -1],[1 1 3]) ; tf(1,[1 1]) tf([1 2],[1 -3])];
K = dcgain(H);
REF = [1.0000   -0.3333; 1.0000   -0.6667];
assert_isapprox(K, REF, 1e-3);
%=============================================================================
A = [1 2; 3 4];
B = [1 0; 0 1];
C = [1 1; 1 1];
D = [0 0; 0 0];
sys = ss(A, B, C, D);
K = dcgain(sys);
REF = [0.5000   -0.5000; 0.5000   -0.5000];
assert_isapprox(K, REF, 1e-3);
%=============================================================================