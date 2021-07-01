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
assert_isequal(nargin('rmfield'), 2);
assert_isequal(nargout('rmfield'), 1);
%=============================================================================
S.first = 1;
S.second = 2;
S.third = 3;
S.fourth = 4;
fields = {'second','fourth'};
R = rmfield(S, fields);
REF.first = 1;
REF.third = 3;
assert_isequal(R, REF);
%=============================================================================
A(1,1).first = 1;
A(1,1).second = 2;
A(1,1).third = 3;
A(2,1).first = 4;
A(2,1).second = 5;
A(2,1).third = 6;
A(2,2).first = 7;
A(2,2).second = 8;
A(2,2).third = 9;
R = rmfield(A, 'second');
REF2(1,1).first = 1;
REF2(1,1).third = 3;
REF2(2,1).first = 4;
REF2(2,1).third = 6;
REF2(2,2).first = 7;
REF2(2,2).third = 9;
assert_isequal(R, REF2);
%=============================================================================