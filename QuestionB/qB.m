% Name: Sourav Pal
% Date: November 1 2020

clear; clc;
N = 100;
h = 1/N;
X = 0:h:1; 
f = @(x) exp(-400*(x - 0.5).^2);
X_query = 0:1/100000:1;
val_query = interp1(X,f(X),X_query);
plot(X,f(X),'o',X_query,val_query,':.');
title('Linear Interpolation');
original = f(X_query);
diff = original - val_query;
error = max(abs(diff));
fprintf('Max norm error for %d samples = %f\n', N, error);