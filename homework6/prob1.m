f = @(x,y) x.^2 + y.^2 - 4;
g = @(x,y) x.^2 - y.^2 - 1;

fimplicit(f, [-3, 3, -3, 3]);
hold on
fimplicit(g, [-3, 3, -3, 3], '-r');
hold off