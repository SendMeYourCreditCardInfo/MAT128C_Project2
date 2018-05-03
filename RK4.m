function R = RK4(f, a, b,alpha, h)
    N = (b -a)/h;
    t = a;
    w = alpha;
    
    Tm = zeros(1,1);
    Tm(1,1) = a;
    Tn = 1;
    Wm = zeros(1,1);
    Wm(1,1) = alpha;
    Wn = 1;
    
    
    for i = 1:N
        k1 = h*feval(f, t,w);
        k2 = h*feval(f, t + (h/2), w + k1/2);
        k3 = h*feval(f, t+(h/2), w+(k2/2));
        k4 = h*feval(f, t+h, w+k3);
        
        w = w + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
        t = a + i*h;
        
        Tn = Tn + 1;
        Tm(1,Tn) = t;
        Wn = Wn +1;
        Wm(1,Wn) = w;
        
        
        
        %fprintf('w%d is %d\n',i,w);
    end
    ti = [Tm'];
    wi = [Wm'];
    R = table(ti, wi);