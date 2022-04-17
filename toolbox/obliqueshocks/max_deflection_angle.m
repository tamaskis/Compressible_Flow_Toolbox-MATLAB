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
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M1          - (1D double array) upstream Mach number
%   gamma       - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 
%                 1.4)
%
% -------
% OUTPUT:
% -------
%   theta_max   - (1D double array) maximum deflection angle [rad]
%
%==========================================================================
function theta_max = max_deflection_angle(M1,gamma)

    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end

    % preallocates vector to store maximum deflection angles
    theta_max = zeros(size(M1));
    
    % finds maximum shock angle [rad] for each M1
    for i = 1:length(M1)

        % minimum and maximum β's for a given M1
        beta_min = asin(1/M1(i));
        beta_max = pi/2;

        % objective function to minimize
        f = @(beta) -deflection_angle(M1(i),beta,gamma);
        
        % finds negative of maximum shock angle
        [~,theta_max(i)] = fminbnd(f,beta_min,beta_max);
        
    end

    % flips sign on theta_max
    theta_max = -theta_max;

end