%==========================================================================
%
% oblique_shock  Finds the downstream Mach number, nondimensional entropy 
% change, or a ratio of properties for an oblique shock given the upstream 
% Mach number and the shock angle.
%
%   M2 = oblique_shock(M1,beta,'M2')
%   T2_T1 = oblique_shock(M1,beta,'T2/T1')
%   P2_P1 = oblique_shock(M1,beta,'P2/P1')
%   rho2_rho1 = oblique_shock(M1,beta,'rho2/rho1')
%   U2_U1 = oblique_shock(M1,beta,'U2/U1')
%   a2_a1 = oblique_shock(M1,beta,'a2/a1')
%   h2_h1 = oblique_shock(M1,beta,'h2/h1')
%   Tt2_Tt1 = oblique_shock(M1,beta,'Tt2/Tt1')
%   Pt2_Pt1 = oblique_shock(M1,beta,'Pt2/Pt1')
%   rhot2_rhot1 = oblique_shock(M1,beta,'rhot2/rhot1')
%   at2_at1 = oblique_shock(M1,beta,'at2/at1')
%   ht2_ht1 = oblique_shock(M1,beta,'ht2/ht1')
%   ds_cp = oblique_shock(M1,beta,'(s2-s1)/cp')
%   __ = oblique_shock(__,gamma)
%
% See also oblique_shock_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-13
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
%   M1      - (1×1 double) upstream Mach number, M₁
%   beta    - (1×1 double) shock angle, β [rad]
%   spec    - (char) specifies output quantity (see options below)
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   Q_out 	- (1×1 double) output quantity, Qₒᵤₜ (specified by "spec")
%
% -------------------
% OPTIONS FOR "spec":
% -------------------
% 	--> 'M2'            - downstream Mach number, M₂
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
function Q_out = oblique_shock(M1,beta,spec,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 4) || isempty(gamma)
        gamma = 1.4;
    end
    
    % normal upstream Mach number
    Mn1 = M1_to_Mn1(M1,beta);
    
    % finds output quantity using normal shock relations
    Q_out = normal_shock(Mn1,spec,gamma);
    
    % handles edge case where desired output quantity is M₂
    if strcmpi(spec,'M2')
        
        % deflection angle [rad]
        theta = deflection_angle(M1,beta,gamma);
        
        % downstream Mach number from normal downstream Mach number
        Q_out = Mn2_to_M2(Q_out,theta,beta);
        
    end
    
end