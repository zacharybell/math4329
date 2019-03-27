% function solution = newton_sys(x_init, err_tol, max_iterates)
%     x0 = zeros(2, 1);
%     for i=1:2
%         x0(i) = x_init(i);
%     end
%     
%     error = inf;
%     it_count = 0;
%     
%     while error > err_tol && it_count < max_iterates
%         it_count = it_count + 1;
%         rhs = fsys(x0);
%         A = deriv_fsys(x0);
%         
%         %A
%         %rhs
%         
%         delta = A./rhs;
%         x1 = x0 - delta;
%         error = norm(delta, inf);
%         
%         %[it_count x1' error]
%         pause
%         x0 = x1;
%     end
%     
%     solution = x1;
%     if it_count == max_iterates
%         disp(' ')
%         disp('*** Check error tolerance.')
%     end
%    
%     function f_val = fsys(x)
%         % Equations:
%         % x(1).^2 + x(1)*x(2).^3 - 9
%         % 3*x(1).^2*x(2) - x(2).^3 - 4
%        
%         f_val = [x(1).^2 + x(1)*x(2).^3 - 9, 3*x(1).^2*x(2) - x(2).^3 - 4];
%     end
% 
%     function df_val = deriv_fsys(x)
%         % Partial Derivatives
%         df_val = [ 2*x(1) + x(2).^3, x(1)*3*x(2).^2;
%                    6*x(1)*x(2), 3*x(1).^2 - 3*x(2).^2 ];
%     end
% end

function [idx, x0] = newton_sys(f, df, x0, tol, max_iter)

    error = inf;
    
    idx = 0;
    
    while error >= tol && max_iter > idx
        
        x1 = x0 - inv(df(x0))*f(x0);
        
        error = norm(x1 - x0);
        x0 = x1;
  
        idx = idx + 1;
    end

    if max_iter == idx
        disp("Max iteration reached!");
    end
end

