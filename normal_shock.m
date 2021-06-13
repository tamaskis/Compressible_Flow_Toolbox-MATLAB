% normal_shock  Normal shock relations.
%
%   Q_out = normal_shock(M1,gamma,spec) returns some ratio or change across
%   a normal shock. "M1" is the upstream Mach number and "gamma" is the 
%   specific heat ratio. "M1" can be input as an array; in that case, the 
%   function will return an array of the same size. The identifier "spec" 
%   (that determines the output "Q_out") can have the following values:
%    --> 'M2' = downstream Mach number
%    --> 'T2/T1' = static temperature ratio
%    --> 'P2/P1' = static pressure ratio
%    --> 'rho2/rho1' = static density ratio
%    --> 'U2/U1' = velocity ratio
%    --> 'a2/a1' = speed of sound ratio
%    --> 'h2/h1' = static enthalpy ratio
%    --> 'Tt2/Tt1' = stagnation temperature ratio
%    --> 'Pt2/Pt1' = stagnation pressure ratio
%    --> 'rhot2/rhot1' = stagnation density ratio
%    --> 'at2/at1' = stagnation speed of sound ratio
%    --> 'ht2/ht1' = stagnation enthalpy ratio
%    --> '(s2-s1)/cp' = nondimensional entropy change
%
% See also flownormalshock
%
% GitHub: https://github.com/tamaskis/compressible_flow_relations-MATLAB
%
% See "Compressible Flow Relations - MATLAB implementation" for additional
% documentation. Examples can be found in EXAMPLES_NORMAL_SHOCK.m. Both of
% these files are included with the download of the "Compressible Flow
% Relations" toolbox.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: M1 - upstream Mach number
%        gamma - specific heat ratio
%        spec - what the function should return
% OUTPUT: Q_out - output quantity specified by "spec"
function Q_out = normal_shock(M1,gamma,spec)
    
    % downstream Mach number
    if strcmp(spec,'M2')
        Q_out = sqrt(((2+(gamma-1)*M1.^2))./(2*gamma*M1.^2-(gamma-1)));
    
    % static temperature ratio
    elseif strcmp(spec,'T2/T1')
        Q_out = ((2*gamma*M1.^2-(gamma-1)).*(2+(gamma-1)*M1.^2))./((1+...
            gamma)^2*M1.^2);
        
    % static pressure ratio
    elseif strcmp(spec,'P2/P1')
        Q_out = 1+((2*gamma)/(gamma+1))*(M1.^2-1);
    
    % static density ratio
    elseif strcmp(spec,'rho2/rho1')
        Q_out = ((gamma+1)*M1.^2)./(2+(gamma-1)*M1.^2);
        
    % velocity ratio
    elseif strcmp(spec,'U2/U1')
        Q_out = (2+(gamma-1)*M1.^2)./((gamma+1)*M1.^2);
        
    % speed of sound ratio
    elseif strcmp(spec,'a2/a1')
        Q_out = sqrt(((2*gamma*M1.^2-(gamma-1)).*(2+(gamma-1)*M1.^2))./...
            ((1+gamma)^2*M1.^2));
        
    % static enthalpy ratio
    elseif strcmp(spec,'h2/h1')
        Q_out = ((1+gamma)^2*M1.^2)./((2*gamma*M1.^2-(gamma-1)).*(2+(...
            gamma-1)*M1.^2));
    
    % stagnation temperature ratio
    elseif strcmp(spec,'Tt2/Tt1')
        Q_out = 1;
        
    % stagnation pressure ratio
    elseif strcmp(spec,'Pt2/Pt1')
        Q_out = (((gamma+1)*M1.^2./(2+(gamma-1)*M1.^2)).^(gamma/(gamma-...
            1))).*((gamma+1)./(2*gamma*M1.^2-(gamma-1))).^(1/(gamma-1));
        
    % stagnation density ratio
    elseif strcmp(spec,'rhot2/rhot1')
        Q_out = (((gamma+1)*M1.^2./(2+(gamma-1)*M1.^2)).^(gamma/(gamma-...
            1))).*((gamma+1)./(2*gamma*M1.^2-(gamma-1))).^(1/(gamma-1));
        
    % stagnation speed of sound ratio
    elseif strcmp(spec,'at2/at1')
        Q_out = 1;
        
    % stagnation enthalpy ratio
    elseif strcmp(spec,'ht2/ht1')
        Q_out = 1;
        
    % nondimensional entropy change
    elseif strcmp(spec,'(s2-s1)/cp')
        Q_out = -log(((gamma+1)*M1.^2)./(2+(gamma-1)*M1.^2))-(1/gamma)*...
            log((gamma+1)./(2*gamma*M1.^2-(gamma-1)));
    
    end
    
end