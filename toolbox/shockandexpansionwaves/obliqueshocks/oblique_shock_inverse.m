%==========================================================================
%
% oblique_shock_inverse  Finds the upstream Mach number for an oblique 
% shock given either the downstream Mach number, the nondimensional entropy
% change, or a ratio of properties.
%
%   M1 = oblique_shock_inverse('M2',M2)
%   M1 = oblique_shock_inverse('T2/T1',T2_T1)
%   M1 = oblique_shock_inverse('P2/P1',P2_P1)
%   M1 = oblique_shock_inverse('rho2/rho1',rho2_rho1)
%   M1 = oblique_shock_inverse('U2/U1',U2_U1)
%   M1 = oblique_shock_inverse('a2/a1',a2_a1)
%   M1 = oblique_shock_inverse('h2/h1',h2_h1)
%   M1 = oblique_shock_inverse('Tt2/Tt1',Tt2_Tt1)
%   M1 = oblique_shock_inverse('Pt2/Pt1',Pt2_Pt1)
%   M1 = oblique_shock_inverse('rhot2/rhot1',rhot2_rhot1)
%   M1 = oblique_shock_inverse('at2/at1',at2_at1)
%   M1 = oblique_shock_inverse('ht2/ht1',ht2_ht1)
%   M1 = oblique_shock_inverse('(s2-s1)/cp',ds_cp)
%   M1 = oblique_shock_inverse(__,gamma)
%
% See also oblique_shock.
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
%   spec    - (char) specifies input quantity (see options below)
%   Q_in    - (1×1 double) input quantity, Qᵢₙ (specified by "spec")
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M1      - (1×1 double) upstream Mach number, M₁
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
function M1 = oblique_shock_inverse(spec,Q_in,beta,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 4) || isempty(gamma)
        gamma = 1.4;
    end

    % handles edge case where input quantity is M₂
    if strcmpi(spec,'M2')
        
        % deflection angle [rad]
        theta = deflection_angle(M1,beta,gamma);
        
        % downstream Mach number from normal downstream Mach number
        Q_out = Mn2_to_M2(Q_out,theta,beta);
        
    end

    % finds Mₙ₁ using inverse normal shock relation
    Mn1 = normal_shock_inverse(spec,Q_in,gamma);
    
    % finds M₁ given Mₙ₁
    M1 = Mn1_to_M1(Mn1,beta);
    
end