%==========================================================================
%
% prandtl_meyer_inverse  Inverse Prandtl-Meyer function.
%
%   M = prandtl_meyer_inverse(nu)
%   M = prandtl_meyer_inverse(nu,gamma)
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
%   nu      - (1×1 double) Prandtl-Meyer angle, ν [rad]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M       - (1×1 double) local Mach number, M
%
%==========================================================================
function M = prandtl_meyer_inverse(nu,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % defines g(M) using the prandtl_meyer function
    g = @(M) prandtl_meyer(M,gamma)-nu;
    
    % local Mach number for given ν
    M = secant_method(g,1.5);
    
end