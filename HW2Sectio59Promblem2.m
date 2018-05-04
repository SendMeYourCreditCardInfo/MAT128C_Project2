format long e;
%%2.a
f = @(t,y) (-0.5)*exp(2*t) + t^2 +2*t - 0.5;
g = @(t,y) (0.5)*exp(2*t) + t^2 - 0.5;
syms y;
t =0;
N = 1/0.1;
h = 0.1;
F = [];
G = [];
for i = 1:N
    F(i) = f(t,y);
    G(i) = g(t,y);
    t = t + i*h;
end

w1 = [F'];
w2 = [G'];
Outa = table(w1,w2);

%% 2.b
f = @(t,y) -3*exp(t) + t^2;
g = @(t,y) 4*exp(t) - 3*t + 1;
syms y;
t =0;
N = 1/0.1;
h = 0.2;
F = [];
G = [];
for i = 1:N
    F(i) = f(t,y);
    G(i) = g(t,y);
    t = t + i*h;
end

w3 = [F'];
w4 = [G'];
Outb = table(w3,w4);

%% 2.c
f = @(t,y) -3*exp(-t) - 3*sin(t) + 6*cos(t);
g = @(t,y) (3/2)*exp(-t) + (3/10)*sin(t) - (21/10)*cos(t) - (2/5)*exp(2*t);
j = @(t,y) -exp(-t) + (12/5)*cos(t) + (9/5)*sin(t) - (2/5)*exp(2*t);
syms y;
t =0;
N = 1/0.1;
h = 0.1;
F = [];
G = [];
J = [];
for i = 1:N
    F(i) = f(t,y);
    G(i) = g(t,y);
    J(i) = j(t,y);
    t = t + i*h;
end

w5 = [F'];
w6 = [G'];
w7 = [J'];
Outc = table(w5, w6,w7)

%% 2.d
f = @(t,y) 2*exp(3*t) + 3*exp(-2*t) + t;
g = @(t,y) -8*exp(-2*t) + exp(4*t) - 2*exp(3*t) + sin(t);
j = @(t,y) 2*exp(4*t) - 4*exp(3*t) - exp(-2*t) - 2;
syms y;
t =0;
N = 1/0.1;
h = 0.1;
F = [];
G = [];
J = [];
for i = 1:N
    F(i) = f(t,y);
    G(i) = g(t,y);
    J(i) = j(t,y);
    t = t + i*h;
end

w8 = [F'];
w9 = [G'];
w10 = [J'];
Outd = table(w8, w9, w10)


%% Maple Tables
