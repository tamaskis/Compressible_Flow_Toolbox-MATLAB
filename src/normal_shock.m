%==========================================================================
%
% normal_shock  Normal shock relations.
%
%   M2 = normal_shock(M1,'M2')
%   T2_T1 = normal_shock(M1,'T2/T1')
%   P2_P1 = normal_shock(M1,'P2/P1')
%   rho2_rho1 = normal_shock(M1,'rho2/rho1')
%   U2_U1 = normal_shock(M1,'U2/U1')
%   a2_a1 = normal_shock(M1,'a2/a1')
%   h2_h1 = normal_shock(M1,'h2/h1')
%   Tt2_Tt1 = normal_shock(M1,'Tt2/Tt1')
%   Pt2_Pt1 = normal_shock(M1,'Pt2/Pt1')
%   rhot2_rhot1 = normal_shock(M1,'rhot2/rhot1')
%   at2_at1 = normal_shock(M1,'at2/at1')
%   ht2_ht1 = normal_shock(M1,'ht2/ht1')
%   ds_cp = normal_shock(M1,'(s2-s1)/cp')
%   __ = normal_shock(__,gamma)
%
% See also normal_shock_inverse.
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
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed.
%   [2] Cantwell, AA 210A Course Reader (Stanford University)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M1      - (1D double array) upstream Mach number
%   spec    - (char) specifies output quantity (see options below)
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio
%               --> defaults to 1.4
%
% -------
% OUTPUT:
% -------
%   Q_out 	- (1D double array) output quantity (specified by "spec")
%
% -------------------
% OPTIONS FOR "spec":
% -------------------
% 	--> 'M2'            - downstream Mach number
%  	--> 'T2/T1'         - static temperature ratio
%  	--> 'P2/P1'         - static pressure ratio
%  	--> 'rho2/rho1'     - static density ratio
%  	--> 'U2/U1'         - velocity ratio
%  	--> 'a2/a1'         - speed of sound ratio
% 	--> 'h2/h1'         - static enthalpy ratio
%  	--> 'Tt2/Tt1'       - stagnation temperature ratio
%  	--> 'Pt2/Pt1'       - stagnation pressure ratio
%  	--> 'rhot2/rhot1'   - stagnation density ratio
%  	--> 'at2/at1'       - stagnation speed of sound ratio
%  	--> 'ht2/ht1'       - stagnation enthalpy ratio
%   --> '(s2-s1)/cp'    - nondimensional entropy change
%
%==========================================================================
function Q_out = normal_shock(M1,spec,gamma)
    
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
    
    % downstream Mach number
    if strcmpi(spec,'M2')
        Q_out = sqrt(((2+(gamma-1)*M1.^2))./(2*gamma*M1.^2-(gamma-1)));
    
    % static temperature ratio
    elseif strcmpi(spec,'T2/T1')
        Q_out = ((2*gamma*M1.^2-(gamma-1)).*(2+(gamma-1)*M1.^2))./((1+...
            gamma)^2*M1.^2);
        
    % static pressure ratio
    elseif strcmpi(spec,'P2/P1')
        Q_out = 1+((2*gamma)/(gamma+1))*(M1.^2-1);
    
    % static density ratio
    elseif strcmpi(spec,'rho2/rho1')
        Q_out = ((gamma+1)*M1.^2)./(2+(gamma-1)*M1.^2);
        
    % velocity ratio
    elseif strcmpi(spec,'U2/U1')
        Q_out = (2+(gamma-1)*M1.^2)./((gamma+1)*M1.^2);
        
    % speed of sound ratio
    elseif strcmpi(spec,'a2/a1')
        Q_out = sqrt(((2*gamma*M1.^2-(gamma-1)).*(2+(gamma-1)*M1.^2))./...
            ((1+gamma)^2*M1.^2));
        
    % static enthalpy ratio
    elseif strcmpi(spec,'h2/h1')
        Q_out = ((1+gamma)^2*M1.^2)./((2*gamma*M1.^2-(gamma-1)).*(2+(...
            gamma-1)*M1.^2));
    
    % stagnation temperature ratio
    elseif strcmpi(spec,'Tt2/Tt1')
        Q_out = 1;
        
    % stagnation pressure ratio
    elseif strcmpi(spec,'Pt2/Pt1')
        Q_out = (((gamma+1)*M1.^2./(2+(gamma-1)*M1.^2)).^(gamma/(gamma-...
            1))).*((gamma+1)./(2*gamma*M1.^2-(gamma-1))).^(1/(gamma-1));
        
    % stagnation density ratio
    elseif strcmpi(spec,'rhot2/rhot1')
        Q_out = (((gamma+1)*M1.^2./(2+(gamma-1)*M1.^2)).^(gamma/(gamma-...
            1))).*((gamma+1)./(2*gamma*M1.^2-(gamma-1))).^(1/(gamma-1));
        
    % stagnation speed of sound ratio
    elseif strcmpi(spec,'at2/at1')
        Q_out = 1;
        
    % stagnation enthalpy ratio
    elseif strcmpi(spec,'ht2/ht1')
        Q_out = 1;
        
    % nondimensional entropy change
    elseif strcmpi(spec,'(s2-s1)/cp')
        Q_out = -log(((gamma+1)*M1.^2)./(2+(gamma-1)*M1.^2))-(1/gamma)*...
            log((gamma+1)./(2*gamma*M1.^2-(gamma-1)));
    
    end
    
end