% rayleigh_station  Rayleigh line relations between two stations.
%
%   Q_out = rayleigh_station(M1,M2,gamma,spec) returns some ratio or change
%   between two stations (1 and 2) in a frictionless, quasi-one-dimensional
%   flow with heat addition (i.e. Rayleigh flow). "M1" and "M2" are the
%   Mach numbers at stations 1 and 2, respectively, and "gamma" is the
%   specific heat ratio. "M1" and "M2" may be input as arrays (as long as 
%   they are the same size); in that case, the function will return an 
%   array of the same size. The identifier "spec" (that determines the
%   output "Q_out") can have the following values:
%    --> 'T2/T1' = static temperature ratio
%    --> 'P2/P1' = static pressure ratio
%    --> 'h2/h1' = static enthalpy ratio
%    --> 'rho2/rho1' = density ratio
%    --> 'U2/U1' = velocity ratio
%    --> 'Tt2/Tt1' = stagnation temperature ratio
%    --> 'Pt2/Pt1' = stagnation pressure ratio
%    --> 'ht2/ht1' = stagnation enthalpy ratio
%    --> '(s2-s1)/cp' = nondimensional entropy change
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

% INPUT: M1 - station 1 Mach number
%        M2 - station 2 Mach number
%        gamma - specific heat ratio
%        spec - what the function should return
% OUTPUT: Q_out - output quantity specified by "spec"
function Q_out = rayleigh_station(M1,M2,gamma,spec)
    
    % static temperature ratio
    if strcmp(spec,'T2/T1')
        Q_out = (((1+gamma*M1.^2)./(1+gamma*M2.^2)).^2).*((M2./M1).^2);
    
    % static pressure ratio
    elseif strcmp(spec,'P2/P1')
        Q_out = (1+gamma*M1.^2)./(1+gamma*M2.^2);
        
    % static enthalpy ratio
    elseif strcmp(spec,'h2/h1')
        Q_out = (((1+gamma*M1.^2)./(1+gamma*M2.^2)).^2).*((M2./M1).^2);

    % density ratio
    elseif strcmp(spec,'rho2/rho1')
        Q_out = ((1+gamma*M2.^2)./(1+gamma*M1.^2)).*((M1./M2).^2);
        
    % velocity ratio
    elseif strcmp(spec,'U2/U1')
        Q_out = ((1+gamma*M1.^2)./(1+gamma*M2.^2)).*((M2./M1).^2);
    
    % stagnation temperature ratio
    elseif strcmp(spec,'Tt2/Tt1')
        Q_out = (((1+gamma*M1.^2)./(1+gamma*M2.^2)).^2).*((M2./M1).^2).*...
            ((2+(gamma-1)*M2.^2)./(2+(gamma-1)*M1.^2));
        
    % stagnation pressure ratio
    elseif strcmp(spec,'Pt2/Pt1')
        Q_out = ((1+gamma*M1.^2)./(1+gamma.*M2.^2)).*((2+(gamma-1)*...
            M2.^2)./(2+(gamma-1)*M1.^2)).^(gamma/(gamma-1));
        
    % stagnation enthalpy ratio
    elseif strcmp(spec,'ht2/ht1')
        Q_out = (((1+gamma*M1.^2)./(1+gamma*M2.^2)).^2).*((M2./M1).^2).*...
            ((2+(gamma-1)*M2.^2)./(2+(gamma-1)*M1.^2));
        
    % nondimensional entropy change from station 1 to station 2
    elseif strcmp(spec,'(s2-s1)/cp')
        Q_out = log(((M2./M1).^2).*((1+gamma*M1.^2)./(1+gamma*M2.^2)).^...
            ((gamma+1)/gamma));
    
    end
    
end