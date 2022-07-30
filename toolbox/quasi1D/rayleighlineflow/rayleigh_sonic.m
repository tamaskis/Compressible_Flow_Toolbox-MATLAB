%==========================================================================
%
% rayleigh_sonic  Rayleigh line relations between local and sonic
% conditions.
%
%   T_Tstar = rayleigh_sonic(M,'T/T*')
%   P_Pstar = rayleigh_sonic(M,'P/P*')
%   rho_rhostar = rayleigh_sonic(M,'rho/rho*')
%   U_Ustar = rayleigh_sonic(M,'U/U*')
%   a_astar = rayleigh_sonic(M,'a/a*')
%   h_hstar = rayleigh_sonic(M,'h/h*')
%   Tt_Ttstar = rayleigh_sonic(M,'Tt/Tt*')
%   Pt_Ptstar = rayleigh_sonic(M,'Pt/Pt*')
%   rhot_rhotstar = rayleigh_sonic(M,'rhot/rhot*')
%   at_atstar = rayleigh_sonic(M,'at/at*')
%   ht_htstar = rayleigh_sonic(M,'ht/ht*')
%   ds_cp = rayleigh_sonic(M,'(s-s*)/cp')
%   __ = rayleigh_sonic(__,gamma)
%
% See also rayleigh_sonic_inverse, rayleigh_station, 
% rayleigh_station_inverse, rayleigh_heat, rayleigh_heat_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/files/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M       - (1×1 double) local Mach number
%   spec    - (char) specifies output quantity (see options below)
%   gamma   - (1×1 double) (OPTIONAL) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   Q_out 	- (1×1 double) output quantity (specified by "spec")
%
% -------------------
% OPTIONS FOR "spec":
% -------------------
% 	--> 'T/T*'      - local-to-sonic static temperature ratio
% 	--> 'P/P*'      - local-to-sonic static pressure ratio
%  	--> 'h/h*'      - local-to-sonic static enthalpy ratio
% 	--> 'rho/rho*'  - local-to-sonic density ratio
% 	--> 'U/U*'      - local-to-sonic velocity ratio
%  	--> 'Tt/Tt*'    - local-to-sonic stagnation temperature ratio
%  	--> 'Pt/Pt*'    - local-to-sonic stagnation pressure ratio
% 	--> 'ht/ht*'    - local-to-sonic stagnation enthalpy ratio
%  	--> '(s-s*)/cp' - nondimensional entropy change (from sonic to local)
%
%==========================================================================
function Q_out = rayleigh_sonic(M,spec,gamma)
    
    % ----------------------------------------------------
    % Sets unspecified parameters to their default values.
    % ----------------------------------------------------
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % -------------
    % Calculations.
    % -------------
    
    % local-to-sonic static temperature ratio
    if strcmpi(spec,'T/T*')
        Q_out = (((gamma+1)*M)./(1+gamma*M.^2)).^2;
        
    % local-to-sonic static pressure ratio
    elseif strcmpi(spec,'P/P*')
        Q_out = (gamma+1)./(1+gamma*M.^2);
        
    % local-to-sonic density ratio
    elseif strcmpi(spec,'rho/rho*')
        Q_out = (1./M.^2).*((1+gamma*M.^2)./(gamma+1));
        
    % local-to-sonic velocity ratio
    elseif strcmpi(spec,'U/U*')
        Q_out = ((gamma+1)*M.^2)./(1+gamma*M.^2);
        
	% local-to-sonic speed of sound ratio
    elseif strcmpi(spec,'a/a*')
        Q_out = ((gamma+1)*M)./(1+gamma*M.^2);
        
    % local-to-sonic enthalpy ratio
    elseif strcmpi(spec,'h/h*')
        Q_out = (((gamma+1)*M)./(1+gamma*M.^2)).^2;
        
    % local-to-sonic stagnation temperature ratio
    elseif strcmpi(spec,'Tt/Tt*')
        Q_out = (M.^2*(gamma+1).*(2+(gamma-1)*M.^2))./((1+gamma*M.^2).^2);
        
    % local-to-sonic stagnation pressure ratio
    elseif strcmpi(spec,'Pt/Pt*')
        Q_out = ((gamma+1)./(1+gamma*M.^2)).*((2+(gamma-1)*M.^2)/(gamma+...
            1)).^(gamma/(gamma-1));
        
    % local-to-sonic stagnation density ratio
    elseif strcmpi(spec,'rhot/rhot*')
        Q_out = (1./M.^2).*((1+gamma*M.^2)/(gamma+1)).*(((2+(gamma-1)*...
            M.^2)/(gamma+1)).^(1/(gamma-1)));
        
    % local-to-sonic stagnation speed of sound ratio
    elseif strcmpi(spec,'at/at*')
        Q_out = (M.*sqrt((gamma+1)*(2+(gamma-1)*M.^2)))./(1+gamma*M.^2);
        
    % local-to-sonic stagnation enthalpy ratio
    elseif strcmpi(spec,'ht/ht*')
        Q_out = (M.^2*(gamma+1).*(2+(gamma-1)*M.^2))./((1+gamma*M.^2).^2);
        
    % nondimensional entropy change from sonic to local
    elseif strcmpi(spec,'(s-s*)/cp')
        Q_out = log((M.^2).*((gamma+1)./(1+gamma*M.^2)).^((gamma+1)/...
            (gamma)));
        
    end
    
end