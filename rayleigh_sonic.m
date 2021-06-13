% rayleigh_sonic  Rayleigh line relations between local and sonic
% conditions.
%
%   Q_out = rayleigh_sonic(M,gamma,spec) returns some ratio or change
%   between the local condition and the sonic condition in a frictionless,
%   quasi-one dimensional flow with heat addition (i.e. Rayleigh flow). "M" 
%   is the local Mach number and "gamma" is the specific heat ratio. "M" 
%   can be input as an array; in that case, the function will return an 
%   array of the same size. The identifier "spec" (that determines the 
%   output "Q_out") can have the following values:
%    --> 'T/T*' = local-to-sonic static temperature ratio
%    --> 'P/P*' = local-to-sonic static pressure ratio
%    --> 'h/h*' = local-to-sonic static enthalpy ratio
%    --> 'rho/rho*' = local-to-sonic density ratio
%    --> 'U/U*' = local-to-sonic velocity ratio
%    --> 'Tt/Tt*' = local-to-sonic stagnation temperature ratio
%    --> 'Pt/Pt*' = local-to-sonic stagnation pressure ratio
%    --> 'ht/ht*' = local-to-sonic stagnation enthalpy ratio
%    --> '(s-s*)/cp' = nondimensional entropy change (from sonic to local)
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

% INPUT: M - local Mach number
%        gamma - specific heat ratio
%        spec - what the function should return
% OUTPUT: Q_out - output quantity specified by "spec"
function Q_out = rayleigh_sonic(M,gamma,spec)
    
    % local-to-sonic static temperature ratio
    if strcmp(spec,'T/T*')
        Q_out = (((gamma+1)*M)./(1+gamma*M.^2)).^2;
    
    % local-to-sonic static pressure ratio
    elseif strcmp(spec,'P/P*')
        Q_out = (gamma+1)./(1+gamma*M.^2);
        
    % local-to-sonic enthalpy ratio
    elseif strcmp(spec,'h/h*')
        Q_out = (((gamma+1)*M)./(1+gamma*M.^2)).^2;
        
    % local-to-sonic density ratio
    elseif strcmp(spec,'rho/rho*')
        Q_out = (1./M.^2).*((1+gamma*M.^2)./(gamma+1));
        
    % local-to-sonic velocity ratio
    elseif strcmp(spec,'U/U*')
        Q_out = ((gamma+1)*M.^2)./(1+gamma*M.^2);
    
    % local-to-sonic stagnation temperature ratio
    elseif strcmp(spec,'Tt/Tt*')
        Q_out = (M.^2*(gamma+1).*(2+(gamma-1)*M.^2))./((1+gamma*M.^2).^2);
        
    % local-to-sonic stagnation pressure ratio
    elseif strcmp(spec,'Pt/Pt*')
        Q_out = ((gamma+1)./(1+gamma*M.^2)).*((2+(gamma-1)*M.^2)/(gamma+...
            1)).^(gamma/(gamma-1));
        
    % local-to-sonic stagnation enthalpy ratio
    elseif strcmp(spec,'ht/ht*')
        Q_out = (M.^2*(gamma+1).*(2+(gamma-1)*M.^2))./((1+gamma*M.^2).^2);
        
    % nondimensional entropy change from sonic to local
    elseif strcmp(spec,'(s-s*)/cp')
        Q_out = log((M.^2).*((gamma+1)./(1+gamma*M.^2)).^((gamma+1)/...
            (gamma)));
    
    end
    
end