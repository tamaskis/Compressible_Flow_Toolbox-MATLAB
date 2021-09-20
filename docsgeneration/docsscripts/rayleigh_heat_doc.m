%% |rayleigh_heat|
% Determines the (specific) heat addition between two stations in a
% Rayleigh flow.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   q = rayleigh_heat(Tt1,Tt2)
%   q = rayleigh_heat(Tt1,Tt2,gamma,R)
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
%           <td rowspan="4" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?T_{t1}" title="T_{t1}" /></td>
%           <td><TT>Tt1</TT></td>
%           <td>station 1 stagnation temperature</td>
%           <td style="text-align:center">1D<BR>double array</td>
%           <td style="text-align:center">K</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?T_{t2}" title="T_{t2}" /></td>
%           <td><TT>Tt2</TT></td>
%           <td>station 2 stagnation temperature</td>
%           <td style="text-align:center">1D<BR>double array</td>
%           <td style="text-align:center">K</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\gamma" title="\gamma" /></td>
%           <td><TT>gamma</TT></td>
%           <td>(OPTIONAL) specific heat ratio, defaults to 1.4</td>
%           <td style="text-align:center">1×1<BR>double</td>
%           <td style="text-align:center">-</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?R" title="R" /></td>
%           <td><TT>R</TT></td>
%           <td>(OPTIONAL) specific gas constant, defaults to 287 J/(kg.K)</td>
%           <td style="text-align:center">1×1<BR>double</td>
%           <td style="text-align:center">J/(kg.K)</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?q" title="q" /></td>
%           <td><TT>q</TT></td>
%           <td>(specific) heat addition between stations 1 and 2</td>
%           <td style="text-align:center">1D<BR>double array</td>
%           <td style="text-align:center">J/kg</td>
%       </tr>
%   </table>
% </html>
%% Example #1: Specific heat addition in air.
% _Specific heat addition with $T_{t1}=1000\;\mathrm{K}$ and $T_{t2}=2000\;\mathrm{K}$
% in air._
Tt1 = 1000;
Tt2 = 2000;
q = rayleigh_heat(Tt1,Tt2)
%% Example #2: Specific heat addition in helium.
% _Specific heat addition with $T_{t1}=1000\;\mathrm{K}$ and $T_{t2}=2000\;\mathrm{K}$
% in helium ($\gamma=1.66$, $R=2077\;\mathrm{J/(kg\cdot K)}$)._
Tt1 = 1000;
Tt2 = 2000;
q = rayleigh_heat(Tt1,Tt2,1.66,2077)
%% See also
% <rayleigh_heat_inverse_doc.html |rayleigh_heat_inverse|>.