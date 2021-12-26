%% |rayleigh_sonic_inverse|
% Calculates the subsonic and supersonic solutions for the local Mach 
% number in a Rayleigh flow given some ratio or difference between local 
% and sonic conditions.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   [M_sub,M_sup] = rayleigh_sonic_inverse('T/T*',T_Tstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('P/P*',P_Pstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('rho/rho*',rho_rhostar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('U/U*',U_Ustar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('a/a*',a_astar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('h/h*',h_hstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('Tt/Tt*',Tt_Ttstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('Pt/Pt*',Pt_Ptstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('rhot/rhot*',rhot_rhotstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('at/at*',at_atstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('ht/ht*',ht_htstar)
%   [M_sub,M_sup] = rayleigh_sonic_inverse('(s-s*)/cp',ds_cp)
%   [M_sub,M_sup] = rayleigh_sonic_inverse(__,gamma)
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
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?Q_{\mathrm{in}}" title="" /></td>
%           <td><TT>Q_in</TT></td>
%           <td>input quantity</td>
%           <td style="text-align:center">1D<BR>double array</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\gamma" title="\gamma" /></td>
%           <td><TT>gamma</TT></td>
%           <td>(OPTIONAL) specific heat ratio, defaults to 1.4</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td rowspan="2" style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?M_{\mathrm{sub}}" title="" /></td>
%           <td><TT>M_sub</TT></td>
%           <td>subsonic solution for local Mach number</td>
%           <td style="text-align:center">1D<BR>double array</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?M_{\mathrm{sup}}" title="" /></td>
%           <td><TT>M_sup</TT></td>
%           <td>supersonic solution for local Mach number</td>
%           <td style="text-align:center">1D<BR>double array</td>
%       </tr>
%   </table>
% </html>
%
% Options for |spec|:
%
% * |'T/T*'| = local-to-sonic static temperature ratio ($T/T^{*}$)
% * |'P/P*'| = local-to-sonic static pressure ratio ($P/P^{*}$)
% * |'rho/rho*'| = local-to-sonic density ratio ($\rho/\rho^{*}$)
% * |'U/U*'| = local-to-sonic velocity ratio ($U/U^{*}$)
% * |'a/a*'| = local-to-sonic speed of sound ratio ($a/a^{*}$)
% * |'h/h*'| = local-to-sonic static enthalpy ratio ($h/h^{*}$)
% * |'Tt/Tt*'| = local-to-sonic stagnation temperature ratio ($T_{t}/T_{t}^{*}$)
% * |'Pt/Pt*'| = local-to-sonic stagnation pressure ratio ($P_{t}/P_{t}^{*}$)
% * |'rhot/rhot*'| = local-to-sonic stagnation density ratio ($\rho_{t}/\rho_{t}^{*}$)
% * |'at/at*'| = local-to-sonic stagnation speed of sound ratio ($a_{t}/a_{t}^{*}$)
% * |'ht/ht*'| = local-to-sonic stagnation enthalpy ratio ($h_{t}/h_{t}^{*}$)
% * |'(s-s*)/cp'| = sonic-to-local nondimensional entropy change ($(s-s^{*})/c_{p}$)
%% Examples
% _Local Mach number from local-to-sonic ratios in a Rayleigh flow in air 
% ($\gamma=1.4$). Note that all values are taken from the examples in the
% <rayleigh_sonic_doc.html |rayleigh_sonic|> documentation._ 
%%
% Local Mach number ($M$) from local-to-sonic static temperature ratio ($T/T^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('T/T*',0.2803)
%%
% Local Mach number ($M$) from local-to-sonic static pressure ratio ($P/P^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('P/P*',0.1765)
%%
% Local Mach number ($M$) from local-to-sonic static density ratio ($\rho/\rho^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('rho/rho*',0.6296)
%%
% Local Mach number ($M$) from local-to-sonic velocity ratio ($U/U^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('U/U*',1.5882)
%%
% Local Mach number ($M$) from local-to-sonic speed of sound ratio ($a/a^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('a/a*',0.5294)
%%
% Local Mach number ($M$) from local-to-sonic static enthalpy ratio ($h/h^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('h/h*',0.2803)
%%
% Local Mach number ($M$) from local-to-sonic stagnation temperature ratio ($T_{t}/T_{t}^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('Tt/Tt*',0.6540)
%%
% Local Mach number ($M$) from local-to-sonic stagnation pressure ratio ($P_{t}/P_{t}^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('Pt/Pt*',3.4245)
%%
% Local Mach number ($M$) from local-to-sonic stagnation density ratio ($\rho_{t}/\rho_{t}^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('rhot/rhot*',5.2363)
%%
% Local Mach number ($M$) from local-to-sonic stagnation speed of sound ratio ($a_{t}/a_{t}^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('at/at*',0.8087)
%%
% Local Mach number ($M$) from local-to-sonic stagnation enthalpy ratio ($h_{t}/h_{t}^{*}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('ht/ht*',0.6540)
%%
% Local Mach number ($M$) from sonic-to-local nondimensional entropy change ($(s-s^{*})/c_{p}$).
[M_sub,M_sup] = rayleigh_sonic_inverse('(s-s*)/cp',-0.7764)
%% See also
% <rayleigh_sonic_doc.html |rayleigh_sonic|>.