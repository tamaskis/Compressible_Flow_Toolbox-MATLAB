% normal_shock_inverse  Calculates the Mach number upstream of a normal
% shock given some some input quantity.
%
%   M1 = normal_shock_inverse(Q_in,gamma,spec) returns the upstream Mach 
%   number "M1" based on some input quantity "Q_in" and specific heat ratio 
%   "gamma". "Q_in" can be input as an array; in that case, the function
%   will return an array of the same size. The identifier "spec" (that
%   identifies the input "Q_in") can have the following values:
%    --> 'M2' = downstream Mach number
%    --> 'T2/T1' = static temperature ratio
%    --> 'P2/P1' = static pressure ratio
%    --> 'rho2/rho1' = static density ratio
%    --> 'U2/U1' = velocity ratio
%    --> 'a2/a1' = speed of sound ratio
%    --> 'h2/h1' = static enthalpy ratio
%    --> 'Tt2/Tt1' = stagnation temperature ratio
%    --> 'Pt2/Pt1' = stagnation pressure ratio
%    --> 'rhot2/rhot1' = stagnation density ratio
%    --> 'at2/at1' = stagnation speed of sound ratio
%    --> 'ht2/ht1' = stagnation enthalpy ratio
%    --> '(s2-s1)/cp' = nondimensional entropy change
%
% See also flownormalshock
%
% GitHub: https://github.com/tamaskis/compressible_flow_relations-MATLAB
%
% See "Compressible Flow Relations - MATLAB implementation" for additional
% documentation. Examples can be found in EXAMPLES_NORMAL_SHOCK.m. Both of
% these files are included with the download of the "Compressible Flow
% Relations" toolbox.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: Q_in - some input quantity  (specified by "spec")
%        gamma - specific heat ratio
%        spec - identifies input quantity
% OUTPUT: M1 - upstream Mach number
function M1 = normal_shock_inverse(Q_in,gamma,spec)
    
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