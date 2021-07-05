%==========================================================================
%
% isentropic_process  Converts any ratio to any other ratio in an 
% isentropic process involving a calorically perfect gas.
%
%   Q_out = isentropic_process(Q_in,spec_in,'T2/T1',gamma)
%
% See also flowisentropic.
%
% Copyright © 2021 Tamas Kis
% Contact: tamas.a.kis@outlook.com
% Last Update: 2021-07-04
%
%--------------------------------------------------------------------------
%
% MATLAB Central File Exchange: 
% GitHub: https://github.com/tamaskis/compressible_flow_toolbox-MATLAB
%
% See EXAMPLES.mlx for examples and "DOCUMENTATION.pdf" for additional 
% documentation. Both of these files are included with the download.
%
%--------------------------------------------------------------------------
%
% -------
% INPUTS:
% -------
%   Q_in        - (N×1 or 1×N) input quantity
%   spec_in     - (char) specifies input quantity
%   spec_out    - (char) specifies output quantity
%   gamma       - (1×1) specific heat ratio
%
% --------
% OUTPUTS:
% --------
%   Q_out       - (N×1 or 1×N) output quantity (specified by "spec_out")
%
% -----------------------------
% OPTIONS FOR spec_in/spec_out:
% -----------------------------
%   --> 'T2/T1'         - static temperature ratio
%   --> 'P2/P1'         - static pressure ratio
%   --> 'h2/h1'         - static enthalpy ratio
%	--> 'rho2/rho1'     - static density ratio
% 	--> 'a2/a1'         - speed of sound ratio
% 	--> 'Tt2/Tt1'       - stagnation temperature ratio
% 	--> 'Pt2/Pt1'       - stagnation pressure ratio
% 	--> 'ht2/ht1'       - stagnation enthalpy ratio
% 	--> 'rhot2/rhot1'   - stagnation density ratio
%	--> 'at2/at1'       - stagnation speed of sound ratio
%
% -----
% NOTE:
% -----
%   --> N = length of "Q_in"
%
%==========================================================================
function Q_out = isentropic_process(Q_in,spec_in,spec_out,gamma)
    
    % converts any input to a temperature ratio
    if strcmp(spec_in,'T2/T1') || strcmp(spec_in,'Tt2/Tt1')
        T2_T1 = Q_in;
    elseif strcmp(spec_in,'P2/P1') || strcmp(spec_in,'Pt2/Pt1')
        T2_T1 = Q_in.^((gamma-1)/gamma);
    elseif strcmp(spec_in,'h2/h1') || strcmp(spec_in,'ht2/ht1')
        T2_T1 = Q_in;
    elseif strcmp(spec_in,'rho2/rho1') || strcmp(spec_in,'rhot2/rhot1')
        T2_T1 = Q_in.^(gamma-1);
    elseif strcmp(spec_in,'a2/a1') || strcmp(spec_in,'at2/at1')
        T2_T1 = Q_in.^2;
    end
    
    % converts temperature ratio to desired output
    if strcmp(spec_out,'T2/T1') || strcmp(spec_out,'Tt2/Tt1')
        Q_out = T2_T1;
    elseif strcmp(spec_out,'P2/P1') || strcmp(spec_out,'Pt2/Pt1')
        Q_out = T2_T1.^(gamma/(gamma-1));
    elseif strcmp(spec_out,'h2/h1') || strcmp(spec_out,'ht2/ht1')
        Q_out = T2_T1;
    elseif strcmp(spec_out,'rho2/rho1') || strcmp(spec_out,'rhot2/rhot1')
        Q_out = T2_T1.^(1/(gamma-1));
    elseif strcmp(spec_in,'a2/a1') || strcmp(spec_out,'at2/at1')
        Q_out = sqrt(T2_T1);
    end
    
end