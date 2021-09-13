%% |stagnation_inverse|
% Determines the local Mach number given some stagnation-to-static ratio.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   M = stagnation_inverse('Tt/T',Tt_T)
%   M = stagnation_inverse('Pt/P',Pt_p)
%   M = stagnation_inverse('rhot/rho',rhot_rho)
%   M = stagnation_inverse('at/a',at_a)
%   M = stagnation_inverse('ht/h',ht_h)
%   M = stagnation_inverse(__,gamma)
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
%           <td style="text-align:center">-</td>
%           <td><TT>spec</TT></td>
%           <td>specifies input quantity (see options below)</td>
%           <td style="text-align:center">1×1<BR>char</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?Q_{\mathrm{out}}" title="Q_{\mathrm{out}}" /></td>
%           <td><TT>Q_in</TT></td>
%           <td>input quantity (specified by <TT>spec</TT>)</td>
%           <td style="text-align:center">1D<BR>double array</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\gamma" title="\gamma" /></td>
%           <td><TT>gamma</TT></td>
%           <td>(OPTIONAL) specific heat ratio, defaults to 1.4</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?M" title="M" /></td>
%           <td><TT>M</TT></td>
%           <td>local Mach number</td>
%           <td style="text-align:center">1D<BR>double array</td>
%       </tr>
%   </table>
% </html>
%
% Options for |spec|:
%
% * |'Tt/T'| = stagnation-to-static temperature ratio ($T_{t}/T$)
% * |'Pt/P'| = stagnation-to-static pressure ratio ($P_{t}/P$)
% * |'rhot/rho'| = stagnation-to-static density ratio ($\rho_{t}/\rho$)
% * |'at/a'| = stagnation-to-static speed of sound ratio ($a_{t}/a$)
% * |'ht/h'| = stagnation-to-static enthalpy ratio ($h_{t}/h$)
%% Examples
% _Mach number from all stagnation-to-static ratios (in air)._
%%
% Local Mach number ($M$) for $T_{t}/T=$.
M = stagnation_inverse('Tt/T',2.8000)
%%
% Local Mach number ($M$) for $P_{t}/P=$.
M = stagnation_inverse('Pt/P',36.7327)
%%
% Local Mach number ($M$) for $\rho_{t}/\rho=$.
M = stagnation_inverse('rhot/rho',13.1188)
%%
% Local Mach number ($M$) for $a_{t}/a=$.
M = stagnation_inverse('at/a',1.6733)
%%
% Local Mach number ($M$) for $h_{t}/h=$.
M = stagnation_inverse('ht/h',2.8000)
%% See also
% <stagnation_doc.html |stagnation|>.