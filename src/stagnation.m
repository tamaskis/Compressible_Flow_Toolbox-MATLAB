%==========================================================================
%
% stagnation  Stagnation-to-static ratios based on local Mach number.
%
%   Tt_T = stagnation(M,gamma,'Tt/T')
%   Pt_P = stagnation(M,gamma,'Pt/P')
%   rhot_rho = stagnation(M,gamma,'rhot/rho')
%   at_a = stagnation(M,gamma,'at/a')
%   ht_h = stagnation(M,gamma,'ht/h')
%
% See also inverse_stagnation, flowisentropic.
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
%   M       - (N×1 or 1×N) local Mach number
%   gamma   - (1×1) specific heat ratio
%   spec    - (char) specifies output quantity
%               --> 'Tt/T' = stagnation-to-static temperature ratio
%               --> 'Pt/P' = stagnation-to-static pressure ratio
%               --> 'rhot/rho' = stagnation-to-static density ratio
%               --> 'at/a' = stagnation-to-static speed of sound ratio
%               --> 'ht/h' = stagnation-to-static enthalpy ratio
%
% --------
% OUTPUTS:
% --------
%   Q_out 	- (N×1 or 1×N) output quantity (specified by "spec")
%
% -----
% NOTE:
% -----
%   --> N = length of "M"
%
%==========================================================================
function Q_out = stagnation(M,gamma,spec)
    
    % stagnation-to-static temperature ratio
    if strcmp(spec,'Tt/T')
        Q_out = 1+((gamma-1)/2)*M.^2;
    
    % stagnation-to-static pressure ratio
    elseif strcmp(spec,'Pt/P')
        Q_out = (1+((gamma-1)/2)*M.^2).^(gamma/(gamma-1));
    
    % stagnation-to-static density ratio
    elseif strcmp(spec,'rhot/rho')
        Q_out = (1+((gamma-1)/2)*M.^2).^(1/(gamma-1));
        
    % stagnation-to-static speed of sound ratio
    elseif strcmp(spec,'at/a')
        Q_out = sqrt(1+((gamma-1)/2)*M.^2);
        
    % stagnation-to-static enthalpy ratio
    elseif strcmp(spec,'ht/h')
        Q_out = 1+((gamma-1)/2)*M.^2;
        
    end
    
end