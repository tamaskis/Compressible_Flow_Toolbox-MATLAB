%==========================================================================
%
% isentropic_process  Converts any ratio to any other ratio in an 
% isentropic process involving a calorically perfect gas.
%
%   Q_out = isentropic_process(spec_in,Q_in,spec_out)
%   Q_out = isentropic_process(spec_in,Q_in,spec_out,gamma)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-24
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/files/Compressible_Flow_Relations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   spec_in     - (char) specifies input quantity (see options below)
%   Q_in        - (1×1 double) input quantity, Qᵢₙ (specified by "spec_in")
%   spec_out    - (char) specifies output quantity (see options below)
%   gamma       - (OPTIONAL) (1×1 double) specific heat ratio, γ (defaults 
%                 to 1.4)
%
% -------
% OUTPUT:
% -------
%   Q_out       - (1×1 double) output quantity, Qₒᵤₜ (specified by 
%                 "spec_out")
%
% -----------------------------------
% OPTIONS FOR "spec_in" / "spec_out":
% -----------------------------------
%  	--> 'T2/T1'         - static temperature ratio, T₂/T₁
%  	--> 'P2/P1'         - static pressure ratio, P₂/P₁
%  	--> 'rho2/rho1'     - static density ratio, ρ₂/ρ₁
%  	--> 'a2/a1'         - speed of sound ratio, a₂/a₁
% 	--> 'h2/h1'         - static enthalpy ratio, h₂/h₁
%  	--> 'Tt2/Tt1'       - stagnation temperature ratio, Tₜ₂/Tₜ₁
%  	--> 'Pt2/Pt1'       - stagnation pressure ratio, Pₜ₂/Pₜ₁
%  	--> 'rhot2/rhot1'   - stagnation density ratio, ρₜ₂/ρₜ₁
%  	--> 'at2/at1'       - stagnation speed of sound ratio, aₜ₂/aₜ₁
%  	--> 'ht2/ht1'       - stagnation enthalpy ratio, hₜ₂/hₜ₁
%
% -----
% NOTE:
% -----
%   --> You cannot use this function to obtain a stagnation ratio from a 
%       static ratio and vice versa. For example, if you input T₂/T₁, you 
%       CAN obtain any of the static ratios (i.e. P₂/P₁, ρ₂/ρ₁, a₂/a₁, or 
%       h₂/h₁), but you CANNOT obtain any of the stagnation ratios (i.e. 
%       Tₜ₂/Tₜ₁, Pₜ₂/Pₜ₁, ρₜ₂/ρₜ₁, aₜ₂/aₜ₁, or hₜ₂/hₜ₁).
%
%==========================================================================
function Q_out = isentropic_process(spec_in,Q_in,spec_out,gamma)
    
    % defaults "gamma" to 1.4 if not specified
    if (nargin == 3) || isempty(gamma)
        gamma = 1.4;
    end
    
    % converts any input to a temperature ratio
    if strcmpi(spec_in,'T2/T1') || strcmpi(spec_in,'Tt2/Tt1')
        TR = Q_in;
    elseif strcmpi(spec_in,'P2/P1') || strcmpi(spec_in,'Pt2/Pt1')
        TR = Q_in^((gamma-1)/gamma);
    elseif strcmpi(spec_in,'rho2/rho1') || strcmpi(spec_in,'rhot2/rhot1')
        TR = Q_in^(gamma-1);
    elseif strcmpi(spec_in,'a2/a1') || strcmpi(spec_in,'at2/at1')
        TR = Q_in^2;
    elseif strcmpi(spec_in,'h2/h1') || strcmpi(spec_in,'ht2/ht1')
        TR = Q_in;
    end
    
    % converts temperature ratio to desired output
    if strcmpi(spec_out,'T2/T1') || strcmpi(spec_out,'Tt2/Tt1')
        Q_out = TR;
    elseif strcmpi(spec_out,'P2/P1') || strcmpi(spec_out,'Pt2/Pt1')
        Q_out = TR^(gamma/(gamma-1));
    elseif strcmpi(spec_out,'rho2/rho1') || strcmpi(spec_out,'rhot2/rhot1')
        Q_out = TR^(1/(gamma-1));
    elseif strcmpi(spec_out,'a2/a1') || strcmpi(spec_out,'at2/at1')
        Q_out = sqrt(TR);
    elseif strcmpi(spec_out,'h2/h1') || strcmpi(spec_out,'ht2/ht1')
        Q_out = TR;
    end
    
end