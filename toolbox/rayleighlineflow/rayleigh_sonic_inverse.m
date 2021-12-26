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
% Copyright © 2021 Tamas Kis
% Last Update: 2021-09-20
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
%   spec    - (char) specifies input quantity (see options below)
%   Q_in    - (1D double array) input quantity (specified by "spec")
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M_sub   - (1D double array) subsonic solution for local Mach number
%   M_sup   - (1D double array) supersonic solution for local Mach number
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
    
    % preallocates arrays
    M_sub = zeros(size(Q_in));
    M_sup = zeros(size(Q_in));

    % finds subsonic and supersonic roots at each value of Q_in
    for i = 1:length(Q_in)

        % sets up function to find root of
        g = @(M) rayleigh_sonic(M,spec,gamma)-Q_in(i);

        % finds subsonic and supersonic roots
        M_sub(i) = bisection_method(g,0,1);
        M_sup(i) = secant_method(g,1.5);
        
        % logicals that store if current case is an edge case
        edge_P_Pstar = strcmpi(spec,'P/P*') && ((Q_in(i) < 1) ||...
            (Q_in(i) > 2.4));
        edge_U_Ustar = strcmpi(spec,'U/U*') && ((Q_in(i) < 0) ||...
            (Q_in(i) > 1));
        edge_Pt_Ptstar = strcmpi(spec,'Pt/Pt*') && ((Q_in(i) < 1) ||...
            (Q_in(i) > 1.267876290521218));
        
        % handles edge cases that result in no subsonic solution
        if edge_P_Pstar || edge_U_Ustar || edge_Pt_Ptstar
            M_sub(i) = NaN;
        end

        % handles special case where Q_in = 1 (because we know the exact
        % solution in this case and can eliminate numerical error)
        if (Q_in(i) == 1)
            M_sub(i) = 1;
            M_sup(i) = 1;
        end

    end
    
end