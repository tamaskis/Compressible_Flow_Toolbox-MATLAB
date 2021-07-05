%==========================================================================
%
% rayleigh_heat_inverse  Determines the stagnation temperature at one
% station in a Rayleigh flow given the stagnation temperature at the other
% station and the (specific) heat addition between the two stations.
%
%   Tt1 = rayleigh_heat_inverse(Tt2,q,gamma,R,'Tt2')
%   Tt2 = rayleigh_heat_inverse(Tt1,q,gamma,R,'Tt1')
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
%   Tt_in   - (N×1 or 1×N) [K] stagnation temperature at one station
%  	q       - (1×1 or N×1 or 1×N) [J/kg] (specific) heat addition between 
%             the two stations
%   gamma   - (1×1) specific heat ratio
%   R       - (1×1) [J/(kg.K)] specific gas constant
% 	spec    - (char) specifies input stagnation temperature
%               --> 'Tt1' = station 1 stagnation temperature
%               --> 'Tt2' = station 2 stagnation temperature
%
% --------
% OUTPUTS:
% --------
%   Tt_out  - (N×1 or 1×N) [K] stagnation temperature at other station
%           	--> Tt1 (station 1 stagnation temperature) if spec = 'Tt2'
%           	--> Tt2 (station 2 stagnation temperature) if spec = 'Tt1'
%
% -----
% NOTE:
% -----
%   --> N = length of "Tt_in"
%   --> "q" can either be input as a scalar or as a vector with length
%       equal to that of "Tt_in".
%
%==========================================================================
function Tt_out = rayleigh_heat_inverse(Tt_in,q,gamma,R,spec)
    
    % determines Tt2 if Tt1 input
    if strcmp(spec,'Tt1')
        Tt_out = Tt_in+((gamma-1)*q)/(gamma*R);
        
    % determines Tt1 if Tt2 input
    else
        Tt_out = Tt_in-((gamma-1)*q)/(gamma*R);
        
    end

end