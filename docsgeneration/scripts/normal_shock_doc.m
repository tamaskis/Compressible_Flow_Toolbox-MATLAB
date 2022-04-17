%% |normal_shock|
% Normal shock relations.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   M2 = normal_shock(M1,'M2')
%   T2_T1 = normal_shock(M1,'T2/T1')
%   P2_P1 = normal_shock(M1,'P2/P1')
%   rho2_rho1 = normal_shock(M1,'rho2/rho1')
%   U2_U1 = normal_shock(M1,'U2/U1')
%   a2_a1 = normal_shock(M1,'a2/a1')
%   h2_h1 = normal_shock(M1,'h2/h1')
%   Tt2_Tt1 = normal_shock(M1,'Tt2/Tt1')
%   Pt2_Pt1 = normal_shock(M1,'Pt2/Pt1')
%   rhot2_rhot1 = normal_shock(M1,'rhot2/rhot1')
%   at2_at1 = normal_shock(M1,'at2/at1')
%   ht2_ht1 = normal_shock(M1,'ht2/ht1')
%   ds_cp = normal_shock(M1,'(s2-s1)/cp')
%   __ = normal_shock(__,gamma)
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?M_{1}" title="M_{1}" /></td>
%           <td><TT>M1</TT></td>
%           <td>upstream Mach number</td>
%           <td style="text-align:center">1D<BR>double array</td>
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
%           <td style="text-align:center">1D<BR>double array</td>
%       </tr>
%   </table>
% </html>
%
% Options for |spec|:
%
% * |'M2'| = downstream Mach number ($M_{2}$)
% * |'T2/T1'| = static temperature ratio ($T_{2}/T_{1}$)
% * |'P2/P1'| = static pressure ratio ($P_{2}/P_{1}$)
% * |'rho2/rho1'| = static density ratio ($\rho_{2}/\rho_{1}$)
% * |'U2/U1'| = velocity ratio ($U_{2}/U_{1}$)
% * |'a2/a1'| = speed of sound ratio ($a_{2}/a_{1}$)
% * |'h2/h1'| = static enthalpy ratio ($h_{2}/h_{1}$)
% * |'Tt2/Tt1'| = stagnation temperature ratio ($T_{t2}/T_{t1}$)
% * |'Pt2/Pt1'| = stagnation pressure ratio ($P_{t2}/P_{t1}$)
% * |'rhot2/rhot1'| = stagnation density ratio ($\rho_{t2}/\rho_{t1}$)
% * |'at2/at1'| = stagnation speed of sound ratio ($a_{t2}/a_{t1}$)
% * |'ht2/ht1'| = stagnation enthalpy ratio ($h_{t2}/h_{t1}$)
% * |'(s2-s1)/cp'| = nondimensional entropy change ($(s_{2}-s_{1})/c_{p}$)
%% Examples
% _All ratios across a normal shock with an upstream Mach number of $M_{1}=
% 3$ in air ($\gamma=1.4$)._
%%
% Set $M_{1}$.
M1 = 3;
%%
% Downstream Mach number ($M_{2}$).
M2 = normal_shock(M1,'M2')
%%
% Static temperature ratio ($T_{2}/T_{1}$).
T2_T1 = normal_shock(M1,'T2/T1')
%%
% Static pressure ratio ($P_{2}/P_{1}$).
P2_P1 = normal_shock(M1,'P2/P1')
%%
% Static density ratio ($\rho_{2}/\rho_{1}$).
rho2_rho_1 = normal_shock(M1,'rho2/rho1')
%%
% Velocity ratio ($U_{2}/U_{1}$).
U2_U1 = normal_shock(M1,'U2/U1')
%%
% Speed of sound ratio ($a_{2}/a_{1}$).
a2_a1 = normal_shock(M1,'a2/a1')
%%
% Static enthalpy ratio ($h_{2}/h_{1}$).
h2_h1 = normal_shock(M1,'h2/h1')
%%
% Stagnation temperature ratio ($T_{t2}/T_{t1}$).
Tt2_Tt1 = normal_shock(M1,'Tt2/Tt1')
%%
% Stagnation pressure ratio ($P_{t2}/P_{t1}$).
Pt2_Pt1 = normal_shock(M1,'Pt2/Pt1')
%%
% Stagnation density ratio ($\rho_{t2}/\rho_{t1}$).
rhot2_rhot1 = normal_shock(M1,'rhot2/rhot1')
%%
% Stagnation speed of sound ratio ($a_{t2}/a_{t1}$).
at2_at1 = normal_shock(M1,'at2/at1')
%%
% Stagnation enthalpy ratio ($h_{t2}/h_{t1}$).
ht2_ht1 = normal_shock(M1,'ht2/ht1')
%%
% Nondimensional entropy change ($(s_{2}-s_{1})/c_{p}$).
ds_cp = normal_shock(M1,'(s2-s1)/cp')
%% See also
% <normal_shock_inverse_doc.html |normal_shock_inverse|>.