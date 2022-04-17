%==========================================================================
%
% mach_angle  Mach angle from local Mach number.
%
%   mu = mach_angle(M)
%   mu = mach_angle(M,'rad')
%   mu = mach_angle(M,'deg')
%
% See also mach_angle_inverse.
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
%   M       - (1D double array) local Mach number
%   units   - (OPTIONAL) (char) 'rad' or 'deg' (defaults to 'rad')
%
% -------
% OUTPUT:
% -------
%   mu      - (1D double array) Mach angle
%               --> [rad] if units = 'rad' (default if "units" not input)
%               --> [deg] if units = 'deg'
%
%==========================================================================
function mu = mach_angle(M,units)

    % defaults units to radians if not specified
    if (nargin == 1) || isempty(units)
        units = 'rad';
    end

    % Mach angle
    mu = asin(1./M);

    % converts to degrees if requested
    if strcmpi(units,'deg')
        mu = (180/pi)*mu;
    end

end