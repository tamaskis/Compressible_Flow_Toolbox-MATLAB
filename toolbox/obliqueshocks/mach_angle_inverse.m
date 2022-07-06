%==========================================================================
%
% mach_angle_inverse  Local Mach number from Mach angle.
%
%   M = mach_angle_inverse(mu)
%   M = mach_angle_inverse(mu,'rad')
%   M = mach_angle_inverse(mu,'deg')
%
% See also mach_angle.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-16
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
%   mu      - (1×1 double) Mach angle
%               --> [rad] if units = 'rad' (default if "units" not input)
%               --> [deg] if units = 'deg'
%   units   - (char) (OPTIONAL) 'rad' or 'deg' (defaults to 'rad')
%
% -------
% OUTPUT:
% -------
%   M       - (1×1 double) local Mach number
%
%==========================================================================
function M = mach_angle_inverse(mu,units)
    
    % defaults units to radians if not specified
    if (nargin == 1) || isempty(units)
        units = 'rad';
    end
    
    % converts to radians if needed
    if strcmpi(units,'deg')
        mu = (pi/180)*mu;
    end
    
    % local Mach number
    M = csc(mu);
    
end