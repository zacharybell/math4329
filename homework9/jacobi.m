function [x, iflag, itnum] = jacobi(A, b, x0, delta, max_it)
    n = length(b);
    iflag = 1;
    k = 0;
    
    diagA = diag(A);
    A = A-diag(diagA);
    
    while k < max_it
        k = k+1;
        x = (b-A*x0)./diagA;
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

