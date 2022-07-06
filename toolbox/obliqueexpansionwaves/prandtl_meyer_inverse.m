%==========================================================================
%
% prandtl_meyer_inverse  Inverse Prandtl-Meyer function.
%
%   M = prandtl_meyer_inverse(w)
%   M = prandtl_meyer_inverse(w,gamma)
%
% See also prandtl_meyer_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-16
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
%   w       - (1×1 double) angle required to accelerate flow from 
%             Mach 1 to the local Mach number [rad]
%   gamma   - (1×1 double) (OPTIONAL) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M       - (1×1 double) local Mach number
%
%==========================================================================
function M = prandtl_meyer_inverse(w,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % calculates M using a root finding procedure
    M = secant_method(@(M)prandtl_meyer(M,gamma)-w,1.5);
    
end