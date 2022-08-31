%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
assert_isequal(nargin('wilkinson'), -1)
assert_isequal(nargout('wilkinson'), 1)
%=============================================================================
R = wilkinson([]);
REF = [];
assert_isequal(R, REF);
%=============================================================================
msg = [sprintf(_('Invalid input argument at position %d.'), 1), char(10),  _('Value must be integer.')];
assert_checkerror('R = wilkinson(NaN)', msg);
%=============================================================================
msg = [sprintf(_('Invalid input argument at position %d.'), 1), char(10),  _('Value must be integer.')];
assert_checkerror('R = wilkinson(NaN)', msg);
%=============================================================================
R = wilkinson(0);
REF = [];
assert_isequal(R, REF);
%=============================================================================
R = wilkinson(1);
REF = 0;
assert_isequal(R, REF);
%=============================================================================
R = wilkinson(2);
REF = [0.5, 1; 1, 0.5];
assert_isequal(R, REF);
%=============================================================================
R = wilkinson(3);
REF = [1,1,0;1,0,1;0,1,1];
assert_isequal(R, REF);
%=============================================================================
R = wilkinson(4);
REF = [1.5, 1, 0, 0;1, 0.5, 1 ,0;0, 1, 0.5, 1; 0, 0, 1 ,1.5];
assert_isequal(R, REF);
%=============================================================================
