f = @(x) (sqrt(4+x)-2)/x;
g = @(x) (x-sin(x))/(x^3);

f_ = @(x) x/(x*sqrt(4+x)+2*x);
g_ = @(x) (1/6)-(x^2/120);

x = arrayfun(@(x) 10.^(-x), 1:15);

disp('Part B');
table(x.', arrayfun(f, x).', arrayfun(g, x).', 'VariableNames', {'x', 'f_x', 'g_x'})

disp('Part C');
table(x.', arrayfun(f_, x).', arrayfun(g_, x).', 'VariableNames', {'x', 'f_x', 'g_x'})