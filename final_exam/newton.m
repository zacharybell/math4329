function [root, it_count] = newton(fcn,dfcn, x0,error_bd,max_iterate)
%
% 
%
% This is Newton's method for solving an equation f(x) = 0.
%
% The functions f(x) and deriv_f(x) need to be given as strings.
% The parameter error_bd is used in the error test for the 
% accuracy of each iterate.  The parameter max_iterate
% is an upper limit on the number of iterates to be 
% computed.  An initial guess x0 must also be given.
%
% For the given function f(x), an example of a calling sequence 
% might be the following:
%    root = newton('sin(x)', 'cos(x)',1,1.0E-12,10,1)
% The parameter index_f specifies the function to be used.
%
% The program prints the iteration values
%      iterate_number, x, f(x), deriv_f(x), error
% The value of x is the most current initial guess, called
% previous_iterate here, and it is updated with each iteration. 
% The value of error is 
%    error = newly_computed_iterate - previous_iterate
% and it is an estimated error for previous_iterate.
% Tap the carriage return to continue with the iteration. 

format short e
error = 1;
it_count = 0;

f = inline(fcn);
deriv_f = inline(dfcn) ;

while abs(error) > error_bd & it_count <= max_iterate
    fx = f(x0);
    dfx = deriv_f(x0);
    if dfx == 0
        disp('The derivative is zero.  Stop')
        return
    end
    x1 = x0 - fx/dfx;
    error = x1 - x0;
%   Internal print of newton method. Tap the carriage
%   return key to continue the computation.
    iteration = [it_count x0 fx dfx error] ;
%    pause 
    x0 = x1;
    it_count = it_count + 1;
end

if it_count > max_iterate
    disp('The number of iterates calculated exceeded') 
    disp('max_iterate.  An accurate root was not')
    disp('calculated.')
else
    format long
    root = x1 ;
    format short e
    error ;
    format short
    it_count ;
end

