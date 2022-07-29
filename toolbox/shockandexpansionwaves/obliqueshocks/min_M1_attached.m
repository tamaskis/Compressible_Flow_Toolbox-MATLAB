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
% https://tamaskis.github.io/files/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   theta   - (1×1 double) deflection angle, θ [rad]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults to 
%             1.4)
%
% -------
% OUTPUT:
% -------
%   M1_min  - (1×1 double) minimum upstream Mach number to produce an
%             attached oblique shock, (M₁)ₘᵢₙ
%
%==========================================================================
function M1_min = min_M1_attached(theta,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % defines g(M₁) using the max_deflection_angle function
    g = @(M1) max_deflection_angle(M1,gamma)-theta;
    
    % minimum upstream Mach number to produce an attached oblique shock
    M1_min = bisection_method(g,1,25);
    
end