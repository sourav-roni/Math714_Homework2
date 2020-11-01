% Name: Sourav Pal
% Date: November 1 2020
clear; clc;

% Here, we will will parameterize the number of grid points
% in between 0 and 1 on both the spatial dimensions
% We will computing the error of coarse grids to a very fine grid

% First we find the number of grid points for the different
% coarseness levels. Note we take care that the most fine grid
% contains each of the coarser grid points within it

% We get the minimum number of grid points from the solution to Q(b)
n_min = 100;

% Function to compute the number of grid points in-between the edges 
% k accounts for the coarseness of the grid, the higher the value, the
% finer the grid
% n is the the number of points int the most coarse grid
num_pts = @(n,k) (2^k*(n+1)-1);

% Store the number of grid points and grid_spacing
Ns = zeros(1,5);
hs = zeros(1,5);

for k=0:4
    Ns(1,k+1) = num_pts(n_min, k);
    hs(1,k+1) = 1/(num_pts(n_min, k)+1);
end

fprintf("Number of points \n");
fprintf("%d \t ",Ns);
fprintf("\n");
fprintf("Grid spacing \n");
fprintf("%d \t ",hs);
fprintf("\n");

% Use a value of del_t such that CFL conditions are satisfied for all cases
del_t = 0.5*(hs(1,5)); 
% Time horizon
T = 1;
fprintf("Time horizon = %f, Delta_t = %f \n", T, del_t);

Ts = 0:del_t:T;
num_t = size(Ts);

U1 = initU(Ns(1,1)+1, hs(1,1), del_t);
U2 = initU(Ns(1,2)+1, hs(1,2), del_t);
U3 = initU(Ns(1,3)+1, hs(1,3), del_t);
U4 = initU(Ns(1,4)+1, hs(1,4), del_t);
U5 = initU(Ns(1,5)+1, hs(1,5), del_t);

max_errors = zeros(1,5);

for t=2:num_t(2)
    fprintf("Time step %d \n", t);
    
    % Update the grid values
    U1 = updateU(U1, Ns(1,1)+1, (del_t^2/(hs(1,1)^2)));
    U2 = updateU(U2, Ns(1,2)+1, (del_t^2/(hs(1,2)^2)));
    U3 = updateU(U3, Ns(1,3)+1, (del_t^2/(hs(1,3)^2)));
    U4 = updateU(U4, Ns(1,4)+1, (del_t^2/(hs(1,4)^2)));
    U5 = updateU(U5, Ns(1,5)+1, (del_t^2/(hs(1,5)^2)));
    
    % Find the intermedite error for this time step
    e1 = intermediateError(U1, U5, 0);
    e2 = intermediateError(U2, U5, 1);
    e3 = intermediateError(U3, U5, 2);
    e4 = intermediateError(U4, U5, 3);
    e5 = intermediateError(U5, U5, 4);
    
    % Update if more than previous ones
    max_errors(1,1) = max(e1, max_errors(1,1));
    max_errors(1,2) = max(e2, max_errors(1,2));
    max_errors(1,3) = max(e3, max_errors(1,3));
    max_errors(1,4) = max(e4, max_errors(1,4));
    max_errors(1,5) = max(e5, max_errors(1,5));
end

% Plot the graph
l_delh = log(hs);
l_err = log(max_errors);
plot(l_delh, l_err);
xlabel('log h');
ylabel('log max-norm error');
