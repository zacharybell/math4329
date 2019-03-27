% Part A
f = @(x,y) x.^2 + x*y.^3 - 9;
g = @(x,y) y*3*x.^2 - y.^3 - 4;

fimplicit(f, [-4, 4, -4, 4]);
hold on
fimplicit(g, [-4, 4, -4, 4], '-r');
hold off