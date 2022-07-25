%==========================================================================
%
% M1_to_Mn1  Upstream Mach number to normal upstream Mach number for an
% oblique shock.
%
%   Mn1 = M1_to_Mn1(M1,beta)
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
%   M1      - (1×1 double) upstream Mach number, M₁
%   beta    - (1×1 double) shock angle, β [rad]
%
% -------
% OUTPUT:
% -------
%   Mn1     - (1×1 double) normal upstream Mach number, Mₙ₁
%
%==========================================================================
function Mn1 = M1_to_Mn1(M1,beta)
    Mn1 = M1*sin(beta);
end