% area_mach_number  Evaluates the (reciprocal or classic) area-Mach number
% relation to find either the sonic-to-local (reciprocal form) of local-to-
% sonic (classic form) area ratio as a function of the local Mach number.
%
%   Astar_A = area_mach_number(M,gamma) returns the sonic-to-local area
%   ratio A*/A (using the reciprocal form of the area-Mach number relation)
%   corresponding to the quasi-1D flow of a gas with specific heat ratio
%   "gamma" and local Mach number "M".
%
%   Astar_A = area_mach_number(M,gamma,'reciprocal') returns the sonic-to-
%   local area ratio A*/A (using the reciprocal form of the area-Mach
%   number relation) corresponding to the quasi-1D flow of a gas with
%   specific heat ratio "gamma" and local Mach number "M".
%
%   A_Astar = area_mach_number(M,gamma,'classic') returns the local-to-
%   sonic area ratio A/A* (using the classic form of the area-Mach number
%   relation) corresponding to the quasi-1D flow of a gas with specific
%   heat ratio "gamma" and local Mach number "M".
%
%   NOTE: The input "M" can be an array. The function will then return an
%         array of the same size.
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

% INPUT: M - local Mach number
%        gamma - specific heat ratio
%        type - 'reciprocal' or 'classic' (defaults to 'reciprocal')
%               (OPTIONAL)
% OUTPUT: f - evaluation of specified area-Mach number relation (A*/A or 
%             A/A*)
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