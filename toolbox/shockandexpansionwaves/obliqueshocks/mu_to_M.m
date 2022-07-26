%==========================================================================
%
% mu_to_M  Local Mach number from Mach angle.
%
%   M = mu_to_M(mu)
%
% See also M_to_mu.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-24
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
function M = mu_to_M(mu)
    M = csc(mu);
end