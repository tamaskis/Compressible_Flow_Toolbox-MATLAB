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
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-25
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed. (p. 131)
%   [2] Cantwell, AA 210A Course Reader (Stanford University) (p. 12-6)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   mu      - (1D double array) Mach angle
%               --> [rad] if units = 'rad' (default if "units" not input)
%               --> [deg] if units = 'deg'
%   units   - (OPTIONAL) (char) 'rad' or 'deg' (defaults to 'rad')
%
% -------
% OUTPUT:
% -------
%   M       - (1D double array) local Mach number
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