% Name: Sourav Pal
% Date: November 1 2020
clear; clc;

N = 6;
h = 1/N;
Xs = 0:h:1;
Ys = 0:h:1;
delt = 0.5*h;
T_horizon = 1;
Ts = 0:delt:T_horizon;
u_0 = @(x,y) 0;
ut_0 = @(x,y) exp(-400*(x - 0.5)^2)*exp(-400*(y - 0.5)^2);
dims = size(Ts);
U = zeros(N+1, N+1, dims(2));

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

fac = delt^2/h^2;

for t=2:dims(2)
    for i=2:N
        for j=2:N
            U(i,j,t+1) = 2*U(i,j,t) - U(i,j,t-1) + fac*(U(i+1,j,t) + U(i-1,j,t) + U(i,j+1,t) + U(i,j-1,t) - 4*U(i,j,t));
        end
    end
end

% [X,Y] = meshgrid(Xs, Ys);
% maxZ = max(max(abs(U(:,:))));
% for i=1:dims(2)
%     surf(X,Y,U(:,:,i))
%     zlim([-maxZ,maxZ])
%     pause(0.1)
% end