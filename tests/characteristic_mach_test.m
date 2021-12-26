%% characteristic_mach_test.m
% Unit testing of the characteristic_mach and characteristic_mach_inverses 
% functions.
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



%% TESTS

% local Mach number
M = 3;

% characteristic Mach number
M_star = characteristic_mach(M);

% test recovery of local Mach number
TEST_EQUAL(characteristic_mach_inverse(M_star),M);