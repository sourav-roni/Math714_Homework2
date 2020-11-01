% Name: Sourav Pal
% Date: November 1 2020

clear; clc;
start_N = 10;
end_N = 150;
for k=start_N:5:end_N
    N = k;
    h = 1/N;
    X = 0:h:1; 
    f = @(x) exp(-400*(x - 0.5).^2);
    X_query = 0:1/100000:1;              % Fine grid
    val_query = interp1(X,f(X),X_query);
    plot(X,f(X),'o',X_query,val_query,':.');
    title('Linear Interpolation');
    original = f(X_query);
    difference = original - val_query;
    error = max(abs(difference));
    fprintf('Max norm error for %d samples = %f\n', N, error);
    if error < 0.01
        fprintf("Minimum value of N required is %d \n",N);
        break;
    end
end