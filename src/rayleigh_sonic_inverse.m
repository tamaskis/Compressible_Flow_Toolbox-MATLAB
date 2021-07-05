%==========================================================================
%
% rayleigh_sonic_inverse  Calculates the subsonic and supersonic solutions
% for the local Mach number in a Rayleigh flow given some input quantity 
% that is a ratio or difference between local and sonic conditions.
%
%   [M_sub,M_sup] = rayleigh_sonic_inverse(T_Tstar,gamma,'T/T*')
%   [M_sub,M_sup] = rayleigh_sonic_inverse(P_Pstar,gamma,'P/P*')
%   [M_sub,M_sup] = rayleigh_sonic_inverse(h_hstar,gamma,'h/h*')
%   [M_sub,M_sup] = rayleigh_sonic_inverse(rho_rhostar,gamma,'rho/rho*')
%   [M_sub,M_sup] = rayleigh_sonic_inverse(U_Ustar,gamma,'U/U*')
%   [M_sub,M_sup] = rayleigh_sonic_inverse(Tt_Ttstar,gamma,'Pt/Tt*')
%   [M_sub,M_sup] = rayleigh_sonic_inverse(Pt_Ptstar,gamma,'Pt/Pt*')
%   [M_sub,M_sup] = rayleigh_sonic_inverse(ht_htstar,gamma,'ht/ht*')
%   [M_sub,M_sup] = rayleigh_sonic_inverse(ds_cp,gamma,'(s-s*)/cp')
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
%   Q_in    - (N×1 or 1×N) input quantity
%   gamma   - (1×1) specific heat ratio
%   spec    - (char) specifies input quantity
%               --> 'T/T*' = local-to-sonic static temperature ratio
%               --> 'P/P*' = local-to-sonic static pressure ratio
%               --> 'h/h*' = local-to-sonic static enthalpy ratio
%               --> 'rho/rho*' = local-to-sonic density ratio
%               --> 'U/U*' = local-to-sonic velocity ratio
%               --> 'Tt/Tt*' = local-to-sonic stagnation temperature ratio
%               --> 'Pt/Pt*' = local-to-sonic stagnation pressure ratio
%               --> 'ht/ht*' = local-to-sonic stagnation enthalpy ratio
%               --> '(s-s*)/cp' = nondimensional entropy change (from sonic
%                   to local)
%
% --------
% OUTPUTS:
% --------
%   M_sub   - (N×1 or 1×N) subsonic solution for local Mach number
%   M_sup   - (N×1 or 1×N) supersonic solution for local Mach number
%
% -----
% NOTE:
% -----
%   --> N = length of "Q_in"
%
%==========================================================================
function [M_sub,M_sup] = rayleigh_sonic_inverse(Q_in,gamma,spec)
    
    % finds subsonic + supersonic roots when multiple values of Q_in given
    if length(Q_in) > 1
        
        % sets up function to find root of
        g = @(M,i) rayleigh_sonic(M,gamma,spec)-Q_in(i);
    
        % preallocates arrays
        M_sub = zeros(size(Q_in));
        M_sup = zeros(size(Q_in));
        
        % finds subsonic and supersonic roots at each value of Q_in
        for i = 1:length(Q_in)
            
            % assigns new function handle
            gi = @(M) g(M,i);
            
            % finds subsonic and supersonic roots
            M_sub(i) = secant_method(gi,0.5,1e-12);
            M_sup(i) = secant_method(gi,1.5,1e-12);
            
            % handles special case where Q_in = 1 (because we know the 
            % exact solution in this case and can eliminate numerical 
            % error)
            if (Q_in(i) == 1)
                M_sub(i) = 1;
                M_sup(i) = 1;
            end
            
        end
        
    % finds subsonic and supersonic roots when one area ratio given
    else
        
        % sets up function to find root of
        g = @(M) rayleigh_sonic(M,gamma,spec)-Q_in;
        
        % finds subsonic and supersonic roots
        M_sub = secant_method(g,0.1,1e-12);
        M_sup = secant_method(g,1.5,1e-12);
        
        % handles special case where Q_in = 1 (because we know the exact
        % solution in this case and can eliminate numerical error)
        if (Q_in == 1)
            M_sub = 1;
            M_sup = 1;
        end
        
    end
    
end