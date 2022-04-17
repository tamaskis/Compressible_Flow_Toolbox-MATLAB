%% min_M1_attached_test.m
% Unit testing of the min_M1_attached function.
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

% test #1 (θ = 34° --> (M1)min ≈ 3)
theta = 34;
M1_min_expected = 3;
M1_min_actual = min_M1_attached(theta*(pi/180));
TEST_EQUAL(M1_min_actual,M1_min_expected,err);

% test #2 (θ = 42.5° --> (M1)min ≈ 6)
theta = 42.5;
M1_min_expected = 6;
M1_min_actual = min_M1_attached(theta*(pi/180));
TEST_EQUAL(M1_min_actual,M1_min_expected,err);