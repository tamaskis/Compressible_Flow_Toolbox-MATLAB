%==========================================================================
%
% rayleigh_heat  Determines the (specific) heat addition between two 
% stations in a Rayleigh flow.
%
%   q = rayleigh_heat(Tt1,Tt2)
%   q = rayleigh_heat(Tt1,Tt2,gamma,R)
%
% See also rayleigh_heat_inverse, rayleigh_station,
% rayleigh_station_inverse, rayleigh_sonic, rayleigh_sonic_inverse.
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
%   Tt1     - (1×1 double) station 1 stagnation temperature, Tₜ₁ [K]
%   Tt2     - (1×1 double) station 2 stagnation temperature, Tₜ₂ [K]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%   R       - (OPTIONAL) (1×1 double) specific gas constant, R [J/(kg.K)] 
%             (defaults to 287 J/(kg.K))
%
% -------
% OUTPUT:
% -------
%   q       - (1×1 double) specific heat addition between stations 1 and 2 
%             [J/kg]
%
%==========================================================================
function q = rayleigh_heat(Tt1,Tt2,gamma,R)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % defaults "R" to 287 J/(kg.K) if not specified
    if (nargin < 4) || isempty(R)
        R = 287;
    end
    
    % specific heat addition between stations 1 and 2 [J/kg]
    q = (gamma*R*(Tt2-Tt1))/(gamma-1);
    
end