f = @(x,y) (2*exp(-x^2))/sqrt(pi);

options = odeset('RelTol', 10^(-1));


[x1,y1] = ode45(f,[0 2], 1);
figure(1);
bar(x1,y1)
title('1/10 ODE 45')
hold on
z1 = erf(x1);


[x2,y2] = ode23(f,[0 2], 1);
figure(2);
plot(x2,y2,'-red')
title('1/10 ODE 23')


[x3,y3] = ode113(f,[0 2], 1);
figure(3);
plot(x3,y3,'-red')
title('1/10 ODE 113')
%end

options = odeset('RelTol', 10^(-4));
ode45(f, [0 2],0);

[x4,y4] = ode45(f,[0 2], 1);
figure(4);
plot(x4,y4,'-green')
title('1/10^7 ODE 45')

[x2,y2] = ode23(f,[0 2], 1);
figure(5);
plot(x2,y2,'-red')
title('1/10 ODE 23')


[x4,y4] = ode113(f,[0 2], 1);
figure(6);
plot(x3,y3,'-red')
title('1/10^^7 ODE 113')




options = odeset('RelTol', 10^(-7));
ode45(f, [0 2],0);

[x4,y4] = ode45(f,[0 2], 1);
figure(4);
plot(x4,y4,'-green')
title('1/10 ODE 45')

[x5,y5] = ode23(f,[0 2], 1);
figure(5);
plot(x5,y5,'-red')
title('1/10 ODE 23')


[x6,y6] = ode113(f,[0 2], 1);
figure(6);
plot(x6,y6,'-red')
title('1/10^^7 ODE 113')



options = odeset('RelTol', 10^(-10));
ode45(f, [0 2],0);


options = odeset('RelTol', 10^(-13));
ode45(f, [0 2],0);



