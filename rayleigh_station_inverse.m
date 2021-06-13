% rayleigh_station_inverse  Calculates the Mach number at one station given
% the Mach number at the other station and some ratio/difference between
% the two stations.
%
%   M_out = rayleigh_station_inverse(M_in,Q_in,gamma,M_spec,Q_spec) returns
%   the Mach number "M_out" at one station given the Mach number "M_in" at
%   the other station, some input quantity "Q_in", and the specific heat 
%   ratio "gamma". "M_in" and "Q_in"  may be input as arrays (as long as
%   they are the same size); in that case, the function will return an
%   array of the same size. The identifier "M_spec" (that identifies the 
%   input "M_in") can have the following values:
%    --> 'M1' = Mach number at station 1 (then M_out will be the Mach
%               number at station 2, M2)
%    --> 'M2' = Mach number at station 2 (then M_out will be the Mach
%               number at station 1, M1)
%   The identifier "Q_spec" (that identifies the input "Q_in") can have the
%   following values:
%    --> 'T2/T1' = static temperature ratio
%    --> 'P2/P1' = static pressure ratio
%    --> 'h2/h1' = static enthalpy ratio
%    --> 'rho2/rho1' = density ratio
%    --> 'U2/U1' = velocity ratio
%    --> 'Tt2/Tt1' = stagnation temperature ratio
%    --> 'Pt2/Pt1' = stagnation pressure ratio
%    --> 'ht2/ht1' = stagnation enthalpy ratio
%    --> '(s2-s1)/cp' = nondimensional entropy change
%
% See also flowrayleigh
%
% GitHub: https://github.com/tamaskis/compressible_flow_relations-MATLAB
%
% See "Compressible Flow Relations - MATLAB implementation" for additional
% documentation. Examples can be found in EXAMPLES_RAYLEIGH.m. Both of
% these files are included with the download of the "Compressible Flow
% Relations" toolbox.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: M_in - Mach number at one station (specified by "M_spec")
%        Q_in - some input quantity  (specified by "Q_spec")
%        gamma - specific heat ratio
%        M_spec - identifies input Mach number
%        Q_spec - identifies input quantity
% OUTPUT: M_out - Mach number at the other station
function M_out = rayleigh_station_inverse(M_in,Q_in,gamma,M_spec,Q_spec)
    
    % makes arrays if necessary
    if (length(M_in) > 1) && (length(Q_in) == 1)
        Q_in = Q_in*ones(size(M_in));
    elseif (length(Q_in) > 1) && (length(M_in) == 1)
        M_in = M_in*ones(size(Q_in));
    end
    
    % finds subsonic and supersonic roots when multiple M_in/Q_in 
    % combinations are given
    if length(M_in) > 1
        
        % sets up function to find root of
        if strcmp(M_spec,'M1')
            g = @(M,i) rayleigh_station(M_in(i),M,gamma,Q_spec)-Q_in(i);
        else
            g = @(M,i) rayleigh_station(M,M_in(i),gamma,Q_spec)-Q_in(i);
        end
    
        % preallocates array
        M_out = zeros(size(M_in));
        
        % calculates M_out for each M_in/Q_in combination
        for i = 1:length(M_in)
            
            % assigns new function handle
            gi = @(M) g(M,i);
            
            % finds root - accounts for if the flow is supersonic or 
            % subsonic (if the flow is supersonic, must stay supersonic and 
            % vice-versa)
            if (M_in(i) >= 1)
                M_out(i) = secant_method(gi,1.5,1e-12);
            else
                M_out(i) = bisection_method(gi,0,1,1e-12);
            end
            
        end
        
    % finds root when a single M_in/Q_in combination given
    else
        
        % sets up function that we will find root of to find M_out
        if strcmp(M_spec,'M1')
            g = @(M) rayleigh_station(M_in,M,gamma,Q_spec)-Q_in;
        else
            if M_in < 1 && ~strcmp(Q_spec,'rho2/rho1')
                g = @(M) 1/rayleigh_station(M,M_in,gamma,Q_spec)-1/Q_in;
            else
                g = @(M) rayleigh_station(M,M_in,gamma,Q_spec)-Q_in;
            end
        end

        % finds root of g(M_out) (essentially calculating M_out from 
        % input), accounting for if the flow is supersonic or subsonic (if
        % the flow is supersonic, must stay supersonic and vice-versa)
        if (M_in >= 1)
            M_out = secant_method(g,1.5,1e-12);
        else
            if strcmp(Q_spec,'T2/T1') || strcmp(Q_spec,'h2/h1')
                if strcmp(M_spec,'M1')
                    M_out_lower = secant_method(g,0.5,1e-12);
                    M_out_upper = secant_method(g,0.9,1e-12);
                    M_out = [M_out_lower,M_out_upper];
                else
                    M_out = bisection_method(g,0,1,1e-12);
                end
            else
                M_out = bisection_method(g,0,1,1e-12);
            end
        end

    end
    
end