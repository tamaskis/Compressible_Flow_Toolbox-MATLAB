%==========================================================================
%
% area_mach  Area ratio from Mach number (using area-Mach number relation).
%
%   A_Astar = area_mach(M)
%   A_Astar = area_mach(M,'classic')
%   Astar_A = area_mach(M,'reciprocal')
%   __ = area_mach(__,gamma)
%
% See also area_mach_inverse.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-30
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
%   M       - (1×1 double) local Mach number, M
%   type    - (OPTIONAL) (char) 'classic' or 'reciprocal' (defaults to
%             'classic')
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   AR      - (1×1 double) area ratio
%               --> A/A* if type = 'classic'
%               --> A*/A if type = 'reciprocal'
%
%==========================================================================
function f = area_mach(M,type,gamma)
    
    % defaults "type" to 'classic' if not specified
    if (nargin < 2) || isempty(type)
        type = 'classic';
    end
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin < 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % A/A* from M
    if strcmpi(type,'classic')
        f = (1/M)*((2+(gamma-1)*M^2)/(gamma+1))^((gamma+1)/(2*(gamma-1)));
        
    % A*/A from M
    else
        f = M*((gamma+1)/(2+(gamma-1)*M^2))^((gamma+1)/(2*(gamma-1)));
        
    end
    
end