x_a = [1.2; 2.5];
x_b = [-2; 2.5];
x_c = [-1.2; -2.5];
x_d = [2; -2.5];

e = 10.^(-12);
max_iter = 50;

f = @(x) [x(1).^2 + x(1)*x(2).^3 - 9; 3*x(1).^2*x(2) - x(2).^3 - 4];
df = @(x) [ 2*x(1) + x(2).^3, x(1)*3*x(2).^2;
            6*x(1)*x(2), 3*x(1).^2 - 3*x(2).^2 ];

[idx_a, x_a_] = newton_sys(f, df, x_a, e, max_iter);
[idx_b, x_b_] = newton_sys(f, df, x_b, e, max_iter);
[idx_c, x_c_] = newton_sys(f, df, x_c, e, max_iter);
[idx_d, x_d_] = newton_sys(f, df, x_d, e, max_iter);

disp("A: iter "+idx_a+" answer ("+x_a_(1)+", "+x_a_(2)+")");
disp("B: iter "+idx_b+" answer ("+x_b_(1)+", "+x_b_(2)+")");
disp("C: iter "+idx_c+" answer ("+x_c_(1)+", "+x_c_(2)+")");
disp("D: iter "+idx_d+" answer ("+x_d_(1)+", "+x_d_(2)+")");