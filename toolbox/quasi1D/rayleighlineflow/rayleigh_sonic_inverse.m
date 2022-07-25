%==========================================================================
%
% rayleigh_sonic_inverse  Calculates the subsonic and supersonic solutions 
% for the local Mach number in a Rayleigh flow given some ratio or 
% difference between local and sonic conditions.
%
%   [M_sub,M_sup] = rayleigh_sonic_inverse('T/T*',T_Tstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('P/P*',P_Pstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('rho/rho*',rho_rhostar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('U/U*',U_Ustar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('a/a*',a_astar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('h/h*',h_hstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('Tt/Tt*',Tt_Ttstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('Pt/Pt*',Pt_Ptstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('rhot/rhot*',rhot_rhotstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('at/at*',at_atstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('ht/ht*',ht_htstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('(s-s*)/cp',ds_cp)
%   [M_sub,M_sup] = rayleigh_sonic_inverse(__,gamma)
%
% See also rayleigh_sonic, rayleigh_station, rayleigh_station_inverse,
% rayleigh_heat, rayleigh_heat_inverse.
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
%   spec    - (char) specifies input quantity (see options below)
%   Q_in    - (1×1 double) input quantity, Qᵢₙ (specified by "spec")
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M_sub   - (1×1 double) subsonic solution for local Mach number
%   M_sup   - (1×1 double) supersonic solution for local Mach number
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
%  	--> '(s-s*)/cp' - sonic-to-local nondimensional entropy change
%
%==========================================================================
function [M_sub,M_sup] = rayleigh_sonic_inverse(spec,Q_in,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 2) || isempty(gamma)
        gamma = 1.4;
    end
    
    % handles special case where Q_in = 1 (because we know the exact
    % solution in this case and can eliminate numerical error)
    if (Q_in == 1)
        M_sub = 1;
        M_sup = 1;
        return;
    end
    
    % sets up function to find root of
    g = @(M) rayleigh_sonic(M,spec,gamma)-Q_in;
    
    % finds subsonic and supersonic roots
    M_sub = bisection_method(g,0,1);
    M_sup = secant_method(g,1.5);
    
    % logicals that store if current case is an edge case
    edge_P_Pstar = strcmpi(spec,'P/P*') && ((Q_in < 1) || (Q_in > 2.4));
    edge_U_Ustar = strcmpi(spec,'U/U*') && ((Q_in < 0) || (Q_in > 1));
    edge_Pt_Ptstar = strcmpi(spec,'Pt/Pt*') && ((Q_in < 1) ||...
        (Q_in > 1.267876290521218));
    
    % handles edge cases that result in no subsonic solution
    if edge_P_Pstar || edge_U_Ustar || edge_Pt_Ptstar
        M_sub = NaN;
    end
    
end