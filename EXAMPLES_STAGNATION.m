%% Copyright (c) 2021 Tamas Kis

% Examples for using the stagnation relations (i.e. stagnation and
% stagnation_inverse) from the Compressible Flow Relations toolbox.

% REMOVE ";" FROM END OF LINES TO SEE OUTPUT



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% STAGNATION-TO-STATIC RATIOS FOR M = 3 AND gamma = 1.4

% sets M and gamma
M = 3;
gamma = 1.4;

% stagnation-to-static ratios
Tt_t = stagnation(M,gamma,'Tt/T');
Pt_t = stagnation(M,gamma,'Pt/P');
rhot_t = stagnation(M,gamma,'rhot/rho');
at_t = stagnation(M,gamma,'at/a');
ht_t = stagnation(M,gamma,'ht/h');



%% LOCAL MACH NUMBER FROM STAGNATION-TO-STATIC RATIOS

% local Mach number
stagnation_inverse(Tt_t,gamma,'Tt/T');
stagnation_inverse(Pt_t,gamma,'Pt/P');
stagnation_inverse(rhot_t,gamma,'rhot/rho');
stagnation_inverse(at_t,gamma,'at/a');
stagnation_inverse(ht_t,gamma,'ht/h');