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
%   M_star  - (1×1 double) characteristic Mach number
%   gamma   - (1×1 double) (OPTIONAL) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M       - (1×1 double) local Mach number
%
%==========================================================================
function M = characteristic_mach_inverse(M_star,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % local Mach number
    M = 2/(((gamma+1)/(M_star^2))-(gamma-1));
    
end