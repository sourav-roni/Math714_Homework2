% Name: Sourav Pal
% Date: November 1 2020

clear; clc;
start_N = 96;
end_N = 100;
for k=start_N:end_N
    N = k;
    h = 1/N;
    Xs = 0:h:1; 
    syms f(x);
    f(x) = exp(-400*(x - 0.5).^2);

    all_errors = zeros(1,N);
    for j=0:N-1
        xj = j*h;
        xj1 = (j+1)*h;
        syms f_interp(x);
        f_interp(x) = f(xj) + (x - xj)*N*(f(xj1) - f(xj));
        syms g(x);
        g(x) = f_interp(x) - f(x);
        dg = diff(g,x);
        interval = [xj, xj1];
        roots = fzero(dg,interval);
        val_at_root = g(roots);
        fprintf('Roots %f \n', roots);
        fprintf('Difference %f\n', val_at_root);
        all_errors(1,j+1) = val_at_root;
    end
    max_error = max(abs(all_errors));
    fprintf('Maximum error for N= %d is %f \n', N, max_error);
    if max_error < 0.01
        fprintf("Minimum value of N required is %d \n",N);
        break;
    end
end