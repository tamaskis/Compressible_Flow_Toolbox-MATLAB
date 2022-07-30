%==========================================================================
%
% isentropic_process  Static ratios for an isentropic process in a 
% compressible flow.
%
%   T2T1 = isentropic_process(M1,M2,'T2/T1')
%   P2P1 = isentropic_process(M1,M2,'P2/P1')
%   rho2rho1 = isentropic_process(M1,M2,'rho2/rho1')
%   a2a1 = isentropic_process(M1,M2,'a2/a1')
%   h2h1 = isentropic_process(M1,M2,'h2/h1')
%   __ = isentropic_process(__,gamma)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-30
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
%   M2      - (1×1 double) downstream Mach number, M₂
%   spec    - (char) specifies input quantity (see options below)
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
%  	--> 'T2/T1'         - static temperature ratio, T₂/T₁
%  	--> 'P2/P1'         - static pressure ratio, P₂/P₁
%  	--> 'rho2/rho1'     - static density ratio, ρ₂/ρ₁
%  	--> 'a2/a1'         - speed of sound ratio, a₂/a₁
% 	--> 'h2/h1'         - static enthalpy ratio, h₂/h₁
%
%==========================================================================
function Q_out = isentropic_process(M1,M2,spec,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 4) || isempty(gamma)
        gamma = 1.4;
    end
    
    % auxiliary parameter
    A = (2+(gamma-1)*M1^2)/(2+(gamma-1)*M2^2);
    
    % T₂/T₁ or h₂/h₁ from M₁ and M₂
    if strcmpi(spec,'T2/T1')
        Q_out = A;
        
    % P₂/P₁ from M₁ and M₂
    elseif strcmpi(spec,'P2/P1')
        Q_out = A^(gamma/(gamma-1));
        
    % ρ₂/ρ₁ from M₁ and M₂
    elseif strcmpi(spec,'rho2/rho1')
        Q_out = A^(1/(gamma-1));
        
    % a₂/a₁ from M₁ and M₂
    elseif strcmpi(spec,'a2/a1')
        Q_out = sqrt(A);
        
    end
    
end