% Name: Sourav Pal
% Date: November 1 2020

function [U] = updateU(U, N, fac)
t = 2;
for i=2:N
    for j=2:N
        U(i,j,t+1) = 2*U(i,j,t) - U(i,j,t-1) + fac*(U(i+1,j,t) + U(i-1,j,t) + U(i,j+1,t) + U(i,j-1,t) - 4*U(i,j,t));
    end
end

end