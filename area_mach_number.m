%==========================================================================
%
% area_mach_number  Area ratio from Mach number (using Mach-area relation).
%
%   Astar_A = area_mach_number(M,gamma)
%   Astar_A = area_mach_number(M,gamma,'reciprocal')
%   A_Astar = area_mach_number(M,gamma,'classic')
%
% See also flowisentropic
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
%   M       - (N×1 or 1×N) local Mach number
%   gamma   - (1×1) specific heat ratio
%   type    - (OPTIONAL) (char) 'reciprocal' or 'classic'
%               --> defaults to 'reciprocal'
%
% --------
% OUTPUTS:
% --------
%   f       - (N×1 or 1×N) evaluation of area-Mach number relation
%               --> A*/A if type = 'reciprocal'
%               --> A/A* if type = 'classic'
%
% -----
% NOTE:
% -----
%   --> N = length of "M"
%
%==========================================================================
function f = area_mach_number(M,gamma,type)
    
    % defaults "type" to 'reciprocal' if not specified
    if (nargin == 2) || isempty(type)
        type = 'reciprocal';
    end

    % calculates specified area ratio
    if strcmp(type,'classic')
        f = (1./M).*((2+(gamma-1)*M.^2)/(gamma+1)).^((gamma+1)/(2*(...
            gamma-1)));
    else
        f = M*((gamma+1)./(2+(gamma-1)*M.^2)).^((gamma+1)/(2*(...
            gamma-1)));
    end
    
end