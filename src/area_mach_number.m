%==========================================================================
%
% area_mach_number  Area ratio from Mach number (using Mach-area relation).
%
%   Astar_A = area_mach_number(M)
%   Astar_A = area_mach_number(M,'reciprocal')
%   A_Astar = area_mach_number(M,'classic')
%   __ = area_mach_number(__,gamma)
%
% See also area_mach_number_inverse.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-09-13
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed.
%   [2] Cantwell, AA 210A Course Reader (Stanford University)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   M       - (1D double array) local Mach number
%   type    - (OPTIONAL) (char) 'reciprocal' or 'classic'
%               --> defaults to 'reciprocal'
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio
%               --> defaults to 1.4
%
% -------
% OUTPUT:
% -------
%   f       - (1D double array) evaluation of area-Mach number relation
%               --> A*/A if type = 'reciprocal'
%               --> A/A* if type = 'classic'
%
%==========================================================================
function f = area_mach_number(M,type,gamma)
    
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

    % calculates specified area ratio
    if strcmpi(type,'classic')
        f = (1./M).*((2+(gamma-1)*M.^2)/(gamma+1)).^((gamma+1)/(2*(...
            gamma-1)));
    else
        f = M*((gamma+1)./(2+(gamma-1)*M.^2)).^((gamma+1)/(2*(...
            gamma-1)));
    end
    
end