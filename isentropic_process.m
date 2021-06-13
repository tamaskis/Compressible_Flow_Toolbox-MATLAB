% isentropic_process  Isentropic relations.
%
%   Q_out = isentropic_process(Q_in,spec_in,spec_out,gamma) converts any 
%   ratio to any other ratio in an isentropic process involving a 
%   calorically perfect gas. "Q_in" is the input described by the
%   identifier "spec_in", and "gamma" is the specific heat ratio. "Q_in"
%   can be input as an array; in that case, the function will return an
%   an array of the same size."Q_out" is the output that is determined by 
%   the identifier "spec_out". "spec_in" and "spec_out" can both have the 
%   following values:
%    --> 'T2/T1' = static temperature ratio
%    --> 'P2/P1' = static pressure ratio
%    --> 'h2/h1' = static enthalpy ratio
%    --> 'rho2/rho1' = static density ratio
%    --> 'a2/a1' = speed of sound ratio
%    --> 'Tt2/Tt1' = stagnation temperature ratio
%    --> 'Pt2/Pt1' = stagnation pressure ratio
%    --> 'ht2/ht1' = stagnation enthalpy ratio
%    --> 'rhot2/rhot1' = stagnation density ratio
%    --> 'at2/at1' = stagnation speed of sound ratio
%
% See also flowisentropic
%
% GitHub: https://github.com/tamaskis/compressible_flow_relations-MATLAB
%
% See "Compressible Flow Relations - MATLAB implementation" for additional
% documentation. Examples can be found in EXAMPLES_ISENTROPIC_PROCESS.m. 
% Both of these files are included with the download of the "Compressible 
% Flow Relations" toolbox.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: Q_in - input quantity
%        spec_in - what is input to the function
%        spec_out - what the function should return
%        gamma - specific heat ratio
% OUTPUT: Q_out - output quantity specified by "spec_out"
function Q_out = isentropic_process(Q_in,spec_in,spec_out,gamma)
    
    % converts any input to a temperature ratio
    if strcmp(spec_in,'T2/T1') || strcmp(spec_in,'Tt2/Tt1')
        T2_T1 = Q_in;
    elseif strcmp(spec_in,'P2/P1') || strcmp(spec_in,'Pt2/Pt1')
        T2_T1 = Q_in.^((gamma-1)/gamma);
    elseif strcmp(spec_in,'h2/h1') || strcmp(spec_in,'ht2/ht1')
        T2_T1 = Q_in;
    elseif strcmp(spec_in,'rho2/rho1') || strcmp(spec_in,'rhot2/rhot1')
        T2_T1 = Q_in.^(gamma-1);
    elseif strcmp(spec_in,'a2/a1') || strcmp(spec_in,'at2/at1')
        T2_T1 = Q_in.^2;
    end
    
    % converts temperature ratio to desired output
    if strcmp(spec_out,'T2/T1') || strcmp(spec_out,'Tt2/Tt1')
        Q_out = T2_T1;
    elseif strcmp(spec_out,'P2/P1') || strcmp(spec_out,'Pt2/Pt1')
        Q_out = T2_T1.^(gamma/(gamma-1));
    elseif strcmp(spec_out,'h2/h1') || strcmp(spec_out,'ht2/ht1')
        Q_out = T2_T1;
    elseif strcmp(spec_out,'rho2/rho1') || strcmp(spec_out,'rhot2/rhot1')
        Q_out = T2_T1.^(1/(gamma-1));
    elseif strcmp(spec_in,'a2/a1') || strcmp(spec_out,'at2/at1')
        Q_out = sqrt(T2_T1);
    end
    
end