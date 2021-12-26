%% isentropic_process_test.m
% Unit testing of the isentropic_process function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-27
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to "Compressible Flow Toolbox" functions
addpath(genpath("../toolbox"));



%% TESTS FOR GIVEN STATIC TEMPERATURE RATIO

% static temperature ratio
T2_T1 = 2;

% other static ratios
P2_P1 = isentropic_process('T2/T1',T2_T1,'P2/P1');
rho2_rho1 = isentropic_process('T2/T1',T2_T1,'rho2/rho1');
a2_a1 = isentropic_process('T2/T1',T2_T1,'a2/a1');
h2_h1 = isentropic_process('T2/T1',T2_T1,'h2/h1');

% test recovery of static temperature ratio
TEST_EQUAL(isentropic_process('P2/P1',P2_P1,'T2/T1'),T2_T1);
TEST_EQUAL(isentropic_process('rho2/rho1',rho2_rho1,'T2/T1'),T2_T1);
TEST_EQUAL(isentropic_process('a2/a1',a2_a1,'T2/T1'),T2_T1);
TEST_EQUAL(isentropic_process('h2/h1',h2_h1,'T2/T1'),T2_T1);



%% TESTS FOR GIVEN STATIC PRESSURE RATIO

% static pressure ratio
P2_P1 = 2;

% other static ratios
T2_T1 = isentropic_process('P2/P1',P2_P1,'T2/T1');
rho2_rho1 = isentropic_process('P2/P1',P2_P1,'rho2/rho1');
a2_a1 = isentropic_process('P2/P1',P2_P1,'a2/a1');
h2_h1 = isentropic_process('P2/P1',P2_P1,'h2/h1');

% test recovery of static pressure ratio
TEST_EQUAL(isentropic_process('T2/T1',T2_T1,'P2/P1'),P2_P1);
TEST_EQUAL(isentropic_process('rho2/rho1',rho2_rho1,'P2/P1'),P2_P1);
TEST_EQUAL(isentropic_process('a2/a1',a2_a1,'P2/P1'),P2_P1);
TEST_EQUAL(isentropic_process('h2/h1',h2_h1,'P2/P1'),P2_P1);



%% TESTS FOR GIVEN STATIC DENSITY RATIO

% static density ratio
rho2_rho1 = 2;

% other static ratios
T2_T1 = isentropic_process('rho2/rho1',rho2_rho1,'T2/T1');
P2_P1 = isentropic_process('rho2/rho1',rho2_rho1,'P2/P1');
a2_a1 = isentropic_process('rho2/rho1',rho2_rho1,'a2/a1');
h2_h1 = isentropic_process('rho2/rho1',rho2_rho1,'h2/h1');

% test recovery of static pressure ratio
TEST_EQUAL(isentropic_process('T2/T1',T2_T1,'rho2/rho1'),rho2_rho1);
TEST_EQUAL(isentropic_process('P2/P1',P2_P1,'rho2/rho1'),rho2_rho1);
TEST_EQUAL(isentropic_process('a2/a1',a2_a1,'rho2/rho1'),rho2_rho1);
TEST_EQUAL(isentropic_process('h2/h1',h2_h1,'rho2/rho1'),rho2_rho1);



%% TESTS FOR GIVEN SPEED OF SOUND RATIO

% speed of sound ratio
a2_a1 = 2;

% other static ratios
T2_T1 = isentropic_process('a2/a1',a2_a1,'T2/T1');
P2_P1 = isentropic_process('a2/a1',a2_a1,'P2/P1');
rho2_rho1 = isentropic_process('a2/a1',a2_a1,'rho2/rho1');
h2_h1 = isentropic_process('a2/a1',a2_a1,'h2/h1');

% test recovery of static pressure ratio
TEST_EQUAL(isentropic_process('T2/T1',T2_T1,'a2/a1'),a2_a1);
TEST_EQUAL(isentropic_process('P2/P1',P2_P1,'a2/a1'),a2_a1);
TEST_EQUAL(isentropic_process('rho2/rho1',rho2_rho1,'a2/a1'),a2_a1);
TEST_EQUAL(isentropic_process('h2/h1',h2_h1,'a2/a1'),a2_a1);



%% TESTS FOR GIVEN STATIC ENTHALPY RATIO

% static enthalpy ratio
h2_h1 = 2;

% other static ratios
T2_T1 = isentropic_process('h2/h1',h2_h1,'T2/T1');
P2_P1 = isentropic_process('h2/h1',h2_h1,'P2/P1');
rho2_rho1 = isentropic_process('h2/h1',h2_h1,'rho2/rho1');
a2_a1 = isentropic_process('h2/h1',h2_h1,'a2/a1');

% test recovery of static pressure ratio
TEST_EQUAL(isentropic_process('T2/T1',T2_T1,'h2/h1'),h2_h1);
TEST_EQUAL(isentropic_process('P2/P1',P2_P1,'h2/h1'),h2_h1);
TEST_EQUAL(isentropic_process('rho2/rho1',rho2_rho1,'h2/h1'),h2_h1);
TEST_EQUAL(isentropic_process('a2/a1',a2_a1,'h2/h1'),h2_h1);



%% TESTS FOR GIVEN STAGNATION TEMPERATURE RATIO

% stagnation temperature ratio
Tt2_Tt1 = 2;

% other stagnation ratios
Pt2_Pt1 = isentropic_process('Tt2/Tt1',Tt2_Tt1,'Pt2/Pt1');
rhot2_rhot1 = isentropic_process('Tt2/Tt1',Tt2_Tt1,'rhot2/rhot1');
at2_at1 = isentropic_process('Tt2/Tt1',Tt2_Tt1,'at2/at1');
ht2_ht1 = isentropic_process('Tt2/Tt1',Tt2_Tt1,'ht2/ht1');

