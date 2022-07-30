%==========================================================================
%
% max_deflection_angle  Calculates the maximum deflection angle given the 
% upstream Mach number.
%
%   theta_max = max_deflection_angle(M1)
%   theta_max = max_deflection_angle(M1,gamma)
%
% See also deflection_angle, shock_angle.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-26
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
%   M1          - (1×1 double) upstream Mach number, M₁
%   gamma       - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults 
%                 to 1.4)
%
% -------
% OUTPUT:
% -------
%   theta_max   - (1×1 double) maximum deflection angle, θₘₐₓ [rad]
%
%==========================================================================
function theta_max = max_deflection_angle(M1,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 2) || isempty(gamma)
        gamma = 1.4;
    end
    
    % minimum and maximum β's for the given M₁ [rad]
    beta_min = asin(1/M1);
    beta_max = pi/2;
    
    % defines θ(β) using the deflection_angle function
    theta = @(beta) deflection_angle(M1,beta,gamma);
    
    % finds negative of maximum deflection angle [rad]
    [~,theta_star] = fminbnd(-theta,beta_min,beta_max);
    
    % maximum deflection angle [rad]
    theta_max = -theta_star;
    
end