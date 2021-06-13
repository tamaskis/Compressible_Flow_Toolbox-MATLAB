% area_mach_number_inverse  Finds the local Mach number from
% either the sonic-to-local or local-to-sonic area ratio.
%
%   [M_subsonic,M_supersonic] = area_mach_number_inverse(Astar_A,gamma)
%   returns the subsonic and supersonic solutions "M_subsonic" and 
%   "M_supersonic", respectively, for the local Mach number corresponding 
%   to the quasi-1D flow of a gas with specific heat ratio "gamma" and 
%   sonic-to-local area ratio A*/A.
%
%   [M_subsonic,M_supersonic] = area_mach_number_inverse(Astar_A,gamma,...
%   'reciprocal') returns the subsonic and supersonic solutions 
%   "M_subsonic" and "M_supersonic", respectively, for the local Mach 
%   number corresponding to the quasi-1D flow of a gas with specific heat 
%   ratio "gamma" and sonic-to-local area ratio A*/A.
%
%   [M_subsonic,M_supersonic] = area_mach_number_inverse(A_Astar,gamma,...
%   'classic') returns the subsonic and supersonic solutions "M_subsonic"
%   and "M_supersonic", respectively, for the local Mach number
%   corresponding to the quasi-1D flow of a gas with specific heat ratio 
%   "gamma" and local-to-sonic area ratio A/A*.
%
%   NOTE: The input "Astar_A" or "A_Astar" can be an array. The function 
%         will then return arrays of the same size.
%
% See also flowisentropic
%
% GitHub: https://github.com/tamaskis/compressible_flow_relations-MATLAB
%
% See "Compressible Flow Relations - MATLAB implementation" for additional
% documentation. Examples can be found in EXAMPLES_AREA_MACH_NUMBER.m. Both
% of these files are included with the download of the "Compressible Flow
% Relations" toolbox.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: area_ratio - either A*/A or A/A* (specified by "type")
%        gamma - specific heat ratio
%        type - 'reciprocal' or 'classic' (defaults to 'reciprocal')
%               (OPTIONAL)
% OUTPUT: [M_subsonic,M_supersonic] - subsonic and supersonic solutions of
%                                     the area-Mach number relation for the
%                                     local Mach number M
function [M_subsonic,M_supersonic] = area_mach_number_inverse(...
    area_ratio,gamma,type)
    
    % defaults "type" to 'reciprocal' if not specified
    if (nargin == 2) || isempty(type)
        type = 'reciprocal';
    end
    
    % determines A*/A
    if strcmp(type,'classic')
        Astar_A = 1./area_ratio;
    else
        Astar_A = area_ratio;
    end
    
    % finds subsonic and supersonic roots when multiple area ratios given
    if length(area_ratio) > 1
        
        % sets up function to find root of
        g = @(M,i) M*((gamma+1)/(2+(gamma-1)*M^2))^((gamma+1)/(2*(gamma-...
            1)))-Astar_A(i);
    
        % preallocates arrays
        M_subsonic = zeros(size(area_ratio));
        M_supersonic = zeros(size(area_ratio));
        
        % finds subsonic and supersonic roots at each area ratio
        for i = 1:length(area_ratio)
            
            % assigns new function handle
            gi = @(M) g(M,i);
            
            % finds subsonic and supersonic roots
            M_subsonic(i) = secant_method(gi,0.5,1e-12);
            M_supersonic(i) = secant_method(gi,1.5,1e-12);
            
            % handles special case where A*/A = 1 (because we know the 
            % exact solution in this case and can eliminate numerical 
            % error)
            if (Astar_A(i) == 1)
                M_subsonic(i) = 1;
                M_supersonic(i) = 1;
            end
            
        end
        
    % finds subsonic and supersonic roots when one area ratio given
    else
        
        % sets up function to find root of
        g = @(M) M*((gamma+1)/(2+(gamma-1)*M^2))^((gamma+1)/(2*(gamma-...
            1)))-Astar_A;
        
        % finds subsonic and supersonic roots
        M_subsonic = secant_method(g,0.1,1e-12);
        M_supersonic = secant_method(g,1.5,1e-12);
        
        % handles special case where A*/A = 1 (because we know the exact
        % solution in this case and can eliminate numerical error)
        if (Astar_A == 1)
            M_subsonic = 1;
            M_supersonic = 1;
        end
        
    end
    
end