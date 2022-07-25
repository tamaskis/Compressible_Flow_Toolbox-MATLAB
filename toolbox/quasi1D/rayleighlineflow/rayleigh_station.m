%==========================================================================
%
% rayleigh_station  Rayleigh line relations between two stations.
%
%   T2_T1 = rayleigh_station(M1,M2,'T2/T1')
%   P2_P1 = rayleigh_station(M1,M2,'P2/P1')
%   h2_h1 = rayleigh_station(M1,M2,'h2/h1')
%   rho2_rho1 = rayleigh_station(M1,M2,'rho2/rho1')
%   U2_U1 = rayleigh_station(M1,M2,'U2/U1')
%   Tt2_Tt1 = rayleigh_station(M1,M2,'Tt2/Tt1')
%   Pt2_Pt1 = rayleigh_station(M1,M2,'Pt2/Pt1')
%   ht2_ht1 = rayleigh_station(M1,M2,'ht2/ht1')
%   ds_cp = rayleigh_station(M1,M2,'(s2-s1)/cp')
%   __ = rayleigh_station(__,gamma)
%
% See also rayleigh_station_inverse, rayleigh_sonic, 
% rayleigh_sonic_inverse, rayleigh_heat, rayleigh_heat_inverse.
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
%   M1      - (1×1 double) station 1 Mach number
%   M2      - (1×1 double) station 2 Mach number
%   spec    - (char) specifies output quantity
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
% 	--> 'T2/T1'         - static temperature ratio
% 	--> 'P2/P1'         - static pressure ratio
%  	--> 'rho2/rho1'     - density ratio
%   --> 'U2/U1'         - velocity ratio
%  	--> 'h2/h1'         - static enthalpy ratio
%	--> 'Tt2/Tt1'       - stagnation temperature ratio
%   --> 'Pt2/Pt1'       - stagnation pressure ratio
% 	--> 'ht2/ht1'       - stagnation enthalpy ratio
% 	--> '(s2-s1)/cp'    - nondimensional entropy change
% TODO
%  	--> 'T2/T1'         - static temperature ratio, T₂/T₁
%  	--> 'P2/P1'         - static pressure ratio, P₂/P₁
%  	--> 'rho2/rho1'     - static density ratio, ρ₂/ρ₁
%  	--> 'U2/U1'         - velocity ratio, U₂/U₁
%  	--> 'a2/a1'         - speed of sound ratio, a₂/a₁
% 	--> 'h2/h1'         - static enthalpy ratio, h₂/h₁
%  	--> 'Tt2/Tt1'       - stagnation temperature ratio, Tₜ₂/Tₜ₁
%  	--> 'Pt2/Pt1'       - stagnation pressure ratio, Pₜ₂/Pₜ₁
%  	--> 'rhot2/rhot1'   - stagnation density ratio, ρₜ₂/ρₜ₁
%  	--> 'at2/at1'       - stagnation speed of sound ratio, aₜ₂/aₜ₁
%  	--> 'ht2/ht1'       - stagnation enthalpy ratio, hₜ₂/hₜ₁
%   --> '(s2-s1)/cp'    - nondimensional entropy change, (s₂-s₁)/cₚ
%
%==========================================================================
function Q_out = rayleigh_station(M1,M2,spec,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % static temperature ratio
    if strcmpi(spec,'T2/T1')
        Q_out = (((1+gamma*M1^2)/(1+gamma*M2^2))^2)*((M2/M1)^2);
        
    % static pressure ratio
    elseif strcmpi(spec,'P2/P1')
        Q_out = (1+gamma*M1^2)/(1+gamma*M2^2);
        
    % static enthalpy ratio
    elseif strcmpi(spec,'h2/h1')
        Q_out = (((1+gamma*M1^2)/(1+gamma*M2^2))^2)*((M2/M1)^2);
        
    % density ratio
    elseif strcmpi(spec,'rho2/rho1')
        Q_out = ((1+gamma*M2^2)/(1+gamma*M1^2))*((M1/M2)^2);
        
    % velocity ratio
    elseif strcmpi(spec,'U2/U1')
        Q_out = ((1+gamma*M1^2)/(1+gamma*M2^2))*((M2/M1)^2);
        
    % stagnation temperature ratio
    elseif strcmpi(spec,'Tt2/Tt1')
        Q_out = (((1+gamma*M1^2)/(1+gamma*M2^2))^2)*((M2/M1)^2)*((2+...
            (gamma-1)*M2^2)/(2+(gamma-1)*M1^2));
        
    % stagnation pressure ratio
    elseif strcmpi(spec,'Pt2/Pt1')
        Q_out = ((1+gamma*M1^2)/(1+gamma*M2^2))*((2+(gamma-1)*M2^2)/(2+...
            (gamma-1)*M1^2))^(gamma/(gamma-1));
        
    % stagnation enthalpy ratio
    elseif strcmpi(spec,'ht2/ht1')
        Q_out = (((1+gamma*M1^2)/(1+gamma*M2^2))^2)*((M2/M1)^2)*((2+...
            (gamma-1)*M2^2)/(2+(gamma-1)*M1^2));
        
    % nondimensional entropy change from station 1 to station 2
    elseif strcmpi(spec,'(s2-s1)/cp')
        Q_out = log(((M2/M1)^2)*((1+gamma*M1^2)/(1+gamma*M2^2))^((gamma+...
            1)/gamma));
        
    end
    
end