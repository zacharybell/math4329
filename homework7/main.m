n_rows = log2(512);
A = zeros(n_rows, 7);
n = 2;

a = 0;
b = pi;
f = @(x) exp(x)*cos(4*x);
I = (exp(pi)-1)/17;

for i=1:n_rows
    A(i,1) = n;
    A(i,2) = trapezoidal(a, b, n, f);
    A(i,3) = I - A(i,2);
    A(i,5) = simpsons(a, b, n/2, f);
    A(i,6) = I - A(i,5);
    n = n*2;    
end

% compute difference
A(2:n_rows-1, 4) = (A(2:8, 2)-A(1:7, 2))./(A(3:9, 2)-A(2:8, 2));
A(2:n_rows-1, 7) = (A(2:8, 5)-A(1:7, 5))./(A(3:9, 5)-A(2:8, 5));

writematrix(A, "5_1.csv");
