%==========================================================================
%
% area_mach_number_inverse  Mach number from area ratio (solving area-Mach
% number relation for M).
%
%   [M_sub,M_sup] = area_mach_number_inverse(Astar_A)
%   [M_sub,M_sup] = area_mach_number_inverse(Astar_A,'reciprocal')
%   [M_sub,M_sup] = area_mach_number_inverse(A_Astar,'classic')
%   [M_sub,M_sup] = area_mach_number_inverse(__,gamma)
%
% See also area_mach_number.
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
%   area_ratio	- (1D double array) area ratio (specified by "type")
%                   --> A*/A if type = 'reciprocal'
%                   --> A/A* if type = 'classic'
%   type        - (OPTIONAL) (char) 'reciprocal' or 'classic' (defaults to
%                 'reciprocal')
%   gamma       - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 
%                 1.4)
%
% -------
% OUTPUT:
% -------
%   M_sub       - (1D double array) subsonic solution of area-Mach number
%                 relation for local Mach number
%   M_sup       - (1D double array) supersonic solution of area-Mach number 
%                 relation for local Mach number
%
%==========================================================================
function [M_sub,M_sup] = area_mach_number_inverse(area_ratio,type,gamma)
    
    % ----------------------------------------------------
    % Sets unspecified parameters to their default values.
    % ----------------------------------------------------
    
    % defaults "type" to 'reciprocal' if not specified
    if (nargin < 2) || isempty(type)
        type = 'reciprocal';
    end
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % -------------
    % Calculations.
    % -------------
    
    % determines A*/A
    if strcmpi(type,'classic')
        Astar_A = 1./area_ratio;
    else
        Astar_A = area_ratio;
    end

    % preallocates arrays
    M_sub = zeros(size(area_ratio));
    M_sup = zeros(size(area_ratio));

    % finds subsonic and supersonic roots at each area ratio
    for i = 1:length(area_ratio)

        % sets up function to find root of
        g = @(M) M*((gamma+1)/(2+(gamma-1)*M^2))^((gamma+1)/(2*(gamma-...
        1)))-Astar_A(i);

        % finds subsonic and supersonic roots
        M_sub(i) = secant_method(g,0.5);
        M_sup(i) = secant_method(g,1.5);

        % handles special case where A*/A = 1 (because we know the exact
        % solution in this case and can eliminate numerical error)
        if (Astar_A(i) == 1)
            M_sub(i) = 1;
            M_sup(i) = 1;
        end

    end
  
end