%% inverse_normal_shock_relations_derivations.m
% Derivation of the inverse normal shock relations.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-27
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;



%% SIMPLIFICATIONS

% upstream Mach number from downstream Mach number
syms gamma M1 M2;
M2_from_M1 = (M2 == sqrt((2+(gamma-1)*M1^2)/(2*gamma*M1^2-(gamma-1))));
M1 = solve(M2_from_M1,M1)

% upstream Mach number from static density ratio
syms gamma M1 rho2_rho1;
rho2_rho1_from_M1 = (rho2_rho1 == ((gamma+1)*M1^2)/(2+(gamma-1)*M1^2));
M1 = simplify(expand(solve(rho2_rho1_from_M1,M1)))
M1 = 2^(1/2)*(rho2_rho1/(gamma + rho2_rho1 - gamma*rho2_rho1 + 1))^(1/2);
M1_hand = sqrt(2*rho2_rho1/((gamma+1)-(gamma-1)*rho2_rho1))
simplify(M1-M1_hand)