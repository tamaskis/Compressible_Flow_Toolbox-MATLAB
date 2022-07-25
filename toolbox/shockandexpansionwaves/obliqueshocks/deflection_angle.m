%==========================================================================
%
% deflection_angle  Calculates the deflection angle given the upstream Mach
% number and the shock angle.
%
%   theta = deflection_angle(M1,beta)
%   theta = deflection_angle(M1,beta,gamma)
%
% See also max_deflection_angle, shock_angle.
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
%   M1      - (1×1 double) upstream Mach number, M₁
%   beta    - (1×1 double) shock angle, β [rad]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   theta   - (1×1 double) deflection angle, θ [rad]
%
%==========================================================================
function theta = deflection_angle(M1,beta,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 2) || isempty(gamma)
        gamma = 1.4;
    end
    
    % deflection angle [rad]
    theta = atan(2*cot(beta)*((M1^2*sin(beta)^2-1)/(M1^2*(gamma+cos(2*...
        beta))+2)));
    
end