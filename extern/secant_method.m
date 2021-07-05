%==========================================================================
%
% secant_method  Calculates the root of a univariate function using the 
% secant method.
%
%   root = secant_method(f,x0)
%   root = secant_method(f,x0,TOL)
%   root = secant_method(f,x0,[],imax)
%   root = secant_method(f,x0,TOL,imax)
%   root = secant_method(__,'all')
%
% See also fzero, bisection_method, newtons_method
%
% Copyright © 2021 Tamas Kis
% Contact: tamas.a.kis@outlook.com
% Last Update: 2021-07-04
%
%--------------------------------------------------------------------------
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/85745-secant-method-secant_method
% GitHub: https://github.com/tamaskis/secant_method-MATLAB
%
% See EXAMPLES.mlx for examples and "DOCUMENTATION.pdf" for additional 
% documentation. Both of these files are included with the download.
%
%--------------------------------------------------------------------------
%
% -------
% INPUTS:
% -------
%   f       - (function_handle) f(x)
%   x0      - (1×1) initial guess for root
%   TOL     - (OPTIONAL) (1×1) tolerance
%   imax    - (OPTIONAL) (1×1) maximum number of iterations
%   output  - (OPTIONAL) (char) if specified as 'all', function will return
%             all intermediate root estimates; otherwise, a faster 
%             algorithm is used to only return the converged root
%
% --------
% OUTPUTS:
% --------
%   root    - (1×1 or n×1) root of f(x)
%           	--> if "output" is specified as 'all', then "root" will be
%                   a vector, where the first element is the initial guess,
%                   the last element is the converged root, and the other 
%                   elements are intermediate estimates of the root
%               --> otherwise, "root" is a single number storing the
%                   converged root
%
%==========================================================================
function root = secant_method(f,x0,TOL,imax,output)
    
    % sets default tolerance and maximum number of iterations if not
    % specified by user
    if (nargin < 3) || isempty(TOL)
        TOL = 1e-12;
    end
    if (nargin < 4) || isempty(imax)
        imax = 1e6;
    end
    
    % decides which algorithm to use
    if nargin < 5
        return_all = false;
    else
        if strcmp(output,'all')
            return_all = true;
        else
            return_all = false;
        end
    end
    
    % initializes the error so the loop will be entered
    err = 2*TOL;
    
    % implements algorithm for the secant method where all intermediate 
    % root estimates are also returned
    if return_all
        
        % preallocates x
        x = zeros(imax,1);
    
        % inputs 1st and 2nd guesses for root into x vector
        x(1) = x0;
        x(2) = 1.01*x0;

        % secant method
        i = 2;
        while (err > TOL) && (i < imax)

            % updates estimate of root
            x(i+1) = (x(i-1)*f(x(i))-x(i)*f(x(i-1)))/(f(x(i))-f(x(i-1)));

            % calculates error
            err = abs(x(i+1)-x(i));

            % increments loop index
            i = i+1;

        end

        % returns converged root along with intermediate root estimates
        root = x(1:i);
    
    else
        
        % sets root estimates for 1st iteration of the secant method
        x_old = x0;
        x_int = 1.01*x0;
        
        % initializes x_new so its scope isn't limited to the while loop
        x_new = 0;

        % secant method
        i = 2;
        while (err > TOL) && (i < imax)

            % updates estimate of root
            x_new = (x_old*f(x_int)-x_int*f(x_old))/(f(x_int)-f(x_old));

            % calculates error
            err = abs(x_new-x_int);
            
            % stores current and previous root estimates for next iteration
            x_old = x_int;
            x_int = x_new;

            % increments loop index
            i = i+1;

        end

        % returns converged root
        root = x_new;
        
    end
      
end