% rayleigh_sonic_inverse  Calculates the subsonic and supersonic solutions
% for the local Mach number in a Rayleigh flow given some input quantity 
% that is a ratio or difference between local and sonic conditions.
%
%   [M_subsonic,M_supersonic] = rayleigh_sonic_inverse(Q_in,gamma,spec) 
%   returns the subsonic and supersonic solutions M_subsonic and 
%   M_supersonic, respectively, for the local Mach number "M1" based on 
%   some input quantity "Q_in" and specific heat ratio "gamma". "Q_in" can 
%   be input as an array; in that case, the function will return an array 
%   of the same size. The identifier "spec" (that dentifies the input 
%   "Q_in") can have the following values:
%    --> 'T/T*' = local-to-sonic static temperature ratio
%    --> 'P/P*' = local-to-sonic static pressure ratio
%    --> 'h/h*' = local-to-sonic static enthalpy ratio
%    --> 'rho/rho*' = local-to-sonic density ratio
%    --> 'U/U*' = local-to-sonic velocity ratio
%    --> 'Tt/Tt*' = local-to-sonic stagnation temperature ratio
%    --> 'Pt/Pt*' = local-to-sonic stagnation pressure ratio
%    --> 'ht/ht*' = local-to-sonic stagnation enthalpy ratio
%    --> '(s-s*)/cp' = nondimensional entropy change (from sonic to local)
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

% INPUT: Q_in - some input quantity  (specified by "spec")
%        gamma - specific heat ratio
%        spec - identifies input quantity
% OUTPUT: [M_subsonic,M_supersonic] - subsonic and supersonic solutions for
%                                     the local Mach number
function [M_subsonic,M_supersonic] = rayleigh_sonic_inverse(Q_in,gamma,...
    spec)
    
    % finds subsonic + supersonic roots when multiple values of Q_in given
    if length(Q_in) > 1
        
        % sets up function to find root of
        g = @(M,i) rayleigh_sonic(M,gamma,spec)-Q_in(i);
    
        % preallocates arrays
        M_subsonic = zeros(size(Q_in));
        M_supersonic = zeros(size(Q_in));
        
        % finds subsonic and supersonic roots at each value of Q_in
        for i = 1:length(Q_in)
            
            % assigns new function handle
            gi = @(M) g(M,i);
            
            % finds subsonic and supersonic roots
            M_subsonic(i) = secant_method(gi,0.5,1e-12);
            M_supersonic(i) = secant_method(gi,1.5,1e-12);
            
            % handles special case where Q_in = 1 (because we know the 
            % exact solution in this case and can eliminate numerical 
            % error)
            if (Q_in(i) == 1)
                M_subsonic(i) = 1;
                M_supersonic(i) = 1;
            end
            
        end
        
    % finds subsonic and supersonic roots when one area ratio given
    else
        
        % sets up function to find root of
        g = @(M) rayleigh_sonic(M,gamma,spec)-Q_in;
        
        % finds subsonic and supersonic roots
        M_subsonic = secant_method(g,0.1,1e-12);
        M_supersonic = secant_method(g,1.5,1e-12);
        
        % handles special case where Q_in = 1 (because we know the exact
        % solution in this case and can eliminate numerical error)
        if (Q_in == 1)
            M_subsonic = 1;
            M_supersonic = 1;
        end
        
    end
    
end