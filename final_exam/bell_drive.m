foutput = 'bell_output.txt';

pn = "n*x+n*x.^-1-x.^n-x.^-n"; % poly function
dpn = "n-n*x.^-2-n*x^(n-1)+n*x.^(-n-1)"; % derivative
error = 0.0000005; 
max_iter = 25;
N = 20; % max n for the polynomial

fp = fopen(foutput, 'w');
fprintf(fp, 'Pn(X)=' + pn + '\n');
fclose(fp);

% Bisection
root = 3;
n = [];
roots = [];
iteration = [];

for i = 2:N
   p = poly_gen(pn, i);
   [root, it_count] = bisect(p, 1, root, error, max_iter);
   n = [n;i];
   roots = [roots;root];
   iteration = [iteration;it_count];
end

bisect_table = table(n, roots, iteration);
disp(bisect_table);
tmp = bisect_table.Variables;

fp = fopen(foutput, 'a+');
fprintf(fp, "\nBISECT METHOD\n");
fprintf(fp, "-------------\n");
fprintf(fp, " N             root            iter\n");
fprintf(fp, " --            ----            ----\n");
for i = 1:N-1
    fprintf(fp, "%2d       %.14f        %d\n", tmp(i,1), tmp(i,2), tmp(i, 3));
end

fclose(fp);

% Newton
root = 3;
n = [];
roots = [];
iteration = [];
for i = 2:N
    p = poly_gen(pn, i);
    dp = poly_gen(dpn, i);
    
    [root, it_count] = newton(p, dp, root, error, max_iter);
    
    n = [n;i];
    roots = [roots;root];
    iteration = [iteration;it_count];
end

newton_table = table(n, roots, iteration);
disp(newton_table);
tmp = newton_table.Variables;

fp = fopen(foutput, 'a+');
fprintf(fp, "\nNEWTON METHOD\n");
fprintf(fp, "-------------\n");
fprintf(fp, " N             root            iter\n");
fprintf(fp, " --            ----            ----\n");
for i = 1:N-1
    fprintf(fp, "%2d       %.14f        %d\n", tmp(i,1), tmp(i,2), tmp(i, 3));
end

fclose(fp);


% Replace the n in the polynomial function (i.e. polynomial function
% generator)
function p = poly_gen(pn, n)
   p = strrep(pn, 'n', int2str(n));
end