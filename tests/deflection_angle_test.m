%% deflection_angle_test.m
% Unit testing of the deflection_angle function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-25
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] Anderson, "Modern Compressible Flow", 3rd Ed., (inside cover)



%% NOTE

% The deflection_angle function is tested against the θ-β-M diagram in [1].
% However, since it is only possible to read values off of the diagram to
% an accuracy of ±1°, this is the error tolerance we use. Also note that
% the (180/pi) and (pi/180) factors used are to convert to the appropriate
% units for the angles.



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to "Compressible Flow Toolbox" functions
addpath(genpath("../toolbox"));

% error tolerance [deg]
err = 1;



%% TESTS

% test #1 (M1 = 3, β ≈ 52° --> θ = 30°)
M1 = 3;
beta = 52;
theta_expected = 30;
theta_actual = deflection_angle(M1,beta*(pi/180))*(180/pi);
TEST_EQUAL(theta_actual,theta_expected,err)

% test #2 (M1 = 3, β ≈ 75° --> θ = 30°)
M1 = 3;
beta = 75;
theta_expected = 30;
theta_actual = deflection_angle(M1,beta*(pi/180))*(180/pi);
TEST_EQUAL(theta_actual,theta_expected,err)