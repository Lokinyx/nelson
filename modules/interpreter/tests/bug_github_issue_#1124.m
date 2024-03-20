%=============================================================================
% Copyright (c) 2017 Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% <-- Issue URL -->
% https://github.com/nelson-lang/nelson/issues/1124
% <-- Short Description -->
% unexpected result from long statements on Multiple Lines.
%=============================================================================
R = 0.56699999-0.222477777411/0.147778522699^4.3555555 ...
         +1.428877/8.667774;
REF = -919.9098;
assert_isapprox(R, REF, 1e-4);
%=============================================================================
x = [1.2300...
4.5600];
assert_isequal(size(x), [1 2]);
%=============================================================================
x = [1.2300 ...
4.5600];
assert_isequal(size(x), [1 2]);
%=============================================================================