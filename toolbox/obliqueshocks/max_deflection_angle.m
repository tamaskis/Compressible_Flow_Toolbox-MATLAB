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
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-25
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed. (p. 136)
%   [2] Cantwell, AA 210A Course Reader (Stanford University) (pp. 12-5 to 
%       12-7)
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
function theta = max_deflection_angle(M1,gamma)

    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end

    % initializes vector to store maximum deflection angles
    theta_max = zeros(size(M1));

    % optimization for each M1
    for i = 1:length(M1)

        % defines theta as a function of beta for optimization
        theta = @(beta) deflection_angle(M1(i),beta,gamma);
        
        % minimum and maximum possible shock angles
        beta_min = asin(1/M1(i));
        beta_max = pi/2;
    
        % finds maximum shock angle [rad]
        [~,theta_max(i)] = fminbnd(theta,beta_min,beta_max);

    end

end