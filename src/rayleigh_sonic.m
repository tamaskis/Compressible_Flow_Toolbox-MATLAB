%==========================================================================
%
% rayleigh_sonic  Rayleigh line relations between local and sonic
% conditions.
%
%   T_Tstar = rayleigh_sonic(M,'T/T*')
%   P_Pstar = rayleigh_sonic(M,'P/P*')
%   h_hstar = rayleigh_sonic(M,'h/h*')
%   rho_rhostar = rayleigh_sonic(M,'rho/rho*')
%   U_Ustar = rayleigh_sonic(M,'U/U*')
%   Tt_Ttstar = rayleigh_sonic(M,'Tt/Tt*')
%   Pt_Ptstar = rayleigh_sonic(M,'Pt/Pt*')
%   ht_htstar = rayleigh_sonic(M,'ht/ht*')
%   ds_cp = rayleigh_sonic(M,'(s-s*)/cp')
%   __ = rayleigh_sonic(__,gamma)
%
% See also rayleigh_sonic_inverse, rayleigh_station, 
% rayleigh_station_inverse, rayleigh_heat, rayleigh_heat_inverse.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-09-13
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed.
%   [2] Cantwell, AA 210A Course Reader (Stanford University)
%   [3] https://en.wikipedia.org/wiki/Rayleigh_flow
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M       - (1D double array) local Mach number
%   spec    - (char) specifies output quantity (see options below)
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio
%               --> defaults to 1.4
%
% -------
% OUTPUT:
% -------
%   Q_out 	- (1D double array) output quantity (specified by "spec")
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
    if (nargin == 2) || isempty(gamma)
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
        
    % local-to-sonic enthalpy ratio
    elseif strcmpi(spec,'h/h*')
        Q_out = (((gamma+1)*M)./(1+gamma*M.^2)).^2;
        
    % local-to-sonic density ratio
    elseif strcmpi(spec,'rho/rho*')
        Q_out = (1./M.^2).*((1+gamma*M.^2)./(gamma+1));
        
    % local-to-sonic velocity ratio
    elseif strcmpi(spec,'U/U*')
        Q_out = ((gamma+1)*M.^2)./(1+gamma*M.^2);
    
    % local-to-sonic stagnation temperature ratio
    elseif strcmpi(spec,'Tt/Tt*')
        Q_out = (M.^2*(gamma+1).*(2+(gamma-1)*M.^2))./((1+gamma*M.^2).^2);
        
    % local-to-sonic stagnation pressure ratio
    elseif strcmpi(spec,'Pt/Pt*')
        Q_out = ((gamma+1)./(1+gamma*M.^2)).*((2+(gamma-1)*M.^2)/(gamma+...
            1)).^(gamma/(gamma-1));
        
    % local-to-sonic stagnation enthalpy ratio
    elseif strcmpi(spec,'ht/ht*')
        Q_out = (M.^2*(gamma+1).*(2+(gamma-1)*M.^2))./((1+gamma*M.^2).^2);
        
    % nondimensional entropy change from sonic to local
    elseif strcmpi(spec,'(s-s*)/cp')
        Q_out = log((M.^2).*((gamma+1)./(1+gamma*M.^2)).^((gamma+1)/...
            (gamma)));
    
    end
    
end