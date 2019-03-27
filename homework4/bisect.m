function [root, error_bound] = bisect(f, a0,b0,ep,max_iterate)
    if a0 >= b0
        disp('a0<b0 is not true. Stop!');
        return
    end
    
    format short e
    a = a0; b = b0;
    fa = f(a); fb = f(b);
    
    if sign(fa)*sign(fb) > 0
        disp('f(a0) and f(b0) are of the same sign. Stop!');
        return
    end
    
    c = (a+b)/2;
    it_count = 0;
    
    while b-c > ep && it_count < max_iterate
        fprintf('\n it_count a b c f(c) b-c\n')
        it_count = it_count + 1;
        fc = f(c);
        iteration = [it_count a b c fc b-c]
        if sign(fb) * sign(fc) <= 0
            a = c;
            fa = fc;
        else
            b = c;
            fb = fc;
        end
        c = (a+b)/2;
    end
    
    format long
    root = c;
    format short
    error_bound = b-c;
end

