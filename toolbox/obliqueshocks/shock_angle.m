%==========================================================================
%
% shock_angle  Calculates the shock angle (i.e. the angle an oblique shock 
% forms with the upstream flow direction).
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
% https://tamaskis.github.io/files/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M1          - (1×1 double) upstream Mach number
%   theta       - (1×1 double) deflection angle [rad]
%   gamma       - (1×1 double) (OPTIONAL) specific heat ratio (defaults to 
%                 1.4)
%
% -------
% OUTPUT:
% -------
%   beta_weak   - (1×1 double) shock angle (weak solution) [rad]
%   beta_strong - (1×1 double) shock angle (strong solution) [rad]
%
%==========================================================================
function [beta_weak,beta_strong] = shock_angle(M1,theta,gamma)
    
    % define a function g(beta)
    g = @(beta) 2*cot(beta)*((M1^2*sin(beta)^2-1)/(M1^2*(gamma+...
        cos(2*beta))+2))-tan(theta);
    
    % weakest and strongest possible shock angles
    beta_min = asin(1/M1);
    beta_max = pi/2;
    
    % defines initial guesses
    beta1 = 0.1*beta_min;
    beta2 = 0.9*beta_max;
    
    % calculates weak and strong solutions for the shock angle
    beta_weak = newtons_method(g,beta1);
    beta_strong = newtons_method(g,beta2);
    
end