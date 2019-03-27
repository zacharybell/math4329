function root = newton(f, deriv_f, x0, error_bd, mat_iterate)

format short e
error = 1;
it_count = 0;

while abs(error) > error_bd && it_count < max_iterate
    fx = f(x0);
    dfx = deriv_f(x0);
    
    if dfx == 0
        disp('The derivative is zero. Stop');
        return
    end
    
    x1 = x0 - fx/dfx;
    error = x1 - x0;
    iteration = [it_count x0 fx dfx error]
    
    fprintf('\n it_count x f(x) df(x) error n');
    
    x0 = x1;
    
    it_count = it_count + 1;
end

if it_count >= max_iterate
    disp('Max iterates exceeded');
else
    fomat long
    root = x1;
    format short
end

end

