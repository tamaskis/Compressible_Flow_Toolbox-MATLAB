%==========================================================================
%
% normal_shock  Finds the downstream Mach number, nondimensional entropy 
% change across a normal shock, or a ratio of properties across a normal 
% shock given the upstream Mach number.
%
%   M2 = normal_shock(M1,'M2')
%   T2_T1 = normal_shock(M1,'T2/T1')
%   P2_P1 = normal_shock(M1,'P2/P1')
%   rho2_rho1 = normal_shock(M1,'rho2/rho1')
%   U2_U1 = normal_shock(M1,'U2/U1')
%   a2_a1 = normal_shock(M1,'a2/a1')
%   h2_h1 = normal_shock(M1,'h2/h1')
%   Tt2_Tt1 = normal_shock(M1,'Tt2/Tt1')
%   Pt2_Pt1 = normal_shock(M1,'Pt2/Pt1')
%   rhot2_rhot1 = normal_shock(M1,'rhot2/rhot1')
%   at2_at1 = normal_shock(M1,'at2/at1')
%   ht2_ht1 = normal_shock(M1,'ht2/ht1')
%   ds_cp = normal_shock(M1,'(s2-s1)/cp')
%   __ = normal_shock(__,gamma)
%
% See also normal_shock_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-22
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
%   spec    - (char) specifies output quantity (see options below)
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   Q_out   - (1×1 double) output quantity, Qₒᵤₜ (specified by "spec")
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
function Q_out = normal_shock(M1,spec,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 2) || isempty(gamma)
        gamma = 1.4;
    end
    
    % M₂ from M₁
    if strcmpi(spec,'M2')
        Q_out = sqrt(((2+(gamma-1)*M1^2))/(2*gamma*M1^2-(gamma-1)));
        
    % T₂/T₁ from M₁
    elseif strcmpi(spec,'T2/T1')
        Q_out = ((2*gamma*M1^2-(gamma-1))*(2+(gamma-1)*M1^2))/((1+...
            gamma)^2*M1^2);
        
    % P₂/P₁ from M₁
    elseif strcmpi(spec,'P2/P1')
        Q_out = 1+((2*gamma)/(gamma+1))*(M1^2-1);
        
    % ρ₂/ρ₁ from M₁
    elseif strcmpi(spec,'rho2/rho1')
        Q_out = ((gamma+1)*M1^2)/(2+(gamma-1)*M1^2);
        
    % U₂/U₁ from M₁
    elseif strcmpi(spec,'U2/U1')
        Q_out = (2+(gamma-1)*M1^2)/((gamma+1)*M1^2);
        
    % a₂/a₁ from M₁
    elseif strcmpi(spec,'a2/a1')
        Q_out = sqrt(((2*gamma*M1^2-(gamma-1))*(2+(gamma-1)*M1^2))/((1+...
            gamma)^2*M1^2));
        
    % h₂/h₁ from M₁
    elseif strcmpi(spec,'h2/h1')
        Q_out = ((1+gamma)^2*M1^2)/((2*gamma*M1^2-(gamma-1))*(2+(gamma-...
            1)*M1^2));
        
    % Tₜ₂/Tₜ₁ from M₁
    elseif strcmpi(spec,'Tt2/Tt1')
        Q_out = 1;
        
    % Pₜ₂/Pₜ₁ from M₁
    elseif strcmpi(spec,'Pt2/Pt1')
        Q_out = (((gamma+1)*M1^2/(2+(gamma-1)*M1^2))^(gamma/(gamma-1)))*...
            ((gamma+1)/(2*gamma*M1^2-(gamma-1)))^(1/(gamma-1));
        
    % ρₜ₂/ρₜ₁ from M₁
    elseif strcmpi(spec,'rhot2/rhot1')
        Q_out = (((gamma+1)*M1^2/(2+(gamma-1)*M1^2))^(gamma/(gamma-1)))*...
            ((gamma+1)/(2*gamma*M1^2-(gamma-1)))^(1/(gamma-1));
        
    % aₜ₂/aₜ₁ from M₁
    elseif strcmpi(spec,'at2/at1')
        Q_out = 1;
        
    % hₜ₂/hₜ₁ from M₁
    elseif strcmpi(spec,'ht2/ht1')
        Q_out = 1;
        
    % (s₂-s₁)/cₚ from M₁
    elseif strcmpi(spec,'(s2-s1)/cp')
        Q_out = -log(((gamma+1)*M1^2)/(2+(gamma-1)*M1^2))-(1/gamma)*...
            log((gamma+1)/(2*gamma*M1^2-(gamma-1)));
        
    end
    
end