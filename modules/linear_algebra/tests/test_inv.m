%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% Alternatively, you can redistribute it and/or
% modify it under the terms of the GNU General Public License as
% published by the Free Software Foundation; either version 2 of
% the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public
% License along with this program. If not, see <http://www.gnu.org/licenses/>.
% LICENCE_BLOCK_END
%=============================================================================
assert_isequal(nargin('inv'), 1);
assert_isequal(nargout('inv'), 1);
%=============================================================================
assert_isequal(inv([]), []);
assert_isequal(inv(NaN), NaN);
assert_isequal(inv(Inf), 0);
%=============================================================================
assert_isapprox(inv([1, 2; 3, 4]), [-2, 1; 1.5, -0.5], 1e-15);
assert_isapprox(inv(eye(3, 3)), eye(3, 3), 1e-15);
assert_isapprox(inv(single([1, 2; 3, 4])), single([-2, 1; 1.5, -0.5]), 1e-6);
%=============================================================================
assert_isapprox(inv([i, 2; i, 4]), [-2i  i; -0.5, 0.5], 1e-15);
%=============================================================================
assert_isequal(inv([0 0;2 3]), [Inf, Inf; Inf, Inf]);
assert_isequal(inv([2 NaN;2 3]) , [NaN, NaN; NaN, NaN])
if ~ismac()
  assert_isequal(inv([2 Inf;2 3]), [NaN, NaN; 0 0])
  assert_isapprox(inv([0 Inf;2 3]), [0 0.5; 0 0], 1e-15);
end
%=============================================================================
assert_isequal(inv([0 0;i() 3]), [Inf, Inf; Inf, Inf]);
assert_isapprox(inv([i Inf;2 3]), [0, .5; 0, 0], 1e-4);
assert_isequal(inv([2 NaN;2i 3]), complex([NaN, NaN; NaN, NaN], [NaN, NaN; NaN, NaN]))
assert_isapprox(inv([i Inf;2 3]), [0, .5; 0, 0], 1e-4);
%=============================================================================
A = [4,2,2;4,6,8;-2,2,4];
REF = [1.0000   -0.5000    0.5000;
-4.0000    2.5000   -3.0000;
2.5000   -1.5000    2.0000];
assert_isapprox(inv(A), REF, 1e-15);
%=============================================================================
assert_isequal(inv(single([])), single([]));
assert_isequal(inv(single(NaN)), single(NaN));
assert_isequal(inv(single(Inf)), single(0));
%=============================================================================
assert_isapprox(inv(single([1, 2; 3, 4])), single([-2, 1; 1.5, -0.5]), 1e-4);
assert_isapprox(inv(single(eye(3, 3))), single(eye(3, 3)), 1e-15);
assert_isapprox(inv(single([1, 2; 3, 4])), single([-2, 1; 1.5, -0.5]), 1e-6);
%=============================================================================
assert_isapprox(inv(single([i, 2; i, 4])), single([-2i  i; -0.5, 0.5]), 1e-15);
%=============================================================================
assert_isequal(inv(single([0 0;2 3])), single([Inf, Inf; Inf, Inf]));
assert_isequal(inv(single([2 NaN;2 3])) , single([NaN, NaN; NaN, NaN]))
if ~ismac()
  assert_isequal(inv(single([2 Inf;2 3])), single([NaN, NaN; 0 0]))
  assert_isapprox(inv(single([0 Inf;2 3])), single([0 0.5; 0 0]), 1e-15);
end
%=============================================================================
assert_isequal(inv(single([0 0;i() 3])), single([Inf, Inf; Inf, Inf]));
assert_isapprox(inv(single([i Inf;2 3])), [0 0.5; 0, 0], 1e-4);
assert_isequal(inv(single([2 NaN;2i 3])), complex(single([NaN, NaN; NaN, NaN]), single([NaN, NaN; NaN, NaN])))
%=============================================================================
A = single([4,2,2;4,6,8;-2,2,4]);
REF = [1.0000   -0.5000    0.5000;
-4.0000    2.5000   -3.0000;
2.5000   -1.5000    2.0000];
REF = single(REF);
assert_isapprox(inv(A), REF, 1e-15);
%=============================================================================
A = diag([1 2 3 4 5]);
R = inv(A);
REF = diag(1 ./ [1 2 3 4 5]);
assert_isequal(R, REF);
%=============================================================================
assert_checkerror('inv(zeros(3,5))', _('Square matrix expected.'));
%=============================================================================