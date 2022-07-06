%==========================================================================
%
% max_deflection_angle  Calculates the maximum deflection angle given the 
% upstream Mach.
%
%   theta_max = max_deflection_angle(M1)
%   theta_max = max_deflection_angle(M1,gamma)
%
% See also deflection_angle, shock_angle.
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
%   M1          - (1×1 double) upstream Mach number
%   gamma       - (1×1 double) (OPTIONAL) specific heat ratio (defaults to 
%                 1.4)
%
% -------
% OUTPUT:
% -------
%   theta_max   - (1×1 double) maximum deflection angle [rad]
%
%==========================================================================
function theta_max = max_deflection_angle(M1,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % minimum and maximum β's for a given M1
    beta_min = asin(1/M1);
    beta_max = pi/2;

    % finds negative of maximum shock angle [rad]
    [~,theta_max] = fminbnd(@(beta)-deflection_angle(M1,beta,gamma),...
        beta_min,beta_max);
    
    % maximum shock angle [rad]
    theta_max = -theta_max;
    
end