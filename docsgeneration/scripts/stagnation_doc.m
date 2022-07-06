%% |stagnation|
% Stagnation-to-static ratios given the local Mach number.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   Tt_T = stagnation(M,'Tt/T')
%   Pt_P = stagnation(M,'Pt/P')
%   rhot_rho = stagnation(M,'rhot/rho')
%   at_a = stagnation(M,'at/a')
%   ht_h = stagnation(M,'ht/h')
%   __ = stagnation(__,gamma)
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
%           <td>local Mach number</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center">-</td>
%           <td><TT>spec</TT></td>
%           <td>specifies output quantity (see options below)</td>
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?Q_{\mathrm{out}}" title="Q_{\mathrm{out}}" /></td>
%           <td><TT>Q_out</TT></td>
%           <td>output quantity (specified by <TT>spec</TT>)</td>
%           <td style="text-align:center">1×1<BR>double</td>
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
% _All stagnation-to-static ratios for a Mach 3 flow (in air)._
%%
% Set $M$.
M = 3;
%%
% Stagnation-to-static temperature ratio ($T_{t}/T$).
Tt_T = stagnation(M,'Tt/T')
%%
% Stagnation-to-static pressure ratio ($P_{t}/P$).
Pt_P = stagnation(M,'Pt/P')
%%
% Stagnation-to-static density ratio ($\rho_{t}/\rho$).
rhot_rho = stagnation(M,'rhot/rho')
%%
% Stagnation-to-static speed of sound ratio ($a_{t}/a$).
at_a = stagnation(M,'at/a')
%%
% Stagnation-to-static enthalpy ratio ($h_{t}/h$).
ht_h = stagnation(M,'ht/h')
%% See also
% <stagnation_inverse_doc.html |stagnation_inverse|>.