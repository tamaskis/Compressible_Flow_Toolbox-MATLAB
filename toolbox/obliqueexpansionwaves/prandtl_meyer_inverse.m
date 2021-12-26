%==========================================================================
%
% prandtl_meyer_inverse  Inverse Prandtl-Meyer function.
%
%   M = prandtl_meyer_inverse(w)
%   M = prandtl_meyer_inverse(w,gamma)
%
% See also prandtl_meyer_inverse.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-09-13
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Compressible_Flow_Relations.pdf
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed.
%   [2] Cantwell, AA 210A Course Reader (Stanford University)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   w       - (1D double array) angle required to accelerate flow from 
%             Mach 1 to the local Mach number [rad]
%   gamma   - (OPTIONAL) (1×1 double) specific heat ratio (defaults to 1.4)
%
% -------
% OUTPUT:
% -------
%   M       - (1D double array) local Mach number
%
%==========================================================================
function M = prandtl_meyer_inverse(w,gamma)
    
    % ----------------------------------------------------
    % Sets unspecified parameters to their default values.
    % ----------------------------------------------------
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 1) || isempty(gamma)
        gamma = 1.4;
    end
    
    % -------------
    % Calculations.
    % -------------
    
    % preallocates M
    M = zeros(size(w));
    
    % calculates M(i) for each w(i) using root finding procedure
    for i = 1:length(w)
        f = @(M) prandtl_meyer(M,gamma)-w(i);
        M(i) = secant_method(f,1.5);
    end
    
end