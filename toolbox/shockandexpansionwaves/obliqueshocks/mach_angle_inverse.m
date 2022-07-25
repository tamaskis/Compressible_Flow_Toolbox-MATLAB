%==========================================================================
%
% mach_angle_inverse  Local Mach number from Mach angle.
%
%   M = mach_angle_inverse(mu)
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
%   mu      - (1×1 double) Mach angle, μ [rad]
%
% -------
% OUTPUT:
% -------
%   M       - (1×1 double) local Mach number, M
%
%==========================================================================
function M = mach_angle_inverse(mu)
    M = csc(mu);
end