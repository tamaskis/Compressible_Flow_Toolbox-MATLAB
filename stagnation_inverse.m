% stagnation_inverse  Calculates the local Mach number given
% some input quantity that is a ratio between stagnation and static
% conditions.
%
%   M = stagnation_inverse(Q_in,gamma,spec) returns the local Mach number
%   "M" given some input quantity "Q_in" and specific heat ratio gamma.
%   "Q_in" can be input as an array; in that case, the function will return
%   an array of the same size. The identifier "spec" (that idenfities the
%   input "Q_in") can have the following values:
%    --> 'Tt/T' = stagnation-to-static temperature ratio
%    --> 'Pt/P' = stagnation-to-static pressure ratio
%    --> 'rhot/rho' = stagnation-to-static density ratio
%    --> 'at/a' = stagnation-to-static speed of sound ratio
%    --> 'ht/h' = stagnation-to-static enthalpy ratio
%
% See also flowisentropic
%
% GitHub: https://github.com/tamaskis/compressible_flow_relations-MATLAB
%
% See "Compressible Flow Relations - MATLAB implementation" for additional
% documentation. Examples can be found in EXAMPLES_ISENTROPIC_STAGNATION.m.
% Both of these files are included with the download of the "Compressible
% Flow Relations" toolbox.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: Q_in - some input quantity  (specified by "spec")
%        gamma - specific heat ratio
%        spec - identifies input quantity
% OUTPUT: M - local Mach number
function M = stagnation_inverse(Q_in,gamma,spec)
    
    % Mach number from stagnation-to-static temperature ratio
    if strcmp(spec,'Tt/T')
        M = sqrt((2/(gamma-1))*(Q_in-1));
    
    % Mach number from stagnation-to-static pressure ratio
    elseif strcmp(spec,'Pt/P')
        M = sqrt((2/(gamma-1))*(Q_in.^((gamma-1)/gamma)-1));
    
    % Mach number from stagnation-to-static density ratio
    elseif strcmp(spec,'rhot/rho')
        M = sqrt((2/(gamma-1))*(Q_in.^(gamma-1)-1));
        
    % Mach number from stagnation-to-static speed of sound ratio
    elseif strcmp(spec,'at/a')
        M = sqrt((2/(gamma-1))*(Q_in.^2-1));
        
    % Mach number from stagnation-to-static enthalpy ratio
    elseif strcmp(spec,'ht/h')
        M = sqrt((2/(gamma-1))*(Q_in-1));
        
    end
    
end