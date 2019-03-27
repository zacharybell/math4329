function root = secant(x0, x1, error_bd, max_iterate)
%SECANT Summary of this function goes here
%   Detailed explanation goes here
format short e

error = 1;
fx0 = f(x0);
it_count = 0;
iteration = [it_count x fx0];

while abs(error) > error_bd && it_count <= max_iterate
    it_count = it_count + 1;
    fx1 = f(x1);
    if fx1 - fx0 == 0
        disp('f(x1) = f(x0_; Division by zero; Stop');
        return;
    end
    x2 = x1 - fx1*(x1-x0)/(fx1-fx0);
    error = x2 - x1;
    
    iteration = [it_count x1 fx1 error];
    x0 = x1;
    x1 = x2;
    fx0 = fx1;
end

if it_count > max_iterate
    disp('The number of iterates calculated exceeded');
    disp('max_iterate. An accurate root was not');
    disp('calculated.');
else
    format long
    root = x2;
    format short
end


end

