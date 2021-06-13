%% Copyright (c) 2021 Tamas Kis

% Examples for using the normal shock relations from the Compressible Flow
% Relations toolbox.

% REMOVE ";" FROM END OF LINES TO SEE OUTPUT



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% LOCAL-TO-SONIC RATIOS FOR M = 3 AND gamma = 1.4

% sets M and gamma
M = 3;
gamma = 1.4;

% local-to-sonic ratios
rayleigh_sonic(M,gamma,'T/T*');
rayleigh_sonic(M,gamma,'P/P*');
rayleigh_sonic(M,gamma,'h/h*');
rayleigh_sonic(M,gamma,'rho/rho*');
rayleigh_sonic(M,gamma,'U/U*');
rayleigh_sonic(M,gamma,'Tt/Tt*');
rayleigh_sonic(M,gamma,'Pt/Pt*');
rayleigh_sonic(M,gamma,'ht/ht*');

% nondimensional entropy change from sonic to local
rayleigh_sonic(M,gamma,'(s-s*)/cp');



%% RATIOS BETWEEN STATIONS 1 AND 2 FOR M1 = 3, M2 = 1, AND gamma = 1.4

% sets M1, M2, and gamma
M1 = 3;
M2 = 2;
gamma = 1.4;

% ratios between stations 1 and 2
T2_T1 = rayleigh_station(M1,M2,gamma,'T2/T1');
P2_P1 = rayleigh_station(M1,M2,gamma,'P2/P1');
h2_h1 = rayleigh_station(M1,M2,gamma,'h2/h1');
rho2_rho1 = rayleigh_station(M1,M2,gamma,'rho2/rho1');
U2_U1 = rayleigh_station(M1,M2,gamma,'U2/U1');
Tt2_Tt1 = rayleigh_station(M1,M2,gamma,'Tt2/Tt1');
Pt2_Pt1 = rayleigh_station(M1,M2,gamma,'Pt2/Pt1');
ht2_ht1 = rayleigh_station(M1,M2,gamma,'ht2/ht1');
ds_cp = rayleigh_station(M1,M2,gamma,'(s2-s1)/cp');

% M1 from M2 and some ratio/change
% rayleigh_station_inverse(M2,T2_T1,gamma,'M2','T2/T1')
% rayleigh_station_inverse(M2,P2_P1,gamma,'M2','P2/P1')
% rayleigh_station_inverse(M2,h2_h1,gamma,'M2','h2/h1')
% rayleigh_station_inverse(M2,rho2_rho1,gamma,'M2','rho2/rho1')
% rayleigh_station_inverse(M2,U2_U1,gamma,'M2','U2/U1')
% rayleigh_station_inverse(M2,Tt2_Tt1,gamma,'M2','Tt2/Tt1')
% rayleigh_station_inverse(M2,Pt2_Pt1,gamma,'M2','Pt2/Pt1')
% rayleigh_station_inverse(M2,ht2_ht1,gamma,'M2','ht2/ht1')

% M2 from M1 and some ratio/change
% rayleigh_station_inverse(M1,T2_T1,gamma,'M1','T2/T1')
% rayleigh_station_inverse(M1,P2_P1,gamma,'M1','P2/P1')
% rayleigh_station_inverse(M1,h2_h1,gamma,'M1','h2/h1')
% rayleigh_station_inverse(M1,rho2_rho1,gamma,'M1','rho2/rho1')
% rayleigh_station_inverse(M1,U2_U1,gamma,'M1','U2/U1')
% rayleigh_station_inverse(M1,Tt2_Tt1,gamma,'M1','Tt2/Tt1')
% rayleigh_station_inverse(M1,Pt2_Pt1,gamma,'M1','Pt2/Pt1')
% rayleigh_station_inverse(M1,ht2_ht1,gamma,'M1','ht2/ht1')



%% RATIOS BETWEEN STATIONS 1 AND 2 FOR M1 = 0.1, M2 = 0.9, AND gamma = 1.4

% sets M1, M2, and gamma
M1 = 0.01;
M2 = 0.95;
gamma = 1.4;

% ratios between stations 1 and 2
T2_T1 = rayleigh_station(M1,M2,gamma,'T2/T1');
P2_P1 = rayleigh_station(M1,M2,gamma,'P2/P1');
h2_h1 = rayleigh_station(M1,M2,gamma,'h2/h1');
rho2_rho1 = rayleigh_station(M1,M2,gamma,'rho2/rho1');
U2_U1 = rayleigh_station(M1,M2,gamma,'U2/U1');
Tt2_Tt1 = rayleigh_station(M1,M2,gamma,'Tt2/Tt1');
Pt2_Pt1 = rayleigh_station(M1,M2,gamma,'Pt2/Pt1');
ht2_ht1 = rayleigh_station(M1,M2,gamma,'ht2/ht1');
ds_cp = rayleigh_station(M1,M2,gamma,'(s2-s1)/cp');

% M1 from M2 and some ratio/change
rayleigh_station_inverse(M2,T2_T1,gamma,'M2','T2/T1');
rayleigh_station_inverse(M2,P2_P1,gamma,'M2','P2/P1');
rayleigh_station_inverse(M2,h2_h1,gamma,'M2','h2/h1');
rayleigh_station_inverse(M2,rho2_rho1,gamma,'M2','rho2/rho1');
rayleigh_station_inverse(M2,U2_U1,gamma,'M2','U2/U1');
rayleigh_station_inverse(M2,Tt2_Tt1,gamma,'M2','Tt2/Tt1');
rayleigh_station_inverse(M2,Pt2_Pt1,gamma,'M2','Pt2/Pt1');
rayleigh_station_inverse(M2,ht2_ht1,gamma,'M2','ht2/ht1');

% M2 from M1 and some ratio/change
rayleigh_station_inverse(M1,T2_T1,gamma,'M1','T2/T1');
rayleigh_station_inverse(M1,P2_P1,gamma,'M1','P2/P1');
rayleigh_station_inverse(M1,h2_h1,gamma,'M1','h2/h1');
rayleigh_station_inverse(M1,rho2_rho1,gamma,'M1','rho2/rho1');
rayleigh_station_inverse(M1,U2_U1,gamma,'M1','U2/U1');
rayleigh_station_inverse(M1,Tt2_Tt1,gamma,'M1','Tt2/Tt1');
rayleigh_station_inverse(M1,Pt2_Pt1,gamma,'M1','Pt2/Pt1');
rayleigh_station_inverse(M1,ht2_ht1,gamma,'M1','ht2/ht1');