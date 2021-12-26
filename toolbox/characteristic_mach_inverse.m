%==========================================================================
%
% characteristic_mach_inverse  Local Mach number from characteristic Mach 
% number.
%
%   M = characteristic_mach_inverse(M_star)
%   M = characteristic_mach_inverse(M_star,gamma)
%
% See also characteristic_mach.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-24
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed. (p. 82)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M_star  - (1D double array) characteristic Mach number
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M       - (1D double array) local Mach number
%
%==========================================================================
function M = characteristic_mach_inverse(M_star,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % local Mach number
    M = 2./(((gamma+1)./(M_star.^2))-(gamma-1));
    
end