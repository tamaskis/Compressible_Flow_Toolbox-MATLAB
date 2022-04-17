%==========================================================================
%
% normal_shock_inverse  Determines the Mach number upstream of a normal
% shock given some input quantity.
%
%   M1 = normal_shock_inverse('M2',M2)
%   M1 = normal_shock_inverse('T2/T1',T2_T1)
%   M1 = normal_shock_inverse('P2/P1',P2_P1)
%   M1 = normal_shock_inverse('rho2/rho1',rho2_rho1)
%   M1 = normal_shock_inverse('U2/U1',U2_U1)
%   M1 = normal_shock_inverse('a2/a1',a2_a1)
%   M1 = normal_shock_inverse('h2/h1',h2_h1)
%   M1 = normal_shock_inverse('Tt2/Tt1',Tt2_Tt1)
%   M1 = normal_shock_inverse('Pt2/Pt1',Pt2_Pt1)
%   M1 = normal_shock_inverse('rhot2/rhot1',rhot2_rhot1)
%   M1 = normal_shock_inverse('at2/at1',at2_at1)
%   M1 = normal_shock_inverse('ht2/ht1',ht2_ht1)
%   M1 = normal_shock_inverse('(s2-s1)/cp',ds_cp)
%   M1 = normal_shock_inverse(__,gamma)
%
% See also normal_shock.
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
%   spec    - (char) specifies input quantity (see options below)
%   Q_in 	- (1D double array) input quantity (specified by "spec")
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M1      - (1D double array) upstream Mach number
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
function M1 = normal_shock_inverse(spec,Q_in,gamma)

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
    
    % returns M1 = NaN and displays warnings if stagnation temperature
    % ratio or stagnation enthalpy ratio are specified
    if strcmpi(spec,'Tt2/Tt1') || strcmpi(spec,'at2/at1') ||...
            strcmpi(spec,'ht2/ht1')
    
        % determines string to use
        if strcmpi(spec,'Tt2/Tt1')
            str = "stagnation temperature ratio";
        elseif strcmpi(spec,'at2/at1')
            str = "stagnation speed of sound ratio";
        elseif strcmpi(spec,'ht2/ht1')
            str = "stagnation enthalpy ratio";
        end
    
        % displays warning if Tt2/Tt1 or ht2/ht1 is anything other than 1
        if Q_in ~= 1
            warning("Input " + str + " is not equal to 1 -- the " +...
                str + " is always 1 across a normal shock.");
        end
        
        % displays general warning regarding this calculation
        warning("Cannot determine upstream Mach number -- the " + str +...
            " is 1 for any upstream Mach number.");
        
        % returns NaN because Tt2/Tt1 = at2/at2 = ht2/ht1 = 1 for any value
        % of M1
        M1 = NaN;
    
    % calculates M1 from M2
    elseif strcmpi(spec,'M2')
        M1 = sqrt((2+(gamma-1).*Q_in^2)./(2*gamma*Q_in.^2-(gamma-1)));
    
    % calculates M1 from P2/P1
    elseif strcmpi(spec,'P2/P1')
        M1 = sqrt(((gamma+1)*Q_in+(gamma-1))/(2*gamma));
        
    % calculates M1 from rho2/rho1
    elseif strcmpi(spec,'rho2/rho1')
        M1 = sqrt((2*Q_in)./((gamma+1)-(gamma-1)*Q_in));

	% calculates M1 from U2/U1
    elseif strcmpi(spec,'U2/U1')
        M1 = sqrt(2./((gamma+1)*Q_in-(gamma-1)));

    % calculates M1(i) for each Q_in(i) using root finding procedure for
    % all other inputs (no closed-form solution)
    %   --> supersonic initial guess is used because normal shocks only
    %       occur in supersonic flow
    else
        M1 = zeros(size(Q_in));
        for i = 1:length(Q_in)
            g = @(M1) normal_shock(M1,spec,gamma)-Q_in(i);
            M1(i) = secant_method(g,1.5);
        end

    end
    
end