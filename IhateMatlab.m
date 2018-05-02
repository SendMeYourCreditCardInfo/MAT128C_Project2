f = @(x,y) (2*exp(-x^2))/sqrt(pi);
tspan = [0,2];
a = 0;

%% 7.b TOL 10^(-1)
options = odeset('RelTol', 10^(-1));
[x1,y1] = ode45(f,tspan, a, options);
figure;
z1 = erf(x1);
err = abs(z1-y1);
plot(x1,y1,'r',x1,z1,'b', x1, err,'g');
title('1/10 ODE 45');

%% 7.b TOL 10^(-1)
[x2,y2] = ode23(f,tspan, a, options);
figure;
z2 = erf(x2);
err = abs(z2-y2);
plot(x2,y2,'r',x2,z2,'b', x2, err,'g');
title('1/10 ODE 23');

%% 7.b TOL 10^(-1)
[x3,y3] = ode113(f,tspan, a, options);
figure;
z3 = erf(x3);
err = abs(z3-y3);
plot(x3,y3,'r', x3, z3,'b', x3, err,'g');
title('1/10 ODE 113');

%% 7.b TOL 10^(-3)
options = odeset('RelTol', 10^(-3));
[x1,y1] = ode45(f,tspan, a, options);
figure;
z1 = erf(x1);
err = abs(z1-y1);
plot(x1,y1,'r',x1,z1,'b', x1, err,'g');
title('1/10 ODE 45');

%% 7.b TOL 10^(-3)
[x2,y2] = ode23(f,tspan, a, options);
figure;
z2 = erf(x2);
err = abs(z2-y2);
plot(x2,y2,'r',x2,z2,'b', x2, err,'g');
title('1/10 ODE 23');

%% 7.b TOL 10^(-3)
[x3,y3] = ode113(f,tspan, a, options);
figure;
z3 = erf(x3);
err = abs(z3-y3);
plot(x3, y3,'r', x3, z3,'b', x3, err,'g');
title('1/10 ODE 113');

%% 7.b TOL 10^(-7)
options = odeset('RelTol', 10^(-7));
[x1,y1] = ode45(f,tspan, a, options);
figure;
z1 = erf(x1);
err = abs(z1-y1);
plot(x1,y1,'r',x1,z1,'b', x1, err,'g');
title('1/10 ODE 45');

%% 7.b TOL 10^(-7)
[x2,y2] = ode23(f,tspan, a, options);
figure;
z2 = erf(x2);
err = abs(z2-y2);
plot(x2,y2,'r',x2,z2,'b', x2, err,'g');
title('1/10 ODE 23');

%% 7.b TOL 10^(-7)
[x3,y3] = ode113(f,tspan, a, options);
figure;
z3 = erf(x3);
err = abs(z3-y3);
plot(x3, y3,'r', x3, z3,'b', x3, err,'g');
title('1/10 ODE 113');

%% 7.b TOL 10^(-10)
options = odeset('RelTol', 10^(-10));
[x1,y1] = ode45(f,tspan, a, options);
figure;
z1 = erf(x1);
err = abs(z1-y1);
plot(x1,y1,'r',x1,z1,'b', x1, err,'g');
title('1/10 ODE 45');

%% 7.b TOL 10^(-10)
[x2,y2] = ode23(f,tspan, a, options);
figure;
z2 = erf(x2);
err = abs(z2-y2);
plot(x2,y2,'r',x2,z2,'b', x2, err,'g');
title('1/10 ODE 23');

%% 7.b TOL 10^(-10)
[x3,y3] = ode113(f,tspan, a, options);
figure;
z3 = erf(x3);
err = abs(z3-y3);
plot(x3, y3,'r', x3, z3,'b', x3, err,'g');
title('1/10 ODE 113');

%% 7.b TOL 10^(-13)
options = odeset('RelTol', 10^(-13));
[x1,y1] = ode45(f,tspan, a, options);
figure;
z1 = erf(x1);
err = abs(z1-y1);
plot(x1,y1,'r',x1,z1,'b', x1, err,'g');
title('1/10 ODE 45');

%% 7.b TOL 10^(-13)
[x2,y2] = ode23(f,tspan, a, options);
figure;
z2 = erf(x2);
err = abs(z2-y2);
plot(x2,y2,'r',x2,z2,'b', x2, err,'g');
title('1/10 ODE 23');

%% 7.b TOL 10^(-13)
[x3,y3] = ode113(f,tspan, a, options);
figure;
z3 = erf(x3);
err = abs(z3-y3);
plot(x3, y3,'r', x3, z3,'b', x3, err,'g');
title('1/10 ODE 113');

