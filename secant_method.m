% secant_method  Calculates the root of a univariate function using the 
% secant method.
%
%   root = secant_method(f,x0) returns the root of a function f(x)
%   specified by the function handle f, where x0 is an initial guess of the
%   root. The default tolerance and maximum number of iterations are 
%   TOL = 1e-12 and imax = 1e6, respectively.
%
%   root = secant_method(f,x0,TOL) returns the root of a function f(x)
%   specified by the function handle f, where x0 is an initial guess of the
%   root and TOL is the tolerance. The default maximum number of iterations
%   is imax = 1e6.
%
%   root = secant_method(f,x0,[],imax) returns the root of a function f(x)
%   specified by the function handle f, where x0 is an initial guess of the
%   root and imax is the maximum number of iterations. The default 
%   tolerance is TOL = 1e-12.
%
%   root = secant_method(f,x0,TOL,imax) returns the root of a function
%   f(x) specified by the function handle f, where x0 is an initial guess
%   of the root, TOL is the tolerance, and imax is the maximum number of
%   iterations.
%
% See also fzero
%
% See https://github.com/tamaskis/secant_method-MATLAB for additional 
% documentation and examples. Examples can also be found in EXAMPLE.m 
% (included with download).
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: f - function handle for f(x)
%        x0 - initial guess for root
%        TOL - tolerance (OPTIONAL)
%        imax - maximum number of iterations (OPTIONAL)
% OUTPUT: root - root of f(x)
function root = secant_method(f,x0,TOL,imax)
    
    % sets default tolerance and maximum number of iterations depending on
    % which inputs are specified by user
    if nargin < 3
        TOL = 1e-12;
        imax = 1e6;
    elseif nargin == 3
        imax = 1e6;
    elseif (nargin == 4) && isempty(TOL)
        TOL = 1e-12;       
    end
    
    % initializes the error so the loop will be entered
    err = 2*TOL;
    
    % preallocates x
    x = zeros(imax,1);
    
    % inputs first and second guesses for root into x vector
    x(1) = x0;
    x(2) = 1.01*x0;

    % secant method
    i = 2;
    while (i < imax) && (err > TOL)
        
        % updates estimate of root
        x(i+1) = (x(i-1)*f(x(i))-x(i)*f(x(i-1)))/(f(x(i))-f(x(i-1)));
        
        % calculates error
        err = abs(x(i+1)-x(i));

        % increments loop index
        i = i+1;
        
    end
    
    % returns root
    root = x(i);
      
end