close all; clear; clc;
% Parameters for the trajectory
omega = 0.2 * pi;
syms t

p_0 = [0.0, 0.0, 20];
v_0 = [0.25, 0.0, -0.5];
a_0 = [0.0, 0.5, 0.0];
dt = 0.2;
K = 20;
log = [0, p_0, v_0, a_0];


% %% reference trajectory
% % trajectory of postition
% xt = 0.25 * t * cos(omega * t);
% yt = 0.25 * t * sin(omega * t);
% zt = 20 - 0.5 * t;
% figure(1)
% fplot3(xt, yt, zt, [0, 10])
% 
% % trajectory of velocity
% v_xt = 0.25 * cos(omega * t) - 0.25 * t * omega * sin(omega * t);
% v_yt = 0.25 * sin(omega * t) + 0.25 * t * omega * cos(omega * t);
% v_zt = -0.5 ;
% figure(2)
% fplot(v_xt, v_yt, [0, 10])
% 
% % trajectory of acceleration
% a_xt = - 0.5 * omega * sin(omega * t) - 0.25 * t * omega ^ 2 * cos(omega * t);
% a_yt = 0.5 * omega * cos(omega * t) - 0.25 * t * omega ^ 2 * sin(omega * t);
% a_zt = -0.0 ;
% figure(3)
% fplot(a_xt, a_yt, [0, 10])

for t = dt:dt:40
%% Construct the reference signal
% horizon 2 seconds
% reference trajectory: p, v, a
t_ref = t+0.2:0.2:t+4;
pt = zeros(length(t_ref),3);
vt = zeros(length(t_ref),3);
at = zeros(length(t_ref),3);

% reference trajectory of postition
pt(:,1) = 0.25 * t_ref .* cos(omega * t_ref);
pt(:,2) = 0.25 * t_ref .* sin(omega * t_ref);
pt(:,3) = 20 - 0.5 * t_ref;

% reference trajectory of velocity
vt(:,1) = 0.25 * cos(omega * t_ref) - 0.25 * t_ref .* omega .* sin(omega * t_ref);
vt(:,2) = 0.25 * sin(omega * t_ref) + 0.25 * t_ref .* omega .* cos(omega * t_ref);
vt(:,3) = -0.5;

% reference trajectory of acceleration
at(:,1) = - 0.5 * omega * sin(omega * t_ref) - 0.25 * t_ref .* omega ^ 2 .* cos(omega * t_ref);
at(:,2) = 0.5 * omega * cos(omega * t_ref) - 0.25 * t_ref .* omega ^ 2 .* sin(omega * t_ref);
at(:,3) = -0.0;

%% Do the MPC 
for i = 1:2
%     j(i) = mpc_oneDimension(K, dt, p_0(i), v_0(i), a_0(i), pt(:,i), vt(:,i), at(:,i));
    j(i) = mpc_oneDimension_soft_constraints(K, dt, p_0(i), v_0(i), a_0(i), pt(:,i), vt(:,i), at(:,i));

end
j(3) = 0.0;

for i = 1:3
    [p_0(i), v_0(i), a_0(i)] = forward(p_0(i), v_0(i), a_0(i), j(i), dt);
end

%% log the states
log = [log; t, p_0, v_0, a_0];


end

figure(1)
t = dt:dt:40;
% reference trajectory of postition
x = 0.25 * t .* cos(omega * t);
y = 0.25 * t .* sin(omega * t);
z = 20 - 0.5 * t;

plot3(x, y, z)
% plot(x, y)
hold on 
plot3(log(:,2),log(:,3),log(:,4))


function [Tp, Tv, Ta, Bp, Bv, Ba] = getPredictionMatrix(K, dt, p_0, v_0, a_0)
Ta = zeros(K);
Tv = zeros(K);
Tp = zeros(K);

for i = 1:K
    Ta(i,1:i) = ones(1,i) * dt;
end

for i = 1:K
    for j = 1:i
        Tv(i,j) = (i - j + 0.5) * dt ^ 2;
    end
end

