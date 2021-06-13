%% Copyright (c) 2021 Tamas Kis

% Examples for using the normal shock relations from the "Compressible Flow
% Relations" toolbox.



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% RATIOS AND NONDIMENSIONAL ENTROPY CHANGE FOR M1 = 3 AND gamma = 1.4

% sets M1 and gamma
M1 = 3;
gamma = 1.4;

% ratios across normal shock
normal_shock(M1,gamma,'T2/T1');
normal_shock(M1,gamma,'P2/P1');
normal_shock(M1,gamma,'rho2/rho1');
normal_shock(M1,gamma,'U2/U1');
normal_shock(M1,gamma,'a2/a1');
normal_shock(M1,gamma,'h2/h1');
normal_shock(M1,gamma,'Tt2/Tt1');
normal_shock(M1,gamma,'Pt2/Pt1');
normal_shock(M1,gamma,'rhot2/rhot1');
normal_shock(M1,gamma,'at2/at1');
normal_shock(M1,gamma,'ht2/ht1');

% nondimensional entropy change from station 1 to station 2
normal_shock(M1,gamma,'(s2-s1)/cp');



%% UPSTREAM MACH NUMBER FROM RATIOS AND NONDIMENSIONAL ENTROPY CHANGE

% upstream Mach number from ratios across normal shock
%  --> these use the values obtained above to show inverse is valid
%  --> exceptions are Tt2/Tt1, at2/at1, and ht2/ht1, since those ratios are
%      equal to 1 for any normal shock
normal_shock_inverse(2.6790,gamma,'T2/T1');
normal_shock_inverse(10.3333,gamma,'P2/P1');
normal_shock_inverse(3.8571,gamma,'rho2/rho1');
normal_shock_inverse(0.2593,gamma,'U2/U1');
normal_shock_inverse(1.6368,gamma,'a2/a1');
normal_shock_inverse(0.3733,gamma,'h2/h1');
normal_shock_inverse(3,gamma,'Tt2/Tt1');
normal_shock_inverse(0.3283,gamma,'Pt2/Pt1');
normal_shock_inverse(0.3283,gamma,'rhot2/rhot1');
normal_shock_inverse(3,gamma,'at2/at1');
normal_shock_inverse(3,gamma,'ht2/ht1');

% upstream Mach number from nondimensional entropy change
normal_shock_inverse(0.3182,gamma,'(s2-s1)/cp');