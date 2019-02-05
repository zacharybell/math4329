% TESTING
c=99;

disp('Overflow');
disp(overflow(c));

disp('Underflow');
disp(underflow(c));
% END TESTING

function n = overflow(m)
    n = 1;
    while true
        tmp = m.^n;
        if isinf(tmp)
            break;
        end
        n=n+1;
    end 
end

function n = underflow(m)
    n = 1;
    while true
        tmp = 1/(m.^n);
        if tmp == 0
            break;
        end
        n=n+1;
    end 
end


