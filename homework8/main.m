f = @(x) cos(x);
df = @(x) -sin(x);
x = pi/6;
h = @(n) 10.^-n;

% Example in book
% h = @(n) (1/10)*(1/2.^(n-1));

rh = @(f, x, h) (f(x+h)-f(x))/h; 
lh = @(f, x, h) (f(x)-f(x-h))/h;
cd = @(f, x, h) (f(x+h)-f(x-h))/(2*h);

p_a_dir = "a";
p_b_dir = "b";

if ~exist(p_a_dir, 'dir')
    mkdir(p_a_dir);
end

if ~exist(p_b_dir, 'dir')
    mkdir(p_b_dir);
end

% Problem A

RH = create_table_matrix(rh, f, df, h, x, 1, 14);
writematrix(RH, p_a_dir + "/right_hand.csv");
LH = create_table_matrix(lh, f, df, h, x, 1, 14);
writematrix(LH, p_a_dir + "/left_hand.csv");
CD = create_table_matrix(cd, f, df, h, x, 1, 14);
writematrix(CD, p_a_dir + "/central.csv");


% Problem B
loglog(RH(:,1),abs(RH(:,3)));
loglog(LH(:,1),abs(LH(:,3)));
loglog(CD(:,1),abs(CD(:,3)));

function A = create_table_matrix(m, f, df, h, x, a, b)
    A = zeros(b-a+3, 4, 'double');
    for n=a:b+2
        A(n-a+1,1) = h(n);
        A(n-a+1,2) = m(f, x, h(n));
        A(n-a+1,3) = df(x) - A(n-a+1,2);
    end
    
    A(1:b-a+1,4) = ratios(A(:,2)');
    A = A(1:b-a+1,:);
end


function r = ratios(x)
    r = zeros(1, size(x, 2)-2);
    for i=1:size(r,2)
        r(i) = (x(i+1)-x(i))/(x(i+2)-x(i+1));
    end
end

