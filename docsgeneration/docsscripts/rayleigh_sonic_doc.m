%% |rayleigh_sonic|
% Rayleigh line relations between local and sonic conditions.
% 
% <index.html Back to Compressible Flow Toolbox Contents>
%% Syntax
%   T_Tstar = rayleigh_sonic(M,'T/T*')
%   P_Pstar = rayleigh_sonic(M,'P/P*')
%   rho_rhostar = rayleigh_sonic(M,'rho/rho*')
%   U_Ustar = rayleigh_sonic(M,'U/U*')
%   a_astar = rayleigh_sonic(M,'a/a*')
%   h_hstar = rayleigh_sonic(M,'h/h*')
%   Tt_Ttstar = rayleigh_sonic(M,'Tt/Tt*')
%   Pt_Ptstar = rayleigh_sonic(M,'Pt/Pt*')
%   rhot_rhotstar = rayleigh_sonic(M,'rhot/rhot*')
%   at_atstar = rayleigh_sonic(M,'at/at*')
%   ht_htstar = rayleigh_sonic(M,'ht/ht*')
%   ds_cp = rayleigh_sonic(M,'(s-s*)/cp')
%   __ = rayleigh_sonic(__,gamma)
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
% _All local-to-sonic ratios in a Rayleigh flow with a local Mach number of 
% $M=3$ in air ($\gamma=1.4$)._
%%
% Set $M$.
M = 3;
%%
% Local-to-sonic static temperature ratio ($T/T^{*}$).
T_Tstar = rayleigh_sonic(M,'T/T*')
%%
% Local-to-sonic static pressure ratio ($P/P^{*}$).
P_Pstar = rayleigh_sonic(M,'P/P*')
%%
% Local-to-sonic static density ratio ($\rho/\rho^{*}$).
rho_rhostar = rayleigh_sonic(M,'rho/rho*')
%%
% Local-to-sonic velocity ratio ($U/U^{*}$).
U_Ustar = rayleigh_sonic(M,'U/U*')
%%
% Local-to-sonic speed of sound ratio ($a/a^{*}$).
a_astar = rayleigh_sonic(M,'a/a*')
%%
% Local-to-sonic static enthalpy ratio ($h/h^{*}$).
h_hstar = rayleigh_sonic(M,'h/h*')
%%
% Local-to-sonic stagnation temperature ratio ($T_{t}/T_{t}^{*}$).
Tt_Ttstar = rayleigh_sonic(M,'Tt/Tt*')
%%
% Local-to-sonic stagnation pressure ratio ($P_{t}/P_{t}^{*}$).
Pt_Ptstar = rayleigh_sonic(M,'Pt/Pt*')
%%
% Local-to-sonic stagnation density ratio ($\rho_{t}/\rho_{t}^{*}$).
rhot_rhotstar = rayleigh_sonic(M,'rhot/rhot*')
%%
% Local-to-sonic stagnation speed of sound ratio ($a_{t}/a_{t}^{*}$).
at_atstar = rayleigh_sonic(M,'at/at*')
%%
% Local-to-sonic stagnation enthalpy ratio ($h_{t}/h_{t}^{*}$).
ht_htstar = rayleigh_sonic(M,'ht/ht*')
%%
% sonic-to-local nondimensional entropy change ($(s-s^{*})/c_{p}$).
ds_cp = rayleigh_sonic(M,'(s-s*)/cp')
%% See also
% <normal_shock_inverse_doc.html |normal_shock_inverse|>.