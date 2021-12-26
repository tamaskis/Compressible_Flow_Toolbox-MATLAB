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
% Copyright © 2021 Tamas Kis
% Last Update: 2021-09-20
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed.
%   [2] Cantwell, AA 210A Course Reader (Stanford University)
%   [3] https://en.wikipedia.org/wiki/Rayleigh_flow
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   Tt1     - (1D double array) station 1 stagnation temperature [K]
%   Tt2     - (1D double array) station 2 stagnation temperature [K]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%   R       - (OPTIONAL) (1×1 double) specific gas constant [J/(kg.K)]
%               --> defaults 287 J/(kg.K)
%
% -------
% OUTPUT:
% -------
%   q       - (1D double array) (specific) heat addition between stations 1
%             and 2 [J/kg]
%
%==========================================================================
function q = rayleigh_heat(Tt1,Tt2,gamma,R)

    % ----------------------------------------------------
    % Sets unspecified parameters to their default values.
    % ----------------------------------------------------
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % defaults "R" to 287 J/(kg.K) if not specified
    if (nargin < 4) || isempty(R)
        R = 287;
    end
    
    % -------------
    % Calculations.
    % -------------
    
    q = (gamma*R*(Tt2-Tt1))/(gamma-1);
    
end