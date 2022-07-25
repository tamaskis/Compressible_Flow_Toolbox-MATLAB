%==========================================================================
%
% mach_angle  Mach angle from local Mach number.
%
%   mu = mach_angle(M)
%
% See also mach_angle_inverse.
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
%   M       - (1×1 double) local Mach number, M
%
% -------
% OUTPUT:
% -------
%   mu      - (1×1 double) Mach angle, μ [rad]
%
%==========================================================================
function mu = mach_angle(M)
    mu = asin(1/M);
end