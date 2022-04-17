%==========================================================================
%
% mach_oblique  C.
%
%   [beta_weak,beta_strong] = shock_angle(M1,theta)
%   [beta_weak,beta_strong] = shock_angle(M1,theta,gamma)
%
% See also deflection_angle, max_deflection_angle.
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
%   M_in    - (1D double array) input Mach number
%   theta   - (1D double array) deflection angle [rad]
%   beta    - (OPTIONAL) (1D double array) shock angle [rad]
%
% -------
% OUTPUT:
% -------
%   M_out   - (1D double array) output Mach number
%   beta_strong - (1D double array) shock angle (strong solution) [rad]
%
%==========================================================================
function M_out = mach_oblique(M_in,beta,theta)

    % Mn1 given M1 and β
    if nargin == 2
        M_out = M_in.*sin(beta);

    % Mn2 given M2, β, and θ
    else
        M_out = M_in.*sin(beta-theta);

    end
    
end