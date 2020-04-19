clc;clear;close all;
path = ginput() * 100.0;

n_order       = 7;% order of poly
n_seg         = size(path,1)-1;% segment number
n_poly_perseg = (n_order+1); % coef number of perseg

ts = zeros(n_seg, 1);
% calculate time distribution in proportion to distance between 2 points
dist     = zeros(n_seg, 1);
dist_sum = 0;
T        = 1;
t_sum    = 0;

for i = 1:n_seg
    dist(i) = sqrt((path(i+1, 1)-path(i, 1))^2 + (path(i+1, 2) - path(i, 2))^2);
    dist_sum = dist_sum+dist(i);
end
for i = 1:n_seg-1
    ts(i) = dist(i)/dist_sum*T;
    t_sum = t_sum+ts(i);
end
ts(n_seg) = T - t_sum;

% or you can simply set all time distribution as 1
% for i = 1:n_seg
%     ts(i) = 1;
% end

poly_coef_x = MinimumSnapQPSolver(path(:, 1), ts, n_seg, n_order);
poly_coef_y = MinimumSnapQPSolver(path(:, 2), ts, n_seg, n_order);


% display the trajectory
X_n = [];
Y_n = [];
k = 1;
tstep = 0.01;
for i=0:n_seg-1
    %#####################################################
    % STEP 3: get the coefficients of i-th segment of both x-axis
    % and y-axis
    Pxi = poly_coef_x((n_order+1)*(i)+1:(n_order+1)*(i)+n_order+1); % note (n_order+1) jump to another segment!
    Pyi = poly_coef_y((n_order+1)*(i)+1:(n_order+1)*(i)+n_order+1);

    for t = 0:tstep:ts(i+1)
        X_n(k)  = polyval(flip(Pxi), t);
        Y_n(k)  = polyval(flip(Pyi), t);
        k = k + 1;
    end
end
 
plot(X_n, Y_n , 'Color', [0 1.0 0], 'LineWidth', 2);
hold on
scatter(path(1:size(path, 1), 1), path(1:size(path, 1), 2));


