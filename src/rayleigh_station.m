%==========================================================================
%
% rayleigh_station  Rayleigh line relations between two stations.
%
%   T2_T1 = rayleigh_station(M1,M2,gamma,'T2/T1')
%   P2_P1 = rayleigh_station(M1,M2,gamma,'P2/P1')
%   h2_h1 = rayleigh_station(M1,M2,gamma,'h2/h1')
%   rho2_rho1 = rayleigh_station(M1,M2,gamma,'rho2/rho1')
%   U2_U1 = rayleigh_station(M1,M2,gamma,'U2/U1')
%   Tt2_Tt1 = rayleigh_station(M1,M2,gamma,'Tt2/Tt1')
%   Pt2_Pt1 = rayleigh_station(M1,M2,gamma,'Pt2/Pt1')
%   ht2_ht1 = rayleigh_station(M1,M2,gamma,'ht2/ht1')
%   ds_cp = rayleigh_station(M1,M2,gamma,'(s2-s1)/cp')
%
% See also rayleigh_station_inverse, rayleigh_sonic, 
% rayleigh_sonic_inverse, rayleigh_heat, rayleigh_heat_inverse, 
% flowrayleigh.
%
% Copyright © 2021 Tamas Kis
% Contact: tamas.a.kis@outlook.com
% Last Update: 2021-07-04
%
%--------------------------------------------------------------------------
%
% MATLAB Central File Exchange: 
% GitHub: https://github.com/tamaskis/compressible_flow_toolbox-MATLAB
%
% See EXAMPLES.mlx for examples and "DOCUMENTATION.pdf" for additional 
% documentation. Both of these files are included with the download.
%
%--------------------------------------------------------------------------
%
% -------
% INPUTS:
% -------
%   M1      - (N×1 or 1×N) station 1 Mach number
%   M2      - (N×1 or 1×N) station 2 Mach number
%   gamma   - (1×1) specific heat ratio
%   spec    - (char) specifies output quantity
%               --> 'T2/T1' = static temperature ratio
%               --> 'P2/P1' = static pressure ratio
%               --> 'h2/h1' = static enthalpy ratio
%               --> 'rho2/rho1' = density ratio
%               --> 'U2/U1' = velocity ratio
%               --> 'Tt2/Tt1' = stagnation temperature ratio
%               --> 'Pt2/Pt1' = stagnation pressure ratio
%               --> 'ht2/ht1' = stagnation enthalpy ratio
%               --> '(s2-s1)/cp' = nondimensional entropy change
%
% --------
% OUTPUTS:
% --------
%   Q_out 	- (N×1 or 1×N) output quantity (specified by "spec")
%
% -----
% NOTE:
% -----
%   --> N = length of "M1" and "M2"
%
%==========================================================================
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