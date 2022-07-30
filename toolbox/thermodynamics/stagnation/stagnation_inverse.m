%==========================================================================
%
% stagnation_inverse  Determines the local Mach number given some 
% stagnation-to-static ratio.
%
%   M = stagnation_inverse('Tt/T',Tt_T)
%   M = stagnation_inverse('Pt/P',Pt_p)
%   M = stagnation_inverse('rhot/rho',rhot_rho)
%   M = stagnation_inverse('at/a',at_a)
%   M = stagnation_inverse('ht/h',ht_h)
%   M = stagnation_inverse(__,gamma)
%
% See also stagnation.
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
%   spec    - (char) specifies input quantity (see options below)
%   Q_in    - (1×1 double) input quantity, Qᵢₙ (specified by "spec")
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M       - (1×1 double) local Mach number, M
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
function M = stagnation_inverse(spec,Q_in,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % A from Tₜ/T or hₜ/h
    if strcmpi(spec,'Tt/T') || strcmpi(spec,'ht/h')
        A = Q_in;
        
    % A from Pₜ/P
    elseif strcmpi(spec,'Pt/P')
        A = Q_in^((gamma-1)/gamma);
        
    % A from ρₜ/ρ
    elseif strcmpi(spec,'rhot/rho')
        A = Q_in^(gamma-1);
        
    % A from aₜ/a
    elseif strcmpi(spec,'at/a')
        A = Q_in^2;
        
    end
    
    % M from A
    M = sqrt((2/(gamma-1))*(A-1));
    
end