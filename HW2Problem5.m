format long e
f = @(x,y) (2*exp(-x^2))/sqrt(pi);

tspan = [0,2];
a = 0;

%% TOL 10^-1
tic;
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
legend('ode32','ode45','ode113');
fprintf('10^-1 time is');
toc;
%% TOL 10^-4
tic;
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
legend('ode32','ode45','ode113');
fprintf('10^-4 time is');
toc;

%% TOL 10^-7
tic;
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
legend('ode32','ode45','ode113');
fprintf('10^-7 time is');
toc;
%% TOL 10^-10
tic;
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
legend('ode32','ode45','ode113');
fprintf('10^-10 time is');
toc;

%% TOL 10^-13
tic;
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
legend('ode32','ode45','ode113');
fprintf('10^-13 time is');
toc;

%% ERROR TABLE
fprintf('To save the trough of reading 30 tables\nHere are just one of the many possible tables we could have made\nThis is jkust the comparison on the ode23 with the exact value and \nthe difference difference between the two\n');
ONEofThirty = [0,0,0;3.71327106687682e-06,3.71327106687682e-06,4.23516473627150e-22;2.22796263984460e-05,2.22796263984460e-05,3.38813178901720e-21;0.000115111402674275,0.000115111402674275,1.35525271560688e-20;0.000579270235547230,0.000579270235547230,4.33680868994202e-19;0.00290005831780003,0.00290005831780126,1.23252102968152e-15;0.0145032380280731,0.0145032380319264,3.85328574603605e-12;0.0724241441290754,0.0724241561412902,1.20122148339341e-08;0.291389439140968,0.291400703186201,1.12640452325508e-05;0.488516634141902,0.488549406169479,3.27720275770105e-05;0.652429546651964,0.652486577531213,5.70308792492424e-05;0.778316158486063,0.778392976247288,7.68177612257004e-05;0.867615842986634,0.867703889994122,8.80470074881012e-05;0.926125614863939,0.926216167097680,9.05522337408815e-05;0.961535043467868,0.961621968724120,8.69252562524236e-05;0.981328662940911,0.981409240446405,8.05775054935065e-05;0.991548661926029,0.991622877228133,7.42153021036085e-05;0.995249155876020,0.995322265018953,7.31091429330144e-05];
display(ONEofThirty);

%% Extra Clarifications
fprintf('So each ode and Tolerance, Listing them all is a pain in the ass so here is and idea:\nThe highest number of steps was 69\nThe lowest of steps was 18\n');
    

