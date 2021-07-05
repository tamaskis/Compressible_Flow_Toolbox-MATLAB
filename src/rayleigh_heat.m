%==========================================================================
%
% rayleigh_heat  Determines the (specific) heat addition between two 
% stations in a Rayleigh flow.
%
%   q = rayleigh_heat(Tt1,Tt2,gamma,R)
%
% See also flowrayleigh
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-06-13
%
%--------------------------------------------------------------------------
%
% MATLAB Central File Exchange: 
% GitHub: https://github.com/tamaskis/compressible_flow_toolbox-MATLAB
%
% See EXAMPLES.mlx for examples and "DOCUMENTATION.pdf" for additional 
% documentation. Both of these files are included with the download.
%
%--------------------------------------------------------------------------
%
% -------
% INPUTS:
% -------
%   Tt1     - (N×1 or 1×N) [K] station 1 stagnation temperature
%   Tt2     - (N×1 or 1×N) [K] station 2 stagnation temperature
%   gamma   - (1×1) specific heat ratio
%   R       - (1×1) [J/(kg.K)] specific gas constant
%
% --------
% OUTPUTS:
% --------
%   q       - (N×1 or 1×N) [J/kg] (specific) heat addition
%
% -----
% NOTE:
% -----
%   --> N = length of "Tt1" and "Tt2"
%
%==========================================================================
function q = rayleigh_heat(Tt1,Tt2,gamma,R)
    q = (gamma*R*(Tt2-Tt1))/(gamma-1);
end