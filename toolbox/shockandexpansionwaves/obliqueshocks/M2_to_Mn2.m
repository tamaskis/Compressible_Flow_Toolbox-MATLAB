%==========================================================================
%
% M2_to_Mn2  Downstream Mach number to normal downstream Mach number for an
% oblique shock.
%
%   Mn2 = M2_to_Mn2(M2,theta,beta)
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
%   M2      - (1×1 double) downstream Mach number, M₂
%   theta   - (1×1 double) deflection angle, θ [rad]
%   beta    - (1×1 double) shock angle, β [rad]
%
% -------
% OUTPUT:
% -------
%   Mn2     - (1×1 double) normal downstream Mach number, Mₙ₂
%
%==========================================================================
function Mn2 = M2_to_Mn2(M2,theta,beta)
    Mn2 = M2*sin(beta-theta);
end