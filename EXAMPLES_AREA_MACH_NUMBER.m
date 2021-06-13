%% Copyright (c) 2021 Tamas Kis

% Examples for using the area_mach_number function from the Compressible
% Flow Relations toolbox.



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% EXAMPLE #1 - SONIC-TO-LOCAL AREA RATIO FROM MACH NUMBER

% A*/A for M = 3
M = 3;
Astar_A = area_mach_number(M,1.4);



%% EXAMPLE #2 - LOCAL-TO-SONIC AREA RATIO FROM MACH NUMBER

% A/A* for M = 3
M = 3;
A_Astar = area_mach_number(M,1.4,'classic');



%% EXAMPLE #3 - MACH NUMBER FROM SONIC-TO-LOCAL AREA RATIO

% M for A*/A = 0.2362
Astar_A = 0.2362;
[M_subsonic,M_supersonic] = area_mach_number_inverse(Astar_A,1.4);



%% EXAMPLE #4 - MACH NUMBER FROM SONIC LOCAL-TO-SONIC AREA RATIO

% M for A/A* = 4.2346
Astar_A = 4.2346;
[M_subsonic,M_supersonic] = area_mach_number_inverse(Astar_A,1.4,...
    'classic');