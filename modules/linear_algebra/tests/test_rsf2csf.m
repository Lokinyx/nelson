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
U = [0.4282,    0.0425,    0.8965,   -0.1054;
    0.5192,   -0.2047,   -0.1421,    0.8175;
    0.7309,   -0.0320,   -0.4114,   -0.5436;
    0.1140,    0.9774,   -0.0822,    0.1580];
    
T = [4.4522,    1.6545,   -0.5498,    0.3187;
         0,    0.5742,   -2.3726,    0.4390;
         0,    1.1464,    0.5742,    0.5319;
         0,         0,         0,    1.3994];
%=============================================================================
[UN, TN] = rsf2csf(U, T);
%=============================================================================
UN_REF = [0.4282, 0.5117 + 0.0349i  -0.0243 - 0.7361i  -0.1054;
         0.5192, -0.0811 - 0.1681i   0.1168 + 0.1167i   0.8175;
         0.7309, -0.2348 - 0.0263i   0.0183 + 0.3378i  -0.5436;
         0.1140, -0.0469 + 0.8026i  -0.5579 + 0.0675i   0.1580];

TN_REF = [4.4522, -0.3138 + 1.3585i,  -0.9443 + 0.4514i,   0.3187;
              0,  0.5742 + 1.6492i,   1.2262          ,   0.3036 - 0.3605i;
              0                  0,   0.5742 - 1.6492i,  -0.2506 + 0.4367i;
              0,                 0,                  0,            1.3994];
%=============================================================================
assert_isapprox(UN, UN_REF, 1e-4);
assert_isapprox(TN, TN_REF, 1e-4);
%=============================================================================
