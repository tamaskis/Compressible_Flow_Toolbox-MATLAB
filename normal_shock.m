%==========================================================================
%
% normal_shock  Normal shock relations.
%
%   M2 = normal_shock(M1,gamma,'M2')
%   T2_T1 = normal_shock(M1,gamma,'T2/T1')
%   P2_P1 = normal_shock(M1,gamma,'P2/P1')
%   rho2_rho1 = normal_shock(M1,gamma,'rho2/rho1')
%   U2_U1 = normal_shock(M1,gamma,'U2/U1')
%   a2_a1 = normal_shock(M1,gamma,'a2/a1')
%   h2_h1 = normal_shock(M1,gamma,'h2/h1')
%   Tt2_Tt1 = normal_shock(M1,gamma,'Tt2/Tt1')
%   Pt2_Pt1 = normal_shock(M1,gamma,'Pt2/Pt1')
%   rhot2_rhot1 = normal_shock(M1,gamma,'rhot2/rhot1')
%   at2_at1 = normal_shock(M1,gamma,'at2/at1')
%   ht2_ht1 = normal_shock(M1,gamma,'ht2/ht1')
%   ds_cp = normal_shock(M1,gamma,'(s2-s1)/cp')
%
% See also flownormalshock
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-06-13
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
%   M1      - (N×1 or 1×N) upstream Mach number
%   gamma   - (1×1) specific heat ratio
%   spec    - (char) specifies output quantity
%               --> 'M2' = downstream Mach number
%               --> 'T2/T1' = static temperature ratio
%               --> 'P2/P1' = static pressure ratio
%               --> 'rho2/rho1' = static density ratio
%               --> 'U2/U1' = velocity ratio
%               --> 'a2/a1' = speed of sound ratio
%               --> 'h2/h1' = static enthalpy ratio
%               --> 'Tt2/Tt1' = stagnation temperature ratio
%               --> 'Pt2/Pt1' = stagnation pressure ratio
%               --> 'rhot2/rhot1' = stagnation density ratio
%               --> 'at2/at1' = stagnation speed of sound ratio
%               --> 'ht2/ht1' = stagnation enthalpy ratio
%               --> '(s2-s1)/cp' = nondimensional entropy change
%
% --------
% OUTPUTS:
% --------
%   Q_out 	- (N×1 or 1×N) output quantity (specified by "spec")
%
% -----
% NOTE:
% -----
%   --> N = length of "M1"
%
%==========================================================================
function Q_out = normal_shock(M1,gamma,spec)
    
    % downstream Mach number
    if strcmp(spec,'M2')
        Q_out = sqrt(((2+(gamma-1)*M1.^2))./(2*gamma*M1.^2-(gamma-1)));
    
    % static temperature ratio
    elseif strcmp(spec,'T2/T1')
        Q_out = ((2*gamma*M1.^2-(gamma-1)).*(2+(gamma-1)*M1.^2))./((1+...
            gamma)^2*M1.^2);
        
    % static pressure ratio
    elseif strcmp(spec,'P2/P1')
        Q_out = 1+((2*gamma)/(gamma+1))*(M1.^2-1);
    
    % static density ratio
    elseif strcmp(spec,'rho2/rho1')
        Q_out = ((gamma+1)*M1.^2)./(2+(gamma-1)*M1.^2);
        
    % velocity ratio
    elseif strcmp(spec,'U2/U1')
        Q_out = (2+(gamma-1)*M1.^2)./((gamma+1)*M1.^2);
        
    % speed of sound ratio
    elseif strcmp(spec,'a2/a1')
        Q_out = sqrt(((2*gamma*M1.^2-(gamma-1)).*(2+(gamma-1)*M1.^2))./...
            ((1+gamma)^2*M1.^2));
        
    % static enthalpy ratio
    elseif strcmp(spec,'h2/h1')
        Q_out = ((1+gamma)^2*M1.^2)./((2*gamma*M1.^2-(gamma-1)).*(2+(...
            gamma-1)*M1.^2));
    
    % stagnation temperature ratio
    elseif strcmp(spec,'Tt2/Tt1')
        Q_out = 1;
        
    % stagnation pressure ratio
    elseif strcmp(spec,'Pt2/Pt1')
        Q_out = (((gamma+1)*M1.^2./(2+(gamma-1)*M1.^2)).^(gamma/(gamma-...
            1))).*((gamma+1)./(2*gamma*M1.^2-(gamma-1))).^(1/(gamma-1));
        
    % stagnation density ratio
    elseif strcmp(spec,'rhot2/rhot1')
        Q_out = (((gamma+1)*M1.^2./(2+(gamma-1)*M1.^2)).^(gamma/(gamma-...
            1))).*((gamma+1)./(2*gamma*M1.^2-(gamma-1))).^(1/(gamma-1));
        
    % stagnation speed of sound ratio
    elseif strcmp(spec,'at2/at1')
        Q_out = 1;
        
    % stagnation enthalpy ratio
    elseif strcmp(spec,'ht2/ht1')
        Q_out = 1;
        
    % nondimensional entropy change
    elseif strcmp(spec,'(s2-s1)/cp')
        Q_out = -log(((gamma+1)*M1.^2)./(2+(gamma-1)*M1.^2))-(1/gamma)*...
            log((gamma+1)./(2*gamma*M1.^2-(gamma-1)));
    
    end
    
end