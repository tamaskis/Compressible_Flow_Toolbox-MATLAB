% stagnation  Stagnation-to-static ratios based on local Mach number.
%
%   Q_out = stagnation(M,gamma,spec) returns some ratio between the
%   stagnation quantity and static quantity in the flow of a calorically
%   perfect gas. "M" is the local Mach number and "gamma" is the specific
%   heat ratio. "M" can be input as an array; in that case, the function
%   will return an array of the same size. The identifier "spec" (that
%   determines the output "Q_out") can have the following values:
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
% documentation. Examples can be found in EXAMPLES_stagnation.m.
% Both of these files are included with the download of the "Compressible
% Flow Relations" toolbox.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: M - local Mach number
%        gamma - specific heat ratio
%        spec - what the function should return
% OUTPUT: Q_out - output quantity specified by "spec"
function Q_out = stagnation(M,gamma,spec)
    
    % stagnation-to-static temperature ratio
    if strcmp(spec,'Tt/T')
        Q_out = 1+((gamma-1)/2)*M.^2;
    
    % stagnation-to-static pressure ratio
    elseif strcmp(spec,'Pt/P')
        Q_out = (1+((gamma-1)/2)*M.^2).^(gamma/(gamma-1));
    
    % stagnation-to-static density ratio
    elseif strcmp(spec,'rhot/rho')
        Q_out = (1+((gamma-1)/2)*M.^2).^(1/(gamma-1));
        
    % stagnation-to-static speed of sound ratio
    elseif strcmp(spec,'at/a')
        Q_out = sqrt(1+((gamma-1)/2)*M.^2);
        
    % stagnation-to-static enthalpy ratio
    elseif strcmp(spec,'ht/h')
        Q_out = 1+((gamma-1)/2)*M.^2;
        
    end
    
end