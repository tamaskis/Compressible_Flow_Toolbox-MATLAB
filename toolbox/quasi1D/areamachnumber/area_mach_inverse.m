%==========================================================================
%
% area_mach_inverse  Mach number from area ratio (solving area-Mach number 
% relation for M).
%
%   [M_sub,M_sup] = area_mach_inverse(A_Astar)
%   [M_sub,M_sup] = area_mach_inverse(A_Astar,'classic')
%   [M_sub,M_sup] = area_mach_inverse(Astar_A,'reciprocal')
%   [M_sub,M_sup] = area_mach_inverse(__,gamma)
%
% See also area_mach.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-08-01
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
%   AR	    - (1×1 double) area ratio (specified by "type")
%               --> A/A* if type = 'classic'
%               --> A*/A if type = 'reciprocal'
%   type    - (OPTIONAL) (char) 'classic' or 'reciprocal' (defaults to
%             'classic')
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M_sub   - (1×1 double) subsonic solution for Mach number
%   M_sup   - (1×1 double) supersonic solution for Mach number
%
%==========================================================================
function [M_sub,M_sup] = area_mach_inverse(AR,type,gamma)
    
    % defaults "type" to 'classic' if not specified
    if (nargin < 2) || isempty(type)
        type = 'classic';
    end
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % determines A*/A
    if strcmpi(type,'classic')
        Astar_A = 1/AR;
    else
        Astar_A = AR;
    end
    
    % handles edge case where A*/A = 1
    if (Astar_A == 1)
        M_sub = 1;
        M_sup = 1;
        return;
    end
    
    % defines the function g(M) in terms of the area_mach function
    g = @(M) area_mach(M,'reciprocal',gamma)-Astar_A;
    
    % finds subsonic and supersonic roots
    M_sub = bisection_method(g,0,1);
    M_sup = secant_method(g,2);
    
end