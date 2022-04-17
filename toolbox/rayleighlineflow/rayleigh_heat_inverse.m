%==========================================================================
%
% rayleigh_heat_inverse  Determines the stagnation temperature at one
% station in a Rayleigh flow given the stagnation temperature at the other
% station and the (specific) heat addition between the two stations.
%
%   Tt1 = rayleigh_heat_inverse('Tt2',Tt2,q)
%   Tt1 = rayleigh_heat_inverse('Tt2',Tt2,q,gamma,R)
%   Tt2 = rayleigh_heat_inverse('Tt1',Tt1,q)
%   Tt2 = rayleigh_heat_inverse('Tt1',Tt1,q,gamma,R)
%
% See also rayleigh_heat, rayleigh_station, rayleigh_station_inverse, 
% rayleigh_sonic, rayleigh_sonic_inverse.
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
% 	spec    - (char) specifies input stagnation temperature
%               --> 'Tt1' = station 1 stagnation temperature
%               --> 'Tt2' = station 2 stagnation temperature
%   Tt_in   - (1D double array) stagnation temperature at one station [K]
%  	q       - (1D double array) specific heat addition between the two
%             stations [J/kg]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%   R       - (OPTIONAL) (1×1 double) specific gas constant [J/(kg.K)]
%               --> defaults to 287 J/(kg.K)
%
% -------
% OUTPUT:
% -------
%   Tt_out  - (1D double array) stagnation temperature at other station [K]
%           	--> Tt1 (station 1 stagnation temperature) if spec = 'Tt2'
%           	--> Tt2 (station 2 stagnation temperature) if spec = 'Tt1'
%
% -----
% NOTE:
% -----
%   --> N = length of "Tt_in"
%   --> "q" can either be input as a scalar or as a vector with length
%       equal to that of "Tt_in".
%
%==========================================================================
function Tt_out = rayleigh_heat_inverse(spec,Tt_in,q,gamma,R)
    
    % ----------------------------------------------------
    % Sets unspecified parameters to their default values.
    % ----------------------------------------------------
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 4) || isempty(gamma)
        gamma = 1.4;
    end
    
    % defaults "R" to 287 J/(kg.K) if not specified
    if (nargin < 5) || isempty(R)
        R = 287;
    end
    
    % -------------
    % Calculations.
    % -------------
    
    % determines Tt2 if Tt1 input
    if strcmpi(spec,'Tt1')
        Tt_out = Tt_in+((gamma-1)*q)/(gamma*R);
        
    % determines Tt1 if Tt2 input
    else
        Tt_out = Tt_in-((gamma-1)*q)/(gamma*R);
        
    end

end