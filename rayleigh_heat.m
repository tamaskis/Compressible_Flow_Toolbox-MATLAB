% rayleigh_heat  Determines the heat addition between two stations in a
% Rayleigh flow.
%
%   q = rayleigh_heat(Tt1,Tt2,gamma,R) returns the (specific) heat addition
%   between stations 1 and 2 in a frictionless, quasi-one-dimensional flow
%   with heat addition (i.e. Rayleigh flow). "Tt1" and "Tt2" are the 
%   stagnation temperatures at stations 1 and 2, respectively, "gamma" is 
%   the specific heat ratio, and "R" is the specific gas constant. "Tt1" 
%   and "Tt2"  may be input as arrays (as long as they are the same size); 
%   in that case, the function will return an array of the same size.
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

% INPUT: Tt1 - station 1 stagnation temperature [K]
%        Tt2 - station 2 stagnation temperature [K]
%        gamma - specific heat ratio
%        R - specific gas constant [J/(kg.K)]
% OUTPUT: q - (specific) heat addition [J/kg]
function q = rayleigh_heat(Tt1,Tt2,gamma,R)
    q = (gamma*R*(Tt2-Tt1))/(gamma-1);
end