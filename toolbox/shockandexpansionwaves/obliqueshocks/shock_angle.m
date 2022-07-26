%==========================================================================
%
% shock_angle  Calculates the shock angle given the upstream Mach number 
% and the deflection angle.
%
%   [beta_weak,beta_strong] = shock_angle(M1,theta)
%   [beta_weak,beta_strong] = shock_angle(M1,theta,gamma)
%
% See also deflection_angle, max_deflection_angle.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-24
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
%   theta       - (1×1 double) deflection angle, θ [rad]
%   gamma       - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults 
%                 to 1.4)
%
% -------
% OUTPUT:
% -------
%   beta_weak   - (1×1 double) shock angle, β (weak solution) [rad]
%   beta_strong - (1×1 double) shock angle, β (strong solution) [rad]
%
% -----
% NOTE:
% -----
%   --> In nature, the weak solution is the one that generally occurs.
%
%==========================================================================
function [beta_weak,beta_strong] = shock_angle(M1,theta,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 2) || isempty(gamma)
        gamma = 1.4;
    end
    
    % defines the function g(β)
    g = @(beta) 2*cot(beta)*((M1^2*sin(beta)^2-1)/(M1^2*(gamma+...
        cos(2*beta))+2))-tan(theta);
    
    % shock angles for weakest and strongest possible oblique shocks [rad]
    beta_min = asin(1/M1);
    beta_max = pi/2;
    
    % defines initial guesses [rad]
    beta0_weak = 0.9*beta_min;
    beta0_strong = 1.1*beta_max;
    
    % weak and strong solutions for the shock angle [rad]
    beta_weak = secant_method(g,beta0_weak);
    beta_strong = secant_method(g,beta0_strong);
    
end