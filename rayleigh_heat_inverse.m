% rayleigh_heat_inverse  Determines the stagnation temperature at one
% station in a Rayleigh flow given the stagnation temperature at the other
% station and the (specific) heat addition between the two stations.
%
%   Tt_out = rayleigh_heat_inverse(Tt_in,q,gamma,R,spec) returns the 
%   stagnation temperature "Tt_out" and one station in a frictionless, 
%   quasi-one-dimensional flow with heat addition (i.e. Rayleigh flow)
%   given the stagnation temperature "Tt_in" at the other station, the
%   (specific) heat addition "q" between the two stations, the specific
%   heat ratio "gamma", and the specific gas constant "R". "Tt_in" and "q" 
%   may be input as arrays (as long as they are the same size); in that 
%   case, the function will return an array of the same size. The 
%   identifier "spec" (that identifies the input "Tt_in") can have the 
%   following values:
%    --> 'Tt1' = stagnation temperature at station 1 (then Tt_out will be 
%                the stagnation temperature at station 2, Tt2)
%    --> 'Tt2' = stagnation temperature at station 2 (then Tt_out will be 
%                the stagnation temperature at station 1, Tt1)
%
% See also flowrayleigh
%
% GitHub: https://github.com/tamaskis/compressible_flow_relations-MATLAB
%
% See "Compressible Flow Relations - MATLAB implementation" for additional
% documentation. Examples can be found in EXAMPLES_RAYLEIGH.m. Both of
% these files are included with the download of the "Compressible Flow
% Relations" toolbox.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: Tt_in - stagnation temperature at one station [K]
%        q - (specific) heat addition between the two stations [J/kg]
%        gamma - specific heat ratio
%        R - specific gas constant [J/(kg.K)]
%        spec - identifies input stagnation temperature
% OUTPUT: Tt_out - stagnation temperature at other station [K]
function Tt_out = rayleigh_heat_inverse(Tt_in,q,gamma,R,spec)
    
    % determines Tt2 if Tt1 input
    if strcmp(spec,'Tt1')
        Tt_out = Tt_in+((gamma-1)*q)/(gamma*R);
        
    % determines Tt1 if Tt2 input
    else
        Tt_out = Tt_in-((gamma-1)*q)/(gamma*R);
        
    end

end