%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
format('short')
format('loose')
fh = str2func('cos');
%=============================================================================
R = evalc('disp(fh)');
REF =  '    @cos

';
assert_isequal(R, REF);
%=============================================================================
R = evalc('display(fh)');
REF =   '
fh =

  function_handle with value:

    @cos

';
assert_isequal(R, REF);
%=============================================================================
