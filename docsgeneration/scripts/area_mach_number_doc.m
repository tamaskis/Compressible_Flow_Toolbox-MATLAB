%% |area_mach_number|
% Area ratio from Mach number (using Mach-area relation).
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   Astar_A = area_mach_number(M)
%   Astar_A = area_mach_number(M,'reciprocal')
%   A_Astar = area_mach_number(M,'classic')
%   __ = area_mach_number(__,gamma)
%% Input/Output Parameters
% <html>
%   <table border=1>
%       <tr>
%           <td></td>
%           <td style="text-align:center"><b>Symbol</b></td>
%           <td style="text-align:center"><b>Variable</b></td>
%           <td style="text-align:center"><b>Description</b></td>
%           <td style="text-align:center"><b>Format</b></td>
%       </tr>
%       <tr>
%           <td rowspan="3" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?M" title="M" /></td>
%           <td><TT>M</TT></td>
%           <td>Mach number</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center">-</td>
%           <td><TT>type</TT></td>
%           <td>(OPTIONAL) <TT>'reciprocal'</TT> or <TT>'classic'</TT> (defaults to <TT>'reciprocal'</TT>)<ul><li><TT>'reciprocal'</TT> corresponds to <img src="https://latex.codecogs.com/svg.latex?\inline&space;A^{*}/A" title="" /><li><TT>'classic'</TT> corresponds to <img src="https://latex.codecogs.com/svg.latex?\inline&space;A/A^{*}" title="" /></ul></td>
%           <td style="text-align:center">1×1<BR>char</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\gamma" title="\gamma" /></td>
%           <td><TT>gamma</TT></td>
%           <td>(OPTIONAL) specific heat ratio, defaults to 1.4</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;A^{*}/A" title="" /><BR>or<BR><img src="https://latex.codecogs.com/svg.latex?\inline&space;A/A^{*}" title="" /></td>
%           <td><TT>Astar_A</TT><BR>or<BR><TT>A_Astar</TT></td>
%           <td>evaluation of area-Mach number relation</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example #1: Sonic-to-local area ratio from Mach number (in air).
% $A^{*}/A$ for $M=3$ (in air).
Astar_A = area_mach_number(3)
%% Example #2: Local-to-sonic area ratio from Mach number (in air).
% $A/A^{*}$ for $M=3$ (in air).
A_Astar = area_mach_number(3,'classic')
%% Example #3: Sonic-to-local area ratio from Mach number (in helium).
% $A^{*}/A$ for $M=3$ (in helium, $\gamma=1.66$).
Astar_A = area_mach_number(3,[],1.66)
%% See also
% <area_mach_number_inverse_doc.html |area_mach_number_inverse|>.