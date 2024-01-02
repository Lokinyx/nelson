%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
assert_isequal(nargin('cumsum'), 4);
assert_isequal(nargout('cumsum'), 1);
%=============================================================================
A = 1:5;
R = cumsum(A);
REF = [1     3     6    10    15];
assert_isequal(R, REF);
%=============================================================================
A = single(1:5);
R = cumsum(A);
REF = single([1     3     6    10    15]);
assert_isequal(R, REF);
%=============================================================================

A = [1 4 7; 2 5 8; 3 6 9];
R = cumsum(A);
REF = [  1     4     7;
3     9    15;
6    15    24];
assert_isequal(R, REF);
%=============================================================================
A = [1 3 5; 2 4 6];
R = cumsum(A, 2);
REF = [ 1     4     9;
2     6    12];
assert_isequal(R, REF);
%=============================================================================
A = [true, false, true; true, true, false];
R = cumsum(A, 2);
REF = [  1     1     2;
1     2     2];
assert_isequal(R, REF);
%=============================================================================
A = [9    10     3;
10     7     6;
2     1    10];
R = cumsum(A, 2, 'reverse');
REF = [ 22    13     3;
23    13     6;
13    11    10];
assert_isequal(R, REF);
%=============================================================================
A = [3 5 NaN 9 0 NaN];
R = cumsum(A);
REF = [3     8   NaN   NaN   NaN   NaN];
assert_isequal(R, REF);
%=============================================================================
A = [3 5 NaN 9 0 NaN];
R = cumsum(A, 'omitnan');
REF = [3     8     8    17    17    17];
assert_isequal(R, REF);
%=============================================================================
A = 1 + [   9    10     3;1     7     6; 2     1    1] * i;
R = cumsum(A);
REF = [   1.0000 + 9.0000i,   1.0000 + 10.0000i,   1.0000 + 3.0000i;
2.0000 + 10.0000i,   2.0000 + 17.0000i,   2.0000 + 9.0000i;
3.0000 + 12.0000i,   3.0000 + 18.0000i,   3.0000 + 10.0000i];
assert_isapprox(R, REF, 1e-4);
%=============================================================================
