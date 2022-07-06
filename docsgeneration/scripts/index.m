%% Compressible Flow Toolbox Documentation
% 
% <<compressible_flow_toolbox.png>>
% 
% Copyright © 2022 Tamas Kis
%% Technical Documentation
% Click <https://tamaskis.github.io/files/Compressible_Flow_Relations.pdf here>.
%% Stagnation (Total) Quantities
% * <stagnation_doc.html *|stagnation|*> finds the stagnation-to-static
% ratios given the local Mach number.
% * <stagnation_inverse_doc.html *|stagnation_inverse|*> determines the 
% local Mach number given some stagnation-to-static ratio.
%% Isentropic Processes
% * <isentropic_process_doc.html *|isentropic_process|*> converts any ratio
% to any other ratio in an isentropic process involving a calorically
% perfect gas.
%% Normal Shocks
% * <normal_shock_doc.html *|normal_shock|*> finds the Mach number
% downstream of a normal shock, or some ratio across a normal shock.
% * <normal_shock_inverse_doc.html *|normal_shock_inverse|*> returns the
% upstream Mach number given either the downstream Mach number or some
% ratio across the normal shock.
%% Oblique Shocks and Expansions
% * <prandtl_meyer_doc.html *|prandtl_meyer|*> finds the angle required to 
% accelerate the flow from Mach 1 to the specified local Mach number 
% (implementation of the Prandtl-Meyer function).
% * <prandtl_meyer_inverse_doc.html *|prandtl_meyer_inverse|*> finds the
% local Mach number given the Prandtl-Meyer angle.
%% Area-Mach Number Relation
% * <area_mach_number_doc.html *|area_mach_number|*> finds the area ratio
% from the Mach number in quasi 1D flow (using the area-Mach number 
% relation).
% * <area_mach_number_inverse_doc.html *|area_mach_number_inverse|*> finds 
% the local Mach number (subsonic and supersonic solutions) from the area 
% ratio in quasi 1D flow (i.e. solving the area-Mach number relation for 
% the local Mach number).
%% Fanno Flow (Adiabatic, Quasi-1D Flow with Friction)
%% Rayleigh Flow (Frictionless, Quasi-1D Flow with Heat Addition)
% * <rayleigh_heat_doc.html *|rayleigh_heat|*> determines the (specific) 
% heat addition between two stations in a Rayleigh flow.
% * <rayleigh_heat_inverse_doc.html *|rayleigh_heat_inverse|*> determines 
% the stagnation temperature at one station in a Rayleigh flow given the 
% stagnation temperature at the other station and the (specific) heat 
% addition between the two stations.
% * <rayleigh_sonic_doc.html *|rayleigh_sonic|*> finds some ratio between
% local and sonic conditions in a Rayleigh flow.
% * <rayleigh_sonic_inverse_doc.html *|rayleigh_sonic_inverse|*> finds the
% local Mach number given some ratio or difference between local and sonic 
% conditions in a Rayleigh flow.
%% Root-Finding Methods
% * <https://www.mathworks.com/matlabcentral/fileexchange/85745-secant-method-secant_method *|secant_method|*>
% * <https://www.mathworks.com/matlabcentral/fileexchange/87042-bisection-method-bisection_method?s_tid=srchtitle *|bisection_method|*>