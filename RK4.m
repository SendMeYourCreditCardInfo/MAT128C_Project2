function R = RK4(f, a, b, h, alpha)
    N = (b -a)/h;
    t = a;
    w = alpha;
    
    for i = 1:N
        k1 = h*feval(f, t,w);
        Shit = t + (h/2);
        Fuck = w + k1/2;
        k2 = h*feval(f, Shit, Fuck);
        k3 = h*feval(f, t+(h/2), w+(k2/2));
        k4 = h*feval(f, t+h, w+k3);
        
        w = w + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
        t = a + i*h;
        fprintf('w%d is %d\n',i,w);
    end