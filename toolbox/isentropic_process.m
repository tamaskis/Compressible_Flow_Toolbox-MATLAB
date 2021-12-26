%==========================================================================
%
% isentropic_process  Converts any ratio to any other ratio in an 
% isentropic process involving a calorically perfect gas.
%
%   Q_out = isentropic_process(spec_in,Q_in,spec_out)
%   Q_out = isentropic_process(spec_in,Q_in,spec_out,gamma)
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-09-13
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed. (p. 30)
%   [2] Cantwell, AA 210A Course Reader (Stanford University) (p. 2-17)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   spec_in     - (char) specifies input quantity (see options below)
%   Q_in        - (1D double array) input quantity
%   spec_out    - (char) specifies output quantity (see options below)
%   gamma       - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 
%                 1.4)
%
% -------
% OUTPUT:
% -------
%   Q_out       - (1D double array) output quantity (specified by 
%                 "spec_out")
%
% -----------------------------------
% OPTIONS FOR "spec_in" / "spec_out":
% -----------------------------------
%   --> 'T2/T1'         - static temperature ratio
%   --> 'P2/P1'         - static pressure ratio
%	--> 'rho2/rho1'     - static density ratio
% 	--> 'a2/a1'         - speed of sound ratio
%   --> 'h2/h1'         - static enthalpy ratio
% 	--> 'Tt2/Tt1'       - stagnation temperature ratio
% 	--> 'Pt2/Pt1'       - stagnation pressure ratio
% 	--> 'rhot2/rhot1'   - stagnation density ratio
%	--> 'at2/at1'       - stagnation speed of sound ratio
% 	--> 'ht2/ht1'       - stagnation enthalpy ratio
%
%==========================================================================
function Q_out = isentropic_process(spec_in,Q_in,spec_out,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % converts any input to a temperature ratio
    if strcmpi(spec_in,'T2/T1') || strcmpi(spec_in,'Tt2/Tt1')
        T2_T1 = Q_in;
    elseif strcmpi(spec_in,'P2/P1') || strcmpi(spec_in,'Pt2/Pt1')
        T2_T1 = Q_in.^((gamma-1)/gamma);
    elseif strcmpi(spec_in,'rho2/rho1') || strcmpi(spec_in,'rhot2/rhot1')
        T2_T1 = Q_in.^(gamma-1);
    elseif strcmpi(spec_in,'a2/a1') || strcmpi(spec_in,'at2/at1')
        T2_T1 = Q_in.^2;
    elseif strcmpi(spec_in,'h2/h1') || strcmpi(spec_in,'ht2/ht1')
        T2_T1 = Q_in;
    end
    
    % converts temperature ratio to desired output
    if strcmpi(spec_out,'T2/T1') || strcmpi(spec_out,'Tt2/Tt1')
        Q_out = T2_T1;
    elseif strcmpi(spec_out,'P2/P1') || strcmpi(spec_out,'Pt2/Pt1')
        Q_out = T2_T1.^(gamma/(gamma-1));
    elseif strcmpi(spec_out,'rho2/rho1') || strcmpi(spec_out,'rhot2/rhot1')
        Q_out = T2_T1.^(1/(gamma-1));
    elseif strcmpi(spec_out,'a2/a1') || strcmpi(spec_out,'at2/at1')
        Q_out = sqrt(T2_T1);
    elseif strcmpi(spec_out,'h2/h1') || strcmpi(spec_out,'ht2/ht1')
        Q_out = T2_T1;
    end
    
end