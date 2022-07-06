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
%   Q_in 	- (1×1 double) input quantity (specified by "spec")
%   gamma   - (1×1 double) (OPTIONAL) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M       - (1×1 double) local Mach number
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
function M = stagnation_inverse(spec,Q_in,gamma)
    
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
    
    % Mach number from stagnation-to-static temperature ratio
    if strcmpi(spec,'Tt/T')
        M = sqrt((2/(gamma-1))*(Q_in-1));
        
    % Mach number from stagnation-to-static pressure ratio
    elseif strcmpi(spec,'Pt/P')
        M = sqrt((2/(gamma-1))*(Q_in.^((gamma-1)/gamma)-1));
        
    % Mach number from stagnation-to-static density ratio
    elseif strcmpi(spec,'rhot/rho')
        M = sqrt((2/(gamma-1))*(Q_in.^(gamma-1)-1));
        
    % Mach number from stagnation-to-static speed of sound ratio
    elseif strcmpi(spec,'at/a')
        M = sqrt((2/(gamma-1))*(Q_in.^2-1));
        
    % Mach number from stagnation-to-static enthalpy ratio
    elseif strcmpi(spec,'ht/h')
        M = sqrt((2/(gamma-1))*(Q_in-1));
        
    end
    
end