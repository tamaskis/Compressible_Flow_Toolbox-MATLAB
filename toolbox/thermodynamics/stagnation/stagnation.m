%==========================================================================
%
% stagnation  Stagnation-to-static ratios given the local Mach number.
%
%   Tt_T = stagnation(M,'Tt/T')
%   Pt_P = stagnation(M,'Pt/P')
%   rhot_rho = stagnation(M,'rhot/rho')
%   at_a = stagnation(M,'at/a')
%   ht_h = stagnation(M,'ht/h')
%   __ = stagnation(__,gamma)
%
% See also stagnation_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-20
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
%   M       - (1×1 double) local Mach number, M
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
% 	--> 'Tt/T'      - stagnation-to-static temperature ratio, Tₜ/T
% 	--> 'Pt/P'      - stagnation-to-static pressure ratio, Pₜ/P
%  	--> 'rhot/rho'  - stagnation-to-static density ratio, ρₜ/ρ
%  	--> 'at/a'      - stagnation-to-static speed of sound ratio, aₜ/a
%  	--> 'ht/h'      - stagnation-to-static enthalpy ratio, hₜ/h
%
%==========================================================================
function Q_out = stagnation(M,spec,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % auxiliary parameter
    A = 1+((gamma-1)/2)*M^2;
    
    % Tₜ/T or hₜ/h from M
    if strcmpi(spec,'Tt/T') || strcmpi(spec,'ht/h')
        Q_out = A;
        
    % Pₜ/P from M
    elseif strcmpi(spec,'Pt/P')
        Q_out = A^(gamma/(gamma-1));
        
    % ρₜ/ρ from M
    elseif strcmpi(spec,'rhot/rho')
        Q_out = A^(1/(gamma-1));
        
    % aₜ/a from M
    elseif strcmpi(spec,'at/a')
        Q_out = sqrt(A);
        
    end
    
end