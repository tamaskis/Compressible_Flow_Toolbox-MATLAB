%% max_deflection_angle_test.m
% Unit testing of the max_deflection_angle function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-25
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed., (inside cover)



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to "Compressible Flow Toolbox" functions
addpath(genpath("../toolbox"));

% error tolerance
err = 0.1;



%% TESTS

% test #1 (M1 = 3 --> θmax ≈ 34°)
M1 = 3;
theta_max_expected = 34;
theta_max_actual = max_deflection_angle(M1)*(180/pi);
TEST_EQUAL(theta_max_actual,theta_max_expected,err)

% test #2 (M1 = 6 --> θmax ≈ 42.5°)
M1 = 6;
theta_max_expected = 42.5;
theta_max_actual = max_deflection_angle(M1)*(180/pi);
TEST_EQUAL(theta_max_actual,theta_max_expected,err)