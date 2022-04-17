%==========================================================================
%
% min_M1_attached  Calculates the minimum upstream Mach number needed to
% produce an attached oblique shock for a given deflection angle.
%
%   M1_min = min_M1_attached(theta)
%   M1_min = min_M1_attached(theta,gamma)
%
% See also deflection_angle, shock_angle.
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
%   theta   - (1D double array) deflection angle [rad]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M1_min  - (1D double array) minimum upstream Mach number to produce an
%             attached oblique shock
%
%==========================================================================
function M1_min = min_M1_attached(theta,gamma)

    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % preallocates vector to store minimum upstream Mach numbers
    M1_min = zeros(size(theta));

    % finds (M1)min for each θ
    for i = 1:length(theta)
        M1_min(i) = bisection_method(@(M1)max_deflection_angle(M1,...
            gamma)-theta(i),1,1000);
    end

end