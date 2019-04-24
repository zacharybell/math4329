function integral = simpsons(a, b, n, f)
    N = 2*n;
    h = (b-a)/N;
    integral = f(a) + f(b);
    
    for i=1:n-1
        integral = integral + 2*f(a+h*2*i);
    end
    
    for i=1:n
        integral = integral + 4*f(a+h*2*i-h);
    end
    
    integral = (h/3)*integral;
end

