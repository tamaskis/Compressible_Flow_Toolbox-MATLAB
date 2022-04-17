%% stagnation_test.m
% Unit testing of the stagnation and stagnation_inverse functions.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-27
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed., Table A.1 (p. 693)



%% NOTE

% The stagnation function is tested against tabulated values in [1], as
% well as against expected behavior. The following ratios are tabulated in
% [1]:
%   --> Tt/T
%   --> Pt/P
%   --> ρt/ρ
% Therefore, we cannot test at/a and ht/h against tabulated values.
% However, we do know that at/a = √(Tt/T) and ht/h = Tt/T.



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to "Compressible Flow Toolbox" functions
addpath(genpath("../toolbox"));

% error tolerance
err = 1e-4;



%% TESTS FOR stagnation

% Mach number
M = 3;

% calculations
Tt_T = stagnation(M,'Tt/T');
Pt_P = stagnation(M,'Pt/P');
rhot_rho = stagnation(M,'rhot/rho');
at_a = stagnation(M,'at/a');
ht_h = stagnation(M,'ht/h');

% tests against tabulated values
TEST_EQUAL(Tt_T,        0.2800e01,  err);
TEST_EQUAL(Pt_P,        0.3673e02,  err);
TEST_EQUAL(rhot_rho,    0.1312e02,  err);

% tests against expected behavior
TEST_EQUAL(at_a,sqrt(Tt_T));
TEST_EQUAL(ht_h,Tt_T);



%% TESTS FOR stagnation_inverse

% tests recovery of local Mach number
TEST_EQUAL(stagnation_inverse('Tt/T',Tt_T),         M);
TEST_EQUAL(stagnation_inverse('Pt/P',Pt_P),         M);
TEST_EQUAL(stagnation_inverse('rhot/rho',rhot_rho), M);
TEST_EQUAL(stagnation_inverse('at/a',at_a),         M);
TEST_EQUAL(stagnation_inverse('ht/h',ht_h),         M);