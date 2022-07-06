%% |area_mach_number_inverse|
% Mach number from area ratio (solving area-Mach number relation for M).
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   [M_sub,M_sup] = area_mach_number_inverse(Astar_A)
%   [M_sub,M_sup] = area_mach_number_inverse(Astar_A,'reciprocal')
%   [M_sub,M_sup] = area_mach_number_inverse(A_Astar,'classic')
%   [M_sub,M_sup] = area_mach_number_inverse(__,gamma)
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;A^{*}/A" title="" /><BR>or<BR><img src="https://latex.codecogs.com/svg.latex?\inline&space;A/A^{*}" title="" /></td>
%           <td><TT>Astar_A</TT><BR>or<BR><TT>A_Astar</TT></td>
%           <td>area ratio (specified by <TT>type</TT>)</td>
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
%           <td rowspan="2" style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;M_{\mathrm{sub}}" title="" /></td>
%           <td><TT>M_sub</TT></td>
%           <td>subsonic solution of area-Mach number relation for local Mach number</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;M_{\mathrm{sup}}" title="" /></td>
%           <td><TT>M_sup</TT></td>
%           <td>supersonic solution of area-Mach number relation for local Mach number</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example #1: Mach number from sonic-to-local area ratio (in air).
% $M_{\mathrm{sub}}$ and $M_{\mathrm{sup}}$ for $A^{*}/A=0.2362$.
[M_sub,M_sup] = area_mach_number_inverse(0.2362)
%% Example #2: Mach number from local-to-sonic area ratio (in air).
% $M_{\mathrm{sub}}$ and $M_{\mathrm{sup}}$ for $A/A^{*}=4.2346$.
[M_subsonic,M_supersonic] = area_mach_number_inverse(4.2346,'classic')
%% Example #3: Mach number from sonic-to-local area ratio (in helium).
% $M_{\mathrm{sub}}$ and $M_{\mathrm{sup}}$ for $A^{*}/A=0.3312$ (in helium, $\gamma=1.66$).
[M_sub,M_sup] = area_mach_number_inverse(0.3312,[],1.66)
%% See also
% <area_mach_number_doc.html |area_mach_number|>.