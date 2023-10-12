%=============================================================================
% Copyright (c) 2023-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
assert_isequal(nargin('isstatic'), 1);
assert_isequal(nargout('isstatic'), 1);
%=============================================================================
S = tf(3);
assert_istrue(isstatic(S));
%=============================================================================
S = tf(3,2);
assert_isfalse(isstatic(S));
%=============================================================================
D = [2,4;3,5];
sys1 = ss(D)
sys1.Ts = 0.2;
assert_istrue(isstatic(sys1));
%=============================================================================
J = [8 -3 -3; -3 8 -3; -3 -3 8];
F = 0.2*eye(3);
A = -J\F;
B = inv(J);
C = eye(3);
D = 0;
sys = ss(A,B,C,D);
assert_isfalse(isstatic(sys));
%=============================================================================
