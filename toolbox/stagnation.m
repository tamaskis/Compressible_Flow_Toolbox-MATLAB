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
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M       - (1D double array) local Mach number
%   spec    - (char) specifies output quantity (see options below)
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   Q_out 	- (1D double array) output quantity (specified by "spec")
%
% -------------------
% OPTIONS FOR "spec":
% -------------------
% 	--> 'Tt/T'      - stagnation-to-static temperature ratio
% 	--> 'Pt/P'      - stagnation-to-static pressure ratio
%  	--> 'rhot/rho'  - stagnation-to-static density ratio
%  	--> 'at/a'      - stagnation-to-static speed of sound ratio
%  	--> 'ht/h'      - stagnation-to-static enthalpy ratio
%
%==========================================================================
function Q_out = stagnation(M,spec,gamma)

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
    
    % stagnation-to-static temperature ratio
    if strcmpi(spec,'Tt/T')
        Q_out = 1+((gamma-1)/2)*M.^2;
    
    % stagnation-to-static pressure ratio
    elseif strcmpi(spec,'Pt/P')
        Q_out = (1+((gamma-1)/2)*M.^2).^(gamma/(gamma-1));
    
    % stagnation-to-static density ratio
    elseif strcmpi(spec,'rhot/rho')
        Q_out = (1+((gamma-1)/2)*M.^2).^(1/(gamma-1));
        
    % stagnation-to-static speed of sound ratio
    elseif strcmpi(spec,'at/a')
        Q_out = sqrt(1+((gamma-1)/2)*M.^2);
        
    % stagnation-to-static enthalpy ratio
    elseif strcmpi(spec,'ht/h')
        Q_out = 1+((gamma-1)/2)*M.^2;
        
    end
    
end