function integral = trapezoidal(a, b, n, f)
    h = (b-a)/n;
    integral = 0.5*(f(a)+f(b));
    
    while (n > 1)
        a = h+a;
        integral = integral+f(a);
        n = n-1;
    end
    
    integral = integral*h;
end