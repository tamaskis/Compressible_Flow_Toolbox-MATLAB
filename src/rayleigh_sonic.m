%==========================================================================
%
% rayleigh_sonic  Rayleigh line relations between local and sonic
% conditions.
%
%   T_Tstar = rayleigh_sonic(M,gamma,'T/T*')
%   P_Pstar = rayleigh_sonic(M,gamma,'P/P*')
%   h_hstar = rayleigh_sonic(M,gamma,'h/h*')
%   rho_rhostar = rayleigh_sonic(M,gamma,'rho/rho*')
%   U_Ustar = rayleigh_sonic(M,gamma,'U/U*')
%   Tt_Ttstar = rayleigh_sonic(M,gamma,'Tt/Tt*')
%   Pt_Ptstar = rayleigh_sonic(M,gamma,'Pt/Pt*')
%   ht_htstar = rayleigh_sonic(M,gamma,'ht/ht*')
%   ds_cp = rayleigh_sonic(M,gamma,'(s-s*)/cp')
%
% See also rayleigh_sonic_inverse, rayleigh_station, 
% rayleigh_station_inverse, rayleigh_heat, rayleigh_heat_inverse, 
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
%   M       - (N×1 or 1×N) local Mach number
%   gamma   - (1×1) specific heat ratio
%   spec    - (char) specifies output quantity
%               --> 'T/T*' = local-to-sonic static temperature ratio
%               --> 'P/P*' = local-to-sonic static pressure ratio
%               --> 'h/h*' = local-to-sonic static enthalpy ratio
%               --> 'rho/rho*' = local-to-sonic density ratio
%               --> 'U/U*' = local-to-sonic velocity ratio
%               --> 'Tt/Tt*' = local-to-sonic stagnation temperature ratio
%               --> 'Pt/Pt*' = local-to-sonic stagnation pressure ratio
%               --> 'ht/ht*' = local-to-sonic stagnation enthalpy ratio
%               --> '(s-s*)/cp' = nondimensional entropy change (from sonic
%                   to local)
%
% --------
% OUTPUTS:
% --------
%   Q_out 	- (N×1 or 1×N) output quantity (specified by "spec")
%
% -----
% NOTE:
% -----
%   --> N = length of "M"
%
%==========================================================================
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