for i = 1:K
    for j = 1:i
        Tp(i,j) = ((i - j + 1) * (i - j) / 2.0 + 1 / 6.0 ) * dt ^ 3;
    end
end

Ba = ones(K, 1) * a_0;
Bv = ones(K, 1) * v_0;
Bp = ones(K, 1) * p_0;

for i = 1:K
    Bv(i) = Bv(i) + i * dt * a_0;
    Bp(i) = Bp(i) + i * dt * v_0 + i ^ 2 / 2.0 * a_0 * dt ^ 2;
end


end


function [p_0, v_0, a_0] = forward(p_0, v_0, a_0, j_0, dt)
% System Model ( plant model )
    p_0 = p_0 + v_0 * dt + 0.5 * a_0 * dt ^ 2 + 1 / 6.0 * j_0 * dt ^ 3;
    v_0 = v_0 + a_0 * dt  + 0.5 * j_0 * dt ^ 2;
    a_0 = a_0 + j_0 * dt;
end

function j = mpc_oneDimension(K, dt, p_0, v_0, a_0, pt, vt, at)
    w1 = 100;
    w2 = 1;
    w3 = 1;
    w4 = 1;

    %% Construct the prediction matrix
    [Tp, Tv, Ta, Bp, Bv, Ba] = getPredictionMatrix(K, dt, p_0, v_0, a_0);
    
    %% Construct the optimization problem
    H = w1 * (Tp') * Tp + w2 * (Tv') * Tv + w3 * (Ta') * Ta + w4 * eye(K);
    F = w1 * (Bp - pt)' * Tp + w2 * (Bv - vt)' * Tv + w3 * (Ba - at)' * Ta;

    A = [Tv;-Tv;Ta;-Ta];
    b = [1e8 * ones(20,1) - Bv; 1e8 * ones(20,1) + Bv; 1e8 * ones(20,1) - Ba; 1e8 * ones(20,1) + Ba];
%     b = [100 * ones(20,1) - Bv; 100 * ones(20,1) + Bv; 100 * ones(20,1) - Ba; 10 * ones(20,1) + Ba];
    %% solve the optimization problem
%     J = quadprog(H, F);   
%     J = quadprog(H, F, [], [], A, b, -5 * ones(20,1), 5 * ones(20,1)); 
  
    J = quadprog(H, F, [], [], [], [], -5 * ones(20,1), 5 * ones(20,1)); 
%     J = quadprog(H, F, A, b); 

    %% Apply the control;
    if isempty(J)
        disp("empty")
    end
    
    j = J(1);
end

function j = mpc_oneDimension_soft_constraints(K, dt, p_0, v_0, a_0, pt, vt, at)
    w1 = 100;
    w2 = 1;
    w3 = 1;
    w4 = 1;
    w5 = 1;

    %% Construct the prediction matrix
    [Tp, Tv, Ta, Bp, Bv, Ba] = getPredictionMatrix(K, dt, p_0, v_0, a_0);
    
    %% Construct the optimization problem
    H = blkdiag(w1 * (Tp') * Tp + w2 * (Tv') * Tv + w3 * (Ta') * Ta + w4 * eye(K), w5*eye(K));
    F = [w1 * (Bp - pt)' * Tp + w2 * (Bv - vt)' * Tv + w3 * (Ba - at)' * Ta, zeros(1,K)];

    A = [Tv, zeros(K);-Tv, -eye(K); Ta, zeros(K);-Ta, zeros(K); zeros(size(Ta)), -eye(K)];
    b = [20 * ones(20,1) - Bv; 20 * ones(20,1) + Bv; 5 * ones(20,1) - Ba; 5 * ones(20,1) + Ba; zeros(K,1)];
%     b = [100 * ones(20,1) - Bv; 100 * ones(20,1) + Bv; 100 * ones(20,1) - Ba; 10 * ones(20,1) + Ba];
    %% solve the optimization problem
    J = quadprog(H, F, A, b); 

    %% Apply the control;
    if isempty(J)
        disp("empty")
    end
    
    j = J(1);
end


