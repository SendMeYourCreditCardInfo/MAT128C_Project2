function Out = RKF(f, a, b, alpha, TOL, hmax, hmin)
format long
t = a;
w = alpha;
h = hmax;
flag =1;

T = [];
W = [];
H = [];
D = [];
ri = [];
c = 1;

while (flag == 1)
    k1 = h*f(t,w);
    k2 = h*f(t +0.25*h, w +0.25*k1);
    k3 = h*f(t+(3/8)*h, w +(3/32)*k1+(9/32)*k2);
    k4 = h*f(t+(12/13)*h, w+(1932/2197)*k1-(7200/2197)*k2+(7296/2197)*k3);
    k5 = h*f(t+h, w+(439/216)*k1 -8*k2+(3680/513)*k3-(845/4104)*k4);
    k6 = h*f(t+ 0.5*h, w- (8/27)*k1 + 2*k2 - (3544/2565)*k3 + (1859/4104)*k4 - (11/40)*k5);
    
    R = (1/h)*abs((1/360)*k1 - (128/4275)*k3 - (2197/75240)*k4 + k5*(1/50) +(2/55)*k6);
    
    delta = .84*(TOL/R)^(1/4);
    
    if R <= TOL
       t = t + h;
       w = w + (25/216)*k1 + (1408/2565)*k3 + (2197/4104)*k4 - 0.2*k5;
     %  fprintf('%d || %d || %d || %d || %d\n',t,w,h,delta,R);
       T(c) = t; W(c) = w; H(c) = h; D(c) = delta; ri(c) = R;
       
    end
    
    if delta < 0.1
        h = 0.1 *h;
    elseif delta >= 4
        h = 4*h;
    else
        h = delta*h;
    end
    
    if h > hmax
        h = hmax;
    end
    
    if t >= b
        flag = 0;
    elseif (t+h) > b
        h = b -t;
    elseif h < hmin
        flag = 0;
        fprintf('ERROR!');
    end
    c = c + 1;
end
    ti = [T'];
    wi = [W'];
    hi = [H'];
    di = [D'];
    Ri = [ri'];
    Out = table(ti,wi,hi,di,Ri);
end