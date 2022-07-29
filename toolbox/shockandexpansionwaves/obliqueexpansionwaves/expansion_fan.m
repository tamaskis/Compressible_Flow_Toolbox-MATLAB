%==========================================================================
%
% expansion_fan  TODO
%
%   M2 = expansion_fan(M1,theta)
%   M2 = expansion_fan(M1,theta,gamma)
%
% See also prandtl_meyer_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-29
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
%   M1      - (1×1 double) upstream Mach number, M₁
%   theta   - (1×1 double) turn angle, θ [rad]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M2      - (1×1 double) downstream Mach number, M₂
%
%==========================================================================
function M2 = expansion_fan(M1,theta,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % upstream Prandtl-Meyer angle [rad]
    nu1 = prandtl_meyer(M1,gamma);
    
    % downstream Prandtl-Meyer angle [rad]
    nu2 = nu1+abs(theta);
    
    % downstream Mach number
    M2 = prandtl_meyer_inverse(nu2,gamma);
    
end