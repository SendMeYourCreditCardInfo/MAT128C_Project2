format long e
f = @(x,y) (2*exp(-x^2))/sqrt(pi);

tspan = [0,2];
a = 0;

%% TOL 10^-1
options = odeset('RelTol', 10^(-1));
[x1,y1] = ode23(f,tspan, a, options);
[x2,y2] = ode45(f,tspan, a, options);
[x3,y3] = ode113(f, tspan, a, options);
figure;
ER1 = erf(x1);
ER2 = erf(x2);
ER3 = erf(x3);
err1 = abs(ER1-y1);
err2 = abs(ER2-y2);
err3 = abs(ER3-y3);
semilogy(x1,err1,'r',x2,err2,'b', x3, err3,'g');
title('10^-^1');

%% TOL 10^-4
options = odeset('RelTol', 10^(-4));
[x4,y4] = ode23(f,tspan, a, options);
[x5,y5] = ode45(f,tspan, a, options);
[x6,y6] = ode113(f, tspan, a, options);
figure;
ER4 = erf(x4);
ER5 = erf(x5);
ER6 = erf(x6);
err4 = abs(ER4-y4);
err5 = abs(ER5-y5);
err6 = abs(ER6-y6);
semilogy(x4,err4,'r',x5,err5,'b', x6, err6,'g');
title('10^-^4');

%% TOL 10^-7
options = odeset('RelTol', 10^(-7));
[x7,y7] = ode23(f,tspan, a, options);
[x8,y8] = ode45(f,tspan, a, options);
[x9,y9] = ode113(f, tspan, a, options);
figure;
ER7 = erf(x7);
ER8 = erf(x8);
ER9 = erf(x9);
err7 = abs(ER7-y7);
err8 = abs(ER8-y8);
err9 = abs(ER9-y9);
semilogy(x7,err7,'r',x8,err8,'b', x9, err9,'g');
title('10^-^7');

%% TOL 10^-10
options = odeset('RelTol', 10^(-10));
[x10,y10] = ode23(f,tspan, a, options);
[x11,y11] = ode45(f,tspan, a, options);
[x12,y12] = ode113(f, tspan, a, options);
figure;
ER10 = erf(x10);
ER11 = erf(x11);
ER12 = erf(x12);
err10 = abs(ER10-y10);
err11 = abs(ER11-y11);
err12 = abs(ER12-y12);
semilogy(x10,err10,'r',x11,err11,'b', x12, err12,'g');
title('10^-^1^0');

%% TOL 10^-13
options = odeset('RelTol', 10^(-13));
[x13,y13] = ode23(f,tspan, a, options);
[x14,y14] = ode45(f,tspan, a, options);
[x15,y15] = ode113(f, tspan, a, options);
figure;
ER13 = erf(x13);
ER14 = erf(x14);
ER15 = erf(x15);
err13 = abs(ER13-y13);
err14 = abs(ER14-y14);
err15 = abs(ER15-y15);
semilogy(x13,err13,'r',x14,err14,'b', x15, err15,'g');
title('10^-^1^3');

%% ERROR TABLE

