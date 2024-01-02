%=============================================================================
% Copyright (c) 2017 October Daniel Mårtensson (Swedish Embedded Control Systems Toolbox)
% Copyright (c) 2023-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
function varargout = minreal(varargin)
  % Minimal realization and pole-zero cancellation.
  % sysOut = minreal(sysIn)
  % sysOut = minreal(sysIn, tol)
  narginchk(1, 2);
  nargoutchk(0, 1);
  
  sysIn = varargin{1};
  
  if nargin < 2
    tol = 1e-6;
  else
    tol = varargin{2};
  end
  
  [am, bm, cm, dm] = minreal(sysIn.A, sysIn.B, sysIn.C, sysIn.D, tol);
  varargout{1} = ss(am, bm, cm, dm, sysIn.Ts);
end
%=============================================================================
