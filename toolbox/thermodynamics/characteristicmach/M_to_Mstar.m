%==========================================================================
%
% M_to_Mstar  Characteristic Mach number from local Mach number.
%
%   M_star = M_to_Mstar(M)
%   M_star = M_to_Mstar(M,gamma)
%
% See also Mstar_to_M.
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
%   M       - (1×1 double) local Mach number, M
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M_star  - (1×1 double) characteristic Mach number, M*
%
%==========================================================================
function M_star = M_to_Mstar(M,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 2) || isempty(gamma)
        gamma = 1.4;
    end
    
    % characteristic Mach number
    M_star = sqrt((M*(gamma+1))/(2+M*(gamma-1)));
    
end