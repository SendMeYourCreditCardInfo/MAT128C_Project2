format long e;
f = @(t,y) (-1/25)*(t-2)^3 * y^2;
a = 10;
alpha = 100/((-a-2)^4 + 1);
t0 = min(-a ,a);
t = -a;
tfinal = max(-a, a);
h = 0.1;
H = [h];
N = (2*a)/h;


%% TOL 10^-7
fprintf('RKF with TOL = 10^(-7)\n');
RKF(f, t, tfinal, alpha,10^(-7), 0.1, 0.01)


%% TOL 10^-11
fpintf('RKF with TOL = 10^(-11)\n');
RKF(f, t, tfinal, alpha,10^(-11), 0.1, 0.01)






