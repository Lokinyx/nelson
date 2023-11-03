%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% <--ADV-CLI MODE-->
%=============================================================================
Y = single (1:10);
X = double ([1, 5, 10]);
[n, x] = hist(Y, X);
assert_isequal(n, [3     4     3]);
assert_isequal(x, [ 1     5    10]);
%=============================================================================
Y = [1  9  2  2  9  3  8  9  1  7  1  1  3  2  4  4  8  2  1  9  4  1  2  3  1  1  6  5  5  3  9  9  1  1  8  7  7  2  4  1];
[n, x] = hist(Y, 8);
assert_isequal(n, [17     4     4     2     1     3     3     6]);
assert_isequal(x, [1.5000    2.5000    3.5000    4.5000    5.5000    6.5000    7.5000    8.5000]);
%=============================================================================
Y = [1  9  2  2  9  3  8  9  1  7  1  1  3  2  4  4  8  2  1  9  4  1  2  3  1  1  6  5  5  3  9  9  1  1  8  7  7  2  4  1];
hist(Y, 8);
%=============================================================================
hist([0 2 9 2 5 8 7 3 1 9 4 3 5 8 10 0 1 2 9 5 10])
%=============================================================================
hist(randn(1000, 1), 50)
%=============================================================================
