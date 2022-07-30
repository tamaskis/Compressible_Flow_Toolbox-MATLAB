%==========================================================================
%
% Mstar_to_M  Local Mach number from characteristic Mach number.
%
%   M = Mstar_to_M(M_star)
%   M = Mstar_to_M(M_star,gamma)
%
% See also M_to_Mstar.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-20
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
%   M_star  - (1×1 double) characteristic Mach number, M*
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M       - (1×1 double) local Mach number, M
%
%==========================================================================
function M = Mstar_to_M(M_star,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 2) || isempty(gamma)
        gamma = 1.4;
    end
    
    % local Mach number
    M = 2/(((gamma+1)/(M_star^2))-(gamma-1));
    
end