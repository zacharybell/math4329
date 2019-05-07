function [x, iflag, itnum] = GS(A, b, x0, delta, max_it)
    n = length(b);
    iflag = 1;
    k = 0;
    
    while k < max_it
        k = k+1;
        x(1) = (b(1)-A(1,2:n)*x0(2:n))/A(1,1);
        for i = 2:n-1
            x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
        end
        x(n) = (b(n)-A(n,1:n-1)*x(1:n-1))/A(n,n);
        relerr = norm(x-x0,inf)/(norm(x,inf)+eps);
        x0 = x;
        if relerr < delta
            break;
        end
    end
    
    itnum = k;
    if itnum == max_it
        iflag = -1;
    end
end

