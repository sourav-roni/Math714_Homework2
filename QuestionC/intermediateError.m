% Name: Sourav Pal
% Date: November 1 2020

function [curr_error] = intermediateError(U, U_fin, k)
size_Ufin = size(U_fin);
max_N = size_Ufin(1);
finest_grid = 4;
to_skip_pow = finest_grid - k;
downsample = U_fin(1:2^to_skip_pow:max_N, 1:2^to_skip_pow:max_N,3);        % Downsample from fine grid to compare with coarser grid
curr_error = max(max(abs(downsample - U(:,:,3))));
end