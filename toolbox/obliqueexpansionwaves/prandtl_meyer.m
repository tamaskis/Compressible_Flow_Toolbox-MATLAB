%==========================================================================
%
% prandtl_meyer  Prandtl-Meyer function.
%
%   w = prandtl_meyer(M)
%   w = prandtl_meyer(M,gamma)
%
% See also prandtl_meyer_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M       - (1D double array) local Mach number
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   w       - (1D double array) angle required to accelerate flow from Mach
%             1 to the local Mach number [rad]
%
%==========================================================================
function w = prandtl_meyer(M,gamma)

    % ----------------------------------------------------
    % Sets unspecified parameters to their default values.
    % ----------------------------------------------------
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % -------------
    % Calculations.
    % -------------
    
    w = sqrt((gamma+1)/(gamma-1))*atan(sqrt(((gamma-1)/(gamma+1))*(M.^2-...
        1)))-atan(sqrt(M.^2-1));
    
end