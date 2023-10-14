%=============================================================================
% Copyright (c) 2023-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
sysA = tf(3);
sysB = tf(4);
sys = sysA * sysB;
REF = tf(12);
assert_isequal(sys, REF);
%=============================================================================
num = [3 4];
den = [3 1 5];
Ts = 0.2;
sys = tf(num, den, Ts);
R = sys * 2;
REF = tf([6 8], [3 1 5], Ts);
assert_isequal(R, REF);
%=============================================================================