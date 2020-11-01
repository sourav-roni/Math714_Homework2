% Name: Sourav Pal
% Date: November 1 2020

clear;
clc;
rho_p= @(x,y) (1 + ((x+y*i))/2 + sqrt((1+((x+y*i)/2))^2-1));
rho_m= @(x,y) (1 + ((x+y*i))/2 - sqrt((1+((x+y*i)/2))^2-1));
N = 100;
h = 1/N;
Xs = -5:h:5;
Ys = -5:h:5;
temp = size(Xs);
dim = temp(2);

pos_val = zeros(dim, dim);
neg_val = zeros(dim, dim);

for i=1:dim
    for j=1:dim
        pos_val(i,j) = abs(rho_p(Xs(i), Ys(j)));
        neg_val(i,j) = abs(rho_m(Xs(i), Ys(j)));
        if pos_val(i,j) <1
            if neg_val(i,j) <1
                fprintf("%f, %f \n", Xs(i), Ys(j));
            end
        end
    end
end

[X,Y] = meshgrid(Xs, Ys);
surf(Y,X,pos_val, 'FaceColor','g', 'FaceAlpha',0.5, 'EdgeColor','none');
hold;
surf(Y,X,neg_val, 'FaceColor','r', 'FaceAlpha',0.5, 'EdgeColor','none');
xlabel("x");
ylabel("y");
zlabel("Magnitude of rho_roots");