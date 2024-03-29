%% |normal_shock_inverse|
% Determines the Mach number upstream of a normal shock given some input 
% quantity.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   M1 = normal_shock_inverse(M2,'M2')
%   M1 = normal_shock_inverse(T2_T1,'T2/T1')
%   M1 = normal_shock_inverse(P2_P1,'P2/P1')
%   M1 = normal_shock_inverse(rho2_rho1,'rho2/rho1')
%   M1 = normal_shock_inverse(U2_U1,'U2/U1')
%   M1 = normal_shock_inverse(a2_a1,'a2/a1')
%   M1 = normal_shock_inverse(h2_h1,'h2/h1')
%   M1 = normal_shock_inverse(Tt2_Tt1,'Tt2/Tt1')
%   M1 = normal_shock_inverse(Pt2_Pt1,'Pt2/Pt1')
%   M1 = normal_shock_inverse(rhot2_rhot1,'rhot2/rhot1')
%   M1 = normal_shock_inverse(at2_at1,'at2/at1')
%   M1 = normal_shock_inverse(ht2_ht1,'ht2/ht1')
%   M1 = normal_shock_inverse(ds_cp,'(s2-s1)/cp')
%   M1 = normal_shock_inverse(__,gamma)
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?Q_{\mathrm{in}}" title="Q_{\mathrm{in}}" /></td>
%           <td><TT>Q_in</TT></td>
%           <td>input quantity (specified by <TT>spec</TT>)</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\gamma" title="\gamma" /></td>
%           <td><TT>gamma</TT></td>
%           <td>(OPTIONAL) specific heat ratio, defaults to 1.4</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?M_{1}" title="M_{1}" /></td>
%           <td><TT>M1</TT></td>
%           <td>upstream Mach number</td>
%           <td style="text-align:center">1×1<BR>double</td>
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
% _Upstream Mach number ($M_{1}$) from all quantities/ratios across a
% normal shock in air ($\gamma=1.4$). Note that all values are taken from
% the examples in the <normal_shock_doc.html |normal_shock|> 
% documentation._
%%
% Upstream Mach number ($M_{1}$) from downstream Mach number ($M_{2}$).
M2 = normal_shock_inverse('M2',0.4752)
%%
% Upstream Mach number ($M_{1}$) from static temperature ratio ($T_{2}/T_{1}$).
T2_T1 = normal_shock_inverse('T2/T1',2.6790)
%%
% Upstream Mach number ($M_{1}$) from static pressure ratio ($P_{2}/P_{1}$).
P2_P1 = normal_shock_inverse('P2/P1',10.3333)
%%
% Upstream Mach number ($M_{1}$) from static density ratio ($\rho_{2}/\rho_{1}$).
rho2_rho1 = normal_shock_inverse('rho2/rho1',3.8571)
%%
% Upstream Mach number ($M_{1}$) from velocity ratio ($U_{2}/U_{1}$).
U2_U1 = normal_shock_inverse('U2/U1',0.2593)
%%
% Upstream Mach number ($M_{1}$) from speed of sound ratio ($a_{2}/a_{1}$).
a2_a1 = normal_shock_inverse('a2/a1',1.6368)
%%
% Upstream Mach number ($M_{1}$) from static enthalpy ratio ($h_{2}/h_{1}$).
h2_h1 = normal_shock_inverse('h2/h1',0.3733)
%%
% Upstream Mach number ($M_{1}$) from stagnation temperature ratio ($T_{t2}/T_{t1}$).
Tt2_Tt1 = normal_shock_inverse('Tt2/Tt1',1)
%%
% Upstream Mach number ($M_{1}$) from stagnation pressure ratio ($P_{t2}/P_{t1}$).
Pt2_Pt1 = normal_shock_inverse('Pt2/Pt1',0.3283)
%%
% Upstream Mach number ($M_{1}$) from stagnation density ratio ($\rho_{t2}/\rho_{t1}$).
rhot2_rhot1 = normal_shock_inverse('rhot2/rhot1',0.3283)
%%
% Upstream Mach number ($M_{1}$) from stagnation speed of sound ratio ($a_{t2}/a_{t1}$).
at2_at1 = normal_shock_inverse('at2/at1',1)
%%
% Upstream Mach number ($M_{1}$) from stagnation enthalpy ratio ($h_{t2}/h_{t1}$).
ht2_ht1 = normal_shock_inverse('ht2/ht1',1)
%%
% Upstream Mach number ($M_{1}$) from nondimensional entropy change ($(s_{2}-s_{1})/c_{p}$).
ds_cp = normal_shock_inverse('(s2-s1)/cp',1)
%% See also
% <normal_shock_doc.html |normal_shock|>.