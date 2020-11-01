% Name: Sourav Pal
% Date: November 1 2020

function [U] = initU(N, h, delt)

Xs = 0:h:1;
Ys = 0:h:1;
u_0 = @(x,y) 0;
ut_0 = @(x,y) exp(-400*(x - 0.5)^2)*exp(-400*(y - 0.5)^2);
U = zeros(N+1, N+1, 3);
for i=1:N+1
    for j=1:N+1
        U(i,j,1) = (u_0(Xs(i),Ys(j)));
    end
end

for i=1:N+1
    for j=1:N+1
        U(i,j,2) = delt*(ut_0(Xs(i),Ys(j)));
    end
end
end