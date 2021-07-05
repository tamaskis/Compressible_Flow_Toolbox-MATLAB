%==========================================================================
%
% normal_shock_inverse  Determines the Mach number upstream of a normal
% shock given some input quantity.
%
%   M1 = normal_shock_inverse(M2,gamma,'M2')
%   M1 = normal_shock_inverse(T2_T1,gamma,'T2/T1')
%   M1 = normal_shock_inverse(P2_P1,gamma,'P2/P1')
%   M1 = normal_shock_inverse(rho2_rho1,gamma,'rho2/rho1')
%   M1 = normal_shock_inverse(U2_U1,gamma,'U2/U1')
%   M1 = normal_shock_inverse(a2_a1,gamma,'a2/a1')
%   M1 = normal_shock_inverse(h2_h1,gamma,'h2/h1')
%   M1 = normal_shock_inverse(Tt2_Tt1,gamma,'Tt2/Tt1')
%   M1 = normal_shock_inverse(Pt2_Pt1,gamma,'Pt2/Pt1')
%   M1 = normal_shock_inverse(rhot2_rhot1,gamma,'rhot2/rhot1')
%   M1 = normal_shock_inverse(at2_at1,gamma,'at2/at1')
%   M1 = normal_shock_inverse(ht2_ht1,gamma,'ht2/ht1')
%   M1 = normal_shock_inverse(ds_cp,gamma,'(s2-s1)/cp')
%
% See also normal_shock, flownormalshock
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
%   M1      - (N×1 or 1×N) upstream Mach number
%
% -----
% NOTE:
% -----
%   --> N = length of "Q_in"
%
%==========================================================================
function M1 = inverse_normal_shock(Q_in,gamma,spec)
    
    % returns M1 = NaN and displays warnings if stagnation temperature
    % ratio or stagnation enthalpy ratio are specified
    if strcmp(spec,'Tt2/Tt1') || strcmp(spec,'at2/at1') || strcmp(spec,...
            'ht2/ht1')
    
        % determines string to use
        if strcmp(spec,'Tt2/Tt1')
            str = "stagnation temperature ratio";
        elseif strcmp(spec,'at2/at1')
            str = "stagnation speed of sound ratio";
        elseif strcmp(spec,'ht2/ht1')
            str = "stagnation enthalpy ratio";
        end
    
        % prints warning if Tt2/Tt1 or ht2/ht1 is anything other than 1
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
    elseif strcmp(spec,'M2')
        M1 = sqrt((2+(gamma-1).*Q_in^2)./(2*gamma*Q_in.^2-(gamma-1)));
    
    % calculates M1 from P2/P1
    elseif strcmp(spec,'P2/P1')
        M1 = sqrt(((gamma+1)*Q_in+(gamma-1))/(2*gamma));
        
    % calculates M1 from rho2/rho1
    elseif strcmp(spec,'rho2/rho1')
        M1 = sqrt((2*Q_in)./((1-gamma)*Q_in+(gamma+1)));

	% calculates M1 from U2/U1
    elseif strcmp(spec,'U2/U1')
        M1 = sqrt(2./((gamma+1)*Q_in-(gamma-1)));

    % calculates M1 from input quantity
    else
          
        % preallocates array to store M1 for each Q_in
        M1 = zeros(size(Q_in));
        
        % sets up function that we will find root of to find M1
        g = @(M1,i) normal_shock(M1,gamma,spec)-Q_in(i);
        
        % calculates M_out for each Q_in
        for i = 1:length(Q_in)
            
            % assigns new function handle
            gi = @(M1) g(M1,i);
            
            % finds root (uses supersonic initial guess because normal
            % shocks only occur in supersonic flow)
            M1(i) = secant_method(gi,1.5,1e-12);
            
        end

    end
    
end