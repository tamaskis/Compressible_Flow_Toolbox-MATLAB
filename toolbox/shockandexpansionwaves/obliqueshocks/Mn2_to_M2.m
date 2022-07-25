%==========================================================================
%
% Mn2_to_M2  Normal downstream Mach number to downstream Mach number for an
% oblique shock.
%
%   M2 = Mn2_to_M2(Mn2,theta,beta)
%
% See also TODO.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-13
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
%   Mn2     - (1×1 double) normal downstream Mach number, Mₙ₂
%   theta   - (1×1 double) deflection angle, θ [rad]
%   beta    - (1×1 double) shock angle, β [rad]
%
% -------
% OUTPUT:
% -------
%   M2      - (1×1 double) downstream Mach number, M₂
%
%==========================================================================
function M2 = Mn2_to_M2(Mn2,theta,beta)
    M2 = Mn2*csc(beta-theta);
end