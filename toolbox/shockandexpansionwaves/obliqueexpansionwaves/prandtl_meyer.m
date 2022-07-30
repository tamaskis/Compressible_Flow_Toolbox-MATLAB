%==========================================================================
%
% prandtl_meyer  Prandtl-Meyer function.
%
%   nu = prandtl_meyer(M)
%   nu = prandtl_meyer(M,gamma)
%
% See also prandtl_meyer_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-28
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/files/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M       - (1×1 double) local Mach number, M
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   nu      - (1×1 double) Prandtl-Meyer angle, ν [rad]
%
%==========================================================================
function nu = prandtl_meyer(M,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 2) || isempty(gamma)
        gamma = 1.4;
    end
    
    % Prandtl-Meyer angle [rad]
    nu = sqrt((gamma+1)/(gamma-1))*atan(sqrt(((gamma-1)/(gamma+1))*(M^2-...
        1)))-atan(sqrt(M^2-1));
    
end