% test recovery of stagnation temperature ratio
TEST_EQUAL(isentropic_process('Pt2/Pt1',Pt2_Pt1,'Tt2/Tt1'),Tt2_Tt1);
TEST_EQUAL(isentropic_process('rhot2/rhot1',rhot2_rhot1,'Tt2/Tt1'),...
    Tt2_Tt1);
TEST_EQUAL(isentropic_process('at2/at1',at2_at1,'Tt2/Tt1'),Tt2_Tt1);
TEST_EQUAL(isentropic_process('ht2/ht1',ht2_ht1,'Tt2/Tt1'),Tt2_Tt1);



%% TESTS FOR GIVEN STAGNATION PRESSURE RATIO

% stagnation pressure ratio
Pt2_Pt1 = 2;

% other stagnation ratios
Tt2_Tt1 = isentropic_process('Pt2/Pt1',Pt2_Pt1,'Tt2/Tt1');
rhot2_rhot1 = isentropic_process('Pt2/Pt1',Pt2_Pt1,'rhot2/rhot1');
at2_at1 = isentropic_process('Pt2/Pt1',Pt2_Pt1,'at2/at1');
ht2_ht1 = isentropic_process('Pt2/Pt1',Pt2_Pt1,'ht2/ht1');

% test recovery of stagnation pressure ratio
TEST_EQUAL(isentropic_process('Tt2/Tt1',Tt2_Tt1,'Pt2/Pt1'),Pt2_Pt1);
TEST_EQUAL(isentropic_process('rhot2/rhot1',rhot2_rhot1,'Pt2/Pt1'),...
    Pt2_Pt1);
TEST_EQUAL(isentropic_process('at2/at1',at2_at1,'Pt2/Pt1'),Pt2_Pt1);
TEST_EQUAL(isentropic_process('ht2/ht1',ht2_ht1,'Pt2/Pt1'),Pt2_Pt1);



%% TESTS FOR GIVEN STAGNATION DENSITY RATIO

% stagnation density ratio
rhot2_rhot1 = 2;

% other stagnation ratios
Tt2_Tt1 = isentropic_process('rhot2/rhot1',rhot2_rhot1,'Tt2/Tt1');
Pt2_Pt1 = isentropic_process('rhot2/rhot1',rhot2_rhot1,'Pt2/Pt1');
at2_at1 = isentropic_process('rhot2/rhot1',rhot2_rhot1,'at2/at1');
ht2_ht1 = isentropic_process('rhot2/rhot1',rhot2_rhot1,'ht2/ht1');

% test recovery of stagnation pressure ratio
TEST_EQUAL(isentropic_process('Tt2/Tt1',Tt2_Tt1,'rhot2/rhot1'),...
    rhot2_rhot1);
TEST_EQUAL(isentropic_process('Pt2/Pt1',Pt2_Pt1,'rhot2/rhot1'),...
    rhot2_rhot1);
TEST_EQUAL(isentropic_process('at2/at1',at2_at1,'rhot2/rhot1'),...
    rhot2_rhot1);
TEST_EQUAL(isentropic_process('ht2/ht1',ht2_ht1,'rhot2/rhot1'),...
    rhot2_rhot1);



%% TESTS FOR GIVEN STAGNATION SPEED OF SOUND RATIO

% stagnation speed of sound ratio
at2_at1 = 2;

% other stagnation ratios
Tt2_Tt1 = isentropic_process('at2/at1',at2_at1,'Tt2/Tt1');
Pt2_Pt1 = isentropic_process('at2/at1',at2_at1,'Pt2/Pt1');
rhot2_rhot1 = isentropic_process('at2/at1',at2_at1,'rhot2/rhot1');
ht2_ht1 = isentropic_process('at2/at1',at2_at1,'ht2/ht1');

% test recovery of stagnation pressure ratio
TEST_EQUAL(isentropic_process('Tt2/Tt1',Tt2_Tt1,'at2/at1'),at2_at1);
TEST_EQUAL(isentropic_process('Pt2/Pt1',Pt2_Pt1,'at2/at1'),at2_at1);
TEST_EQUAL(isentropic_process('rhot2/rhot1',rhot2_rhot1,'at2/at1'),...
    at2_at1);
TEST_EQUAL(isentropic_process('ht2/ht1',ht2_ht1,'at2/at1'),at2_at1);



%% TESTS FOR GIVEN STAGNATION ENTHALPY RATIO

% stagnation enthalpy ratio
ht2_ht1 = 2;

% other stagnation ratios
Tt2_Tt1 = isentropic_process('ht2/ht1',ht2_ht1,'Tt2/Tt1');
Pt2_Pt1 = isentropic_process('ht2/ht1',ht2_ht1,'Pt2/Pt1');
rhot2_rhot1 = isentropic_process('ht2/ht1',ht2_ht1,'rhot2/rhot1');
at2_at1 = isentropic_process('ht2/ht1',ht2_ht1,'at2/at1');

% test recovery of stagnation pressure ratio
TEST_EQUAL(isentropic_process('Tt2/Tt1',Tt2_Tt1,'ht2/ht1'),ht2_ht1);
TEST_EQUAL(isentropic_process('Pt2/Pt1',Pt2_Pt1,'ht2/ht1'),ht2_ht1);
TEST_EQUAL(isentropic_process('rhot2/rhot1',rhot2_rhot1,'ht2/ht1'),...
    ht2_ht1);
TEST_EQUAL(isentropic_process('at2/at1',at2_at1,'ht2/ht1'),ht2_ht1);