%==========================================================================
%
% inverse_stagnation  Determines the local Mach number given some input 
% quantity that is a ratio between stagnation and static conditions.
%
%   M = inverse_stagnation(Tt_T,gamma,'Tt/T')
%   M = inverse_stagnation(Pt_p,gamma,'Pt/P')
%   M = inverse_stagnation(rhot_rho,gamma,'rhot/rho')
%   M = inverse_stagnation(at_a,gamma,'at/a')
%   M = inverse_stagnation(ht_h,gamma,'ht/h')
%
% See also stagnation, flowisentropic.
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
%   Q_in 	- (N×1 or 1×N) input quantity (specified by "spec")
%   gamma   - (1×1) specific heat ratio
%   spec    - (char) specifies input quantity
%               --> 'Tt/T' = stagnation-to-static temperature ratio
%               --> 'Pt/P' = stagnation-to-static pressure ratio
%               --> 'rhot/rho' = stagnation-to-static density ratio
%               --> 'at/a' = stagnation-to-static speed of sound ratio
%               --> 'ht/h' = stagnation-to-static enthalpy ratio
%
% --------
% OUTPUTS:
% --------
%   M       - (N×1 or 1×N) local Mach number
%
% -----
% NOTE:
% -----
%   --> N = length of "Q_in"
%
%==========================================================================
function M = inverse_stagnation(Q_in,gamma,spec)
    
    % Mach number from stagnation-to-static temperature ratio
    if strcmp(spec,'Tt/T')
        M = sqrt((2/(gamma-1))*(Q_in-1));
    
    % Mach number from stagnation-to-static pressure ratio
    elseif strcmp(spec,'Pt/P')
        M = sqrt((2/(gamma-1))*(Q_in.^((gamma-1)/gamma)-1));
    
    % Mach number from stagnation-to-static density ratio
    elseif strcmp(spec,'rhot/rho')
        M = sqrt((2/(gamma-1))*(Q_in.^(gamma-1)-1));
        
    % Mach number from stagnation-to-static speed of sound ratio
    elseif strcmp(spec,'at/a')
        M = sqrt((2/(gamma-1))*(Q_in.^2-1));
        
    % Mach number from stagnation-to-static enthalpy ratio
    elseif strcmp(spec,'ht/h')
        M = sqrt((2/(gamma-1))*(Q_in-1));
        
    end
    
end