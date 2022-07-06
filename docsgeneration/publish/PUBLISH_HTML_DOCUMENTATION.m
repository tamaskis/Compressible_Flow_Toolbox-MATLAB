%% PUBLISH_HTML_DOCUMENTATION.m
%
% Wrapper script to publish HTML documentation.
%
% Author: Tamas Kis
% Last Update: 2022-07-06



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;



%% INPUTS

% toolbox abbreviation
abbrev = 'NDT';

% specific .m documentation files that should be published
%   --> define as "[]" if you want to publish all .m documentation files
%mfiles = ["index"];
%mfiles = ["rayleigh_sonic_inverse_doc.m"];
%mfiles = ["max_deflection_angle_doc.m"];
mfiles = [];

% specific image files that should be published
%   --> define as "[]" if you want to publish all image files
imagefiles = [];

% true if contents of "docs" folder should be deleted, false otherwise
delete_docs = true;



%% PRODUCES HTML DOCUMENTATION

publish_html(abbrev,mfiles,imagefiles,delete_docs);