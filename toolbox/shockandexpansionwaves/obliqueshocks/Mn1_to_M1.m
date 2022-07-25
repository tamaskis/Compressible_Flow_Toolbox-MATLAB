%==========================================================================
%
% Mn1_to_M1  Normal Upstream Mach number to upstream Mach number for an
% oblique shock.
%
%   M1 = Mn1_to_M1(Mn1,beta)
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
%   Mn1     - (1×1 double) normal upstream Mach number, Mₙ₁
%   beta    - (1×1 double) shock angle, β [rad]
%
% -------
% OUTPUT:
% -------
%   M1      - (1×1 double) upstream Mach number, M₁
%
%==========================================================================
function M1 = Mn1_to_M1(Mn1,beta)
    M1 = Mn1*csc(beta);
end