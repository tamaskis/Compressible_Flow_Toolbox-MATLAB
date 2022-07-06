%==========================================================================
%
% characteristic_mach  Characteristic Mach number from local Mach number.
%
%   M_star = characteristic_mach(M)
%   M_star = characteristic_mach(M,gamma)
%
% See also characteristic_mach_inverse.
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
%   M       - (1×1 double) local Mach number
%   gamma   - (1×1 double) (OPTIONAL) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M_star  - (1×1 double) characteristic Mach number
%
%==========================================================================
function M_star = characteristic_mach(M,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % characteristic Mach number
    M_star = sqrt((M*(gamma+1))/(2+M*(gamma-1)));
    
end