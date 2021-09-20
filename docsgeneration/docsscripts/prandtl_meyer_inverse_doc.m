%% |prandtl_meyer_inverse|
% Inverse Prandtl-Meyer function.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   M = prandtl_meyer_inverse(w)
%   M = prandtl_meyer_inverse(w,gamma)
%% Input/Output Parameters
% <html>
%   <table border=1>
%       <tr>
%           <td></td>
%           <td style="text-align:center"><b>Symbol</b></td>
%           <td style="text-align:center"><b>Variable</b></td>
%           <td style="text-align:center"><b>Description</b></td>
%           <td style="text-align:center"><b>Format</b></td>
%           <td style="text-align:center"><b>Units</b></td>
%       </tr>
%       <tr>
%           <td rowspan="2" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\omega" title="" /></td>
%           <td><TT>w</TT></td>
%           <td>angle required to accelerate flow from Mach 1 to the local Mach number</td>
%           <td style="text-align:center">1D<BR>double array</td>
%           <td style="text-align:center">rad</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\gamma" title="\gamma" /></td>
%           <td><TT>gamma</TT></td>
%           <td>(OPTIONAL) specific heat ratio, defaults to 1.4</td>
%           <td style="text-align:center">1×1<BR>double</td>
%           <td style="text-align:center">-</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?M" title="M" /></td>
%           <td><TT>M</TT></td>
%           <td>local Mach number</td>
%           <td style="text-align:center">1D<BR>double array</td>
%           <td style="text-align:center">-</td>
%       </tr>
%   </table>
% </html>
%% Example #1: Local Mach number given the Prandtl-Meyer angle (in air).
% $M$ for $\omega=0.4604$ (in air).
M = prandtl_meyer_inverse(0.4604)
%% Example #2: Local Mach number given the Prandtl-Meyer angle (in helium).
% $M$ for $\omega=0.3819$ (in helium, $\gamma=1.66$).
M = prandtl_meyer_inverse(0.3819,1.66)
%% See also
% <prandtl_meyer_doc.html |prandtl_meyer|>.