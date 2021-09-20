%% |rayleigh_heat_inverse|
% Determines the stagnation temperature at one station in a Rayleigh flow 
% given the stagnation temperature at the other station and the (specific) 
% heat addition between the two stations.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   Tt1 = rayleigh_heat_inverse('Tt2',Tt2,q)
%   Tt1 = rayleigh_heat_inverse('Tt2',Tt2,q,gamma,R)
%   Tt2 = rayleigh_heat_inverse('Tt1',Tt1,q)
%   Tt2 = rayleigh_heat_inverse('Tt1',Tt1,q,gamma,R)
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
%           <td rowspan="5" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center">-</td>
%           <td><TT>spec</TT></td>
%           <td>specifies input stagnation temperature (<TT>'Tt1'</TT> or <TT>'Tt2'</TT>)</td>
%           <td style="text-align:center">char</td>
%           <td style="text-align:center">-</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?T_{t,\mathrm{in}}" title="" /></td>
%           <td><TT>Tt_in</TT></td>
%           <td>input stagnation temperature</td>
%           <td style="text-align:center">1D<BR>double array</td>
%           <td style="text-align:center">K</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?q" title="q" /></td>
%           <td><TT>q</TT></td>
%           <td>(specific) heat addition between stations 1 and 2</td>
%           <td style="text-align:center">1D<BR>double array</td>
%           <td style="text-align:center">J/kg</td>
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?T_{t,\mathrm{out}}" title="" /></td>
%           <td><TT>Tt_out</TT></td>
%           <td>output stagnation temperature</td>
%           <td style="text-align:center">1D<BR>double array</td>
%           <td style="text-align:center">K</td>
%       </tr>
%   </table>
% </html>
%% Example #1: Station 1 stagnation temperature for specific heat addition in air.
% _$T_{t1}$ with $T_{t2}=2000\;\mathrm{K}$ and $q=1.0045\times10^{6}\;\mathrm{J/kg}$
% (in air)._
Tt2 = 2000;
q = 1.0045e6;
Tt1 = rayleigh_heat_inverse('Tt2',Tt2,q)
%% Example #2: Station 2 stagnation temperature for specific heat addition in air.
% _$T_{t2}$ with $T_{t1}=1000\;\mathrm{K}$ and $q=1.0045\times10^{6}\;\mathrm{J/kg}$
% (in air)._
Tt1 = 1000;
q = 1.0045e6;
Tt2 = rayleigh_heat_inverse('Tt1',Tt1,q)
%% Example #3: Station 1 stagnation temperature for specific heat addition in helium.
% _$T_{t1}$ with $T_{t2}=2000\;\mathrm{K}$ and $q=5.2240\times10^{6}\;\mathrm{J/kg}$
% (in helium, with $\gamma=1.66$, $R=2077\;\mathrm{J/(kg\cdot K)}$)._
Tt2 = 2000;
q = 5.2240e6;
Tt1 = rayleigh_heat_inverse('Tt2',Tt2,q,1.66,2077)
%% Example #4: Station 2 stagnation temperature for specific heat addition in helium.
% _$T_{t2}$ with $T_{t1}=1000\;\mathrm{K}$ and $q=5.2240\times10^{6}\;\mathrm{J/kg}$
% (in helium, with $\gamma=1.66$ and $R=2077\;\mathrm{J/(kg\cdot K)}$)._
Tt1 = 1000;
q = 5.2240e6;
Tt2 = rayleigh_heat_inverse('Tt1',Tt1,q,1.66,2077)
%% See also
% <rayleigh_heat_doc.html |rayleigh_heat|>.