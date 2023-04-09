%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
R = num2cell({});
assert_isequal(R, {});
%=============================================================================
A = [1 2; 3 4]
R = num2cell(A);
REF = {1, 2; 3, 4};
assert_isequal(R, REF);
%=============================================================================
A = ["ff", "ll", "mm"];
R = num2cell(A);
REF = {"ff", "ll", "mm"};
assert_isequal(R, REF);
%=============================================================================
Q.s = 'f';
R = num2cell(Q);
REF = { Q };
assert_isequal(R, REF);
%=============================================================================
A = reshape(1:12,4,3);
A(:,:,2) = A*10;
R = num2cell(A, 1);
REF = [1;2;3;4];
RR = R{1}(:);
assert_isequal(RR, REF);
%=============================================================================
