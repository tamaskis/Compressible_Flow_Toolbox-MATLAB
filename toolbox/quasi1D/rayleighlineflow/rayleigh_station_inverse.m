%==========================================================================
%
% rayleigh_station_inverse  Calculates the Mach number at one station given
% the Mach number at the other station and some ratio/difference between
% the two stations.
%
%   M1 = rayleigh_station_inverse('M2',M2,'T2/T1',T2_T1)
%   M1 = rayleigh_station_inverse('M2',M2,'P2/P1',P2_P1)
%   M1 = rayleigh_station_inverse('M2',M2,'h2/h1',h2_h1)
%   M1 = rayleigh_station_inverse('M2',M2,'rho2/rho1',rho2_rho1)
%   M1 = rayleigh_station_inverse('M2',M2,'U2/U1',U2_U1)
%   M1 = rayleigh_station_inverse('M2',M2,'Tt2/Tt1',Tt2_Tt1)
%   M1 = rayleigh_station_inverse('M2',M2,'Pt2/Pt1',Pt2_Pt1)
%   M1 = rayleigh_station_inverse('M2',M2,'ht2/ht1',ht2_ht1)
%   M1 = rayleigh_station_inverse('M2',M2,'rhot2/rhot1',rhot2_rhot1)
%   M1 = rayleigh_station_inverse('M2',M2,'(s2-s1)/cp',ds_cp)
%   M1 = rayleigh_station_inverse('M2',M2,__,gamma)
%
%   M2 = rayleigh_station_inverse('M1',M1,'T2/T1',T2_T1)
%   M2 = rayleigh_station_inverse('M1',M1,'P2/P1',P2_P1)
%   M2 = rayleigh_station_inverse('M1',M1,'h2/h1',h2_h1)
%   M2 = rayleigh_station_inverse('M1',M1,'rho2/rho1',rho2_rho1)
%   M2 = rayleigh_station_inverse('M1',M1,'U2/U1',U2_U1)
%   M2 = rayleigh_station_inverse('M1',M1,'Tt2/Tt1',Tt2_Tt1)
%   M2 = rayleigh_station_inverse('M1',M1,'Pt2/Pt1',Pt2_Pt1)
%   M2 = rayleigh_station_inverse('M1',M1,'ht2/ht1',ht2_ht1)
%   M2 = rayleigh_station_inverse('M1',M1,'rhot2/rhot1',rhot2_rhot1)
%   M2 = rayleigh_station_inverse('M1',M1,'(s2-s1)/cp',ds_cp)
%   M1 = rayleigh_station_inverse('M1',M1,__,gamma)
%
% See also rayleigh_station, rayleigh_sonic, rayleigh_sonic_inverse, 
% rayleigh_heat, rayleigh_heat_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/files/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M_spec  - (char) specifies input Mach number
%               --> 'M1' = station 1 Mach number
%               --> 'M2' = station 2 Mach number
%   M_in    - (1×1 double) Mach number at one station (specified by 
%             "M_spec")
%   Q_spec  - (char) specifies input quantity (see options belows)
%   Q_in    - (1×1 double) input quantity (specified by "Q_spec")
%   gamma   - (1×1 double) (OPTIONAL) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M_out 	- (1×1 double) Mach number at other station
%           	--> M1 (station 1 Mach number) if M_spec = 'M2'
%           	--> M2 (station 2 Mach number) if M_spec = 'M1'
%
% ---------------------
% OPTIONS FOR "Q_spec":
% ---------------------
% 	--> 'T2/T1'         - static temperature ratio
% 	--> 'P2/P1'         - static pressure ratio
%  	--> 'h2/h1'         - static enthalpy ratio
%  	--> 'rho2/rho1'     - density ratio
%   --> 'U2/U1'         - velocity ratio
%	--> 'Tt2/Tt1'       - stagnation temperature ratio
%   --> 'Pt2/Pt1'       - stagnation pressure ratio
% 	--> 'ht2/ht1'       - stagnation enthalpy ratio
% 	--> '(s2-s1)/cp'    - nondimensional entropy change
%
% -----
% NOTE:
% -----
%   --> If M_in is specified as a vector, Q_in must be specified as a
%       scalar, and vice-versa.
%
%==========================================================================
function M_out = rayleigh_station_inverse(M_spec,M_in,Q_spec,Q_in,gamma)
    
    % ----------------------------------------------------
    % Sets unspecified parameters to their default values.
    % ----------------------------------------------------
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 5) || isempty(gamma)
        gamma = 1.4;
    end
    
    % -------------
    % Calculations.
    % -------------
    
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
        if strcmpi(M_spec,'M1')
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
        if strcmpi(M_spec,'M1')
            g = @(M) rayleigh_station(M_in,M,gamma,Q_spec)-Q_in;
        else
            if M_in < 1 && ~strcmpi(Q_spec,'rho2/rho1')
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
            if strcmpi(Q_spec,'T2/T1') || strcmpi(Q_spec,'h2/h1')
                if strcmpi(M_spec,'M1')
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