%==========================================================================
%
% area_mach_number_inverse  Mach number from area ratio (solving area-Mach
% number relation for M).
%
%   [M_sub,M_sup] = area_mach_number_inverse(Astar_A,gamma)
%   [M_sub,M_sup] = area_mach_number_inverse(Astar_A,gamma,'reciprocal')
%   [M_sub,M_sup] = area_mach_number_inverse(A_Astar,gamma,'classic')
%
% See also area_mach_number, flowisentropic.
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
%   area_ratio	- (N×1 or 1×N) area ratio
%                	--> A*/A if type = 'reciprocal'
%                	--> A/A* if type = 'classic'
%   gamma    	- (1×1) specific heat ratio
%   type        - (OPTIONAL) (char) 'reciprocal' or 'classic'
%                   --> defaults to 'reciprocal'
%
% --------
% OUTPUTS:
% --------
%   M_sub       - (N×1 or 1×N) subsonic solution of area-Mach number
%                 relation for local Mach number
%   M_sup       - (N×1 or 1×N) supersonic solution of area-Mach number 
%                 relation for local Mach number
%
% -----
% NOTE:
% -----
%   --> N = length of "area_ratio"
%
%==========================================================================
function [M_sub,M_sup] = area_mach_number_inverse(area_ratio,gamma,type)
    
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
        M_sub = zeros(size(area_ratio));
        M_sup = zeros(size(area_ratio));
        
        % finds subsonic and supersonic roots at each area ratio
        for i = 1:length(area_ratio)
            
            % assigns new function handle
            gi = @(M) g(M,i);
            
            % finds subsonic and supersonic roots
            M_sub(i) = secant_method(gi,0.5,1e-12);
            M_sup(i) = secant_method(gi,1.5,1e-12);
            
            % handles special case where A*/A = 1 (because we know the 
            % exact solution in this case and can eliminate numerical 
            % error)
            if (Astar_A(i) == 1)
                M_sub(i) = 1;
                M_sup(i) = 1;
            end
            
        end
        
    % finds subsonic and supersonic roots when one area ratio given
    else
        
        % sets up function to find root of
        g = @(M) M*((gamma+1)/(2+(gamma-1)*M^2))^((gamma+1)/(2*(gamma-...
            1)))-Astar_A;
        
        % finds subsonic and supersonic roots
        M_sub = secant_method(g,0.1,1e-12);
        M_sup = secant_method(g,1.5,1e-12);
        
        % handles special case where A*/A = 1 (because we know the exact
        % solution in this case and can eliminate numerical error)
        if (Astar_A == 1)
            M_sub = 1;
            M_sup = 1;
        end
        
    end
    
end