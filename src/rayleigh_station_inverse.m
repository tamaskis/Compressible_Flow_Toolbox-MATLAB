%==========================================================================
%
% rayleigh_station_inverse  Calculates the Mach number at one station given
% the Mach number at the other station and some ratio/difference between
% the two stations.
%
%   M1 = rayleigh_station_inverse(M2,T2_T1,gamma,'M2','T2/T1')
%   M1 = rayleigh_station_inverse(M2,P2_P1,gamma,'M2','P2/P1')
%   M1 = rayleigh_station_inverse(M2,h2_h1,gamma,'M2','h2/h1')
%   M1 = rayleigh_station_inverse(M2,rho2_rho1,gamma,'M2','rho2/rho1')
%   M1 = rayleigh_station_inverse(M2,U2_U1,gamma,'M2','U2/U1')
%   M1 = rayleigh_station_inverse(M2,Tt2_Tt1,gamma,'M2','Tt2/Tt1')
%   M1 = rayleigh_station_inverse(M2,Pt2_Pt1,gamma,'M2','Pt2/Pt1')
%   M1 = rayleigh_station_inverse(M2,ht2_ht1,gamma,'M2','ht2/ht1')
%   M1 = rayleigh_station_inverse(M2,ds_cp,gamma,'M2','(s2-s1)/cp')
%
%   M2 = rayleigh_station_inverse(M1,T2_T1,gamma,'M1','T2/T1')
%   M2 = rayleigh_station_inverse(M1,P2_P1,gamma,'M1','P2/P1')
%   M2 = rayleigh_station_inverse(M1,h2_h1,gamma,'M1','h2/h1')
%   M2 = rayleigh_station_inverse(M1,rho2_rho1,gamma,'M1','rho2/rho1')
%   M2 = rayleigh_station_inverse(M1,U2_U1,gamma,'M1','U2/U1')
%   M2 = rayleigh_station_inverse(M1,Tt2_Tt1,gamma,'M1','Tt2/Tt1')
%   M2 = rayleigh_station_inverse(M1,Pt2_Pt1,gamma,'M1','Pt2/Pt1')
%   M2 = rayleigh_station_inverse(M1,ht2_ht1,gamma,'M1','ht2/ht1')
%   M2 = rayleigh_station_inverse(M1,ds_cp,gamma,'M1','(s2-s1)/cp')
%
% See also flowrayleigh
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
%   M_in    - (1×1 or N×1 or 1×N) Mach number at one station (specified by 
%             "M_spec")
%   Q_in    - (1×1 or N×1 or 1×N) input quantity (specified by "Q_spec")
%   gamma   - (1×1) specific heat ratio
%   M_spec  - (char) specifies input Mach number
%               --> 'M1' = station 1 Mach number
%               --> 'M2' = station 2 Mach number
%   Q_spec  - (char) specifies input quantity
%               --> 'T2/T1' = static temperature ratio
%               --> 'P2/P1' = static pressure ratio
%               --> 'h2/h1' = static enthalpy ratio
%               --> 'rho2/rho1' = density ratio
%               --> 'U2/U1' = velocity ratio
%               --> 'Tt2/Tt1' = stagnation temperature ratio
%               --> 'Pt2/Pt1' = stagnation pressure ratio
%               --> 'ht2/ht1' = stagnation enthalpy ratio
%               --> '(s2-s1)/cp' = nondimensional entropy change
%
% --------
% OUTPUTS:
% --------
%   M_out 	- (N×1 or 1×N) Mach number at other station
%           	--> M1 (station 1 Mach number) if M_spec = 'M2'
%           	--> M2 (station 2 Mach number) if M_spec = 'M1'
%
% -----
% NOTE:
% -----
%   --> N = length of "M_in" OR "Q_in"
%   --> If M_in is specified as a vector, Q_in must be specified as a
%       scalar, and vice-versa.
%
%==========================================================================
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