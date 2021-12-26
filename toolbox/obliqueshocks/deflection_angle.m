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
%       12-6)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M1      - (1×1 double) upstream Mach number
%   beta    - (1D double array) shock angle [rad]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   theta   - (1D double array) deflection angle [rad]
%
%==========================================================================
function theta = deflection_angle(M1,beta,gamma)

    % defaults "gamma" to 1.4 if not specified
    if (nargin == 2) || isempty(gamma)
        gamma = 1.4;
    end

    % deflection angle [rad]
    theta = atan(2*cos(beta).*((M1^2*sin(beta).^2-1)./(M1^2*(gamma+cos(...
        2*beta))+2)));

end