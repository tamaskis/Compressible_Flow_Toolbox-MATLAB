%% |isentropic_process|
% Converts any ratio to any other ratio in an isentropic process involving 
% a calorically perfect gas.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   Q_out = isentropic_process(spec_in,Q_in,spec_out)
%   Q_out = isentropic_process(spec_in,Q_in,spec_out,gamma)
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
%           <td rowspan="4" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center">-</td>
%           <td><TT>spec_in</TT></td>
%           <td>specifies input quantity (see options below)</td>
%           <td style="text-align:center">1×1<BR>char</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;Q_{\mathrm{in}}" title="" /></td>
%           <td><TT>Q_in</TT></td>
%           <td>input quantity (specified by <TT>spec_in</TT>)</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center">-</td>
%           <td><TT>spec_out</TT></td>
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
%           <td>output quantity (specified by <TT>spec_out</TT>)</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%   </table>
% </html>
%
% Options for |spec_in| and |spec_out|:
%
% * |'T2/T1'| = static temperature ratio ($T_{2}/T_{1}$)
% * |'P2/P1'| = static pressure ratio ($P_{2}/P_{1}$)
% * |'h2/h1'| = static enthalpy ratio ($h_{2}/h_{1}$)
% * |'rho2/rho1'| = static density ratio ($\rho_{2}/\rho_{1}$)
% * |'a2/a1'| = speed of sound ratio ($a_{2}/a_{1}$)
% * |'Tt2/Tt1'| = stagnation temperature ratio ($T_{t2}/T_{t1}$)
% * |'Pt2/Pt1'| = stagnation pressure ratio ($P_{t2}/P_{t1}$)
% * |'ht2/ht1'| = stagnation enthalpy ratio ($h_{t2}/h_{t1}$)
% * |'rhot2/rhot1'| = stagnation density ratio ($\rho_{t2}/\rho_{t1}$)
% * |'at2/at1'| = stagnation speed of sound ratio ($a_{t2}/a_{t1}$)
%% Example #1: Static pressure ratio from static temperature ratio (in air).
% Static pressure ratio from a static temperature ratio of $T_{2}/T_{1}=2$.
T2_T1 = 2;
P2_P1 = isentropic_process('T2/T1',T2_T1,'P2/P1')
%% Example #2: Static temperature ratio from static pressure ratio (in air).
% Static temperature ratio from a static pressure ratio of $P_{2}/P_{1}=11.3137$
% (from Example #1, we know we should get $T_{2}/T_{1}=2$).
P2_P1 = 11.3137;
T2_T1 = isentropic_process('P2/P1',P2_P1,'T2/T1')
%% Example #3: Static density ratio from stagnation pressure ratio (in helium).
% Static density ratio from a stagnation pressure ratio of $P_{t2}/P_{t1}=2$
% in helium ($\gamma=1.66$).
Pt2_Pt1 = 2;
gamma = 1.66;
rho2_rho1 = isentropic_process('Pt2/Pt1',Pt2_Pt1,'rho2/rho1')