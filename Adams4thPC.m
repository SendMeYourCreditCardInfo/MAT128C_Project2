function Out = Adams4thPC(f, a, b, h, alpha)


%STEP 1
    N = (b - a)/h;          %   Gets the step size
    NOne = N + 1;           %   Need the (N+1) step size
    t0 = a;
    t1 = a;
    t = a;
    w = alpha; 
    w0 = alpha;
    wPlus = alpha;

    M0 = 0;
    M1 = 0;
    M2 = 0;
    T = zeros(1, M0+1);     %   The t matrix
    T(1,1) = t0;            %   The first line in the t-matrix
    W =  zeros(1,M1+1);     %   The w matrix
    W(1,1) =  w0;           %   The first line in the w-matrix
    H = zeros(1,M2+1);      %   The h matrix, just incase, not needed
    H(1,1) = h;             %   The first and only entry to the h-matrix
    
    %   Debug
    %   fprintf('t0 is %d \nw0 is %d\n \n \n',t0,w0);

% STEP 2    
    for i = 1:1:3
% STEP 3
    %   Runge-Kutta 
        k1 = h*feval(f, t1, w);
        k2 = h*feval(f, t1 + h/2, w + k1/2);
        k3 = h*feval(f, t1 + h/2, w + k2/2);
    	k4 = h*feval(f, t1 + h, w + k3);
% STEP 4	
    %   Creates w0, w1, w2, w3 and t0,t1,t2,t3 and places them in the
    %   correct matrices
    	wPlus = w + (k1 + 2*k2 + 2*k3 + k4)/6;
    	M1 = M1 +1;
    	W(1,M1+1) = wPlus;
        w = wPlus;
	
        t1 = a + i*h;
            M0 = M0 + 1;
            T(1,M0+1) = t1;
% STEP 5	
    %   Debug
        %fprintf('RK loop:\nt is %d\nw is %d\n \n',ti,w);
    end
% STEP 6
    for i = 4:1:N
% STEP 7   
    %   The Core part of the Abram's 4th Order PC
        t = a + h*i;
            M0 = M0 + 1;
            T(1,M0+1) = t;
    %   Debug
    %   fprintf('W(1,1) = %d\nW(1,2) = %d\nW(1,3) = %d\nW(1,4)= %d\n \n',W(1,1),W(1,2),W(1,3),W(1,4));
        wp = W(1,i) + (h/24)*(55*feval(f,T(1,i),W(1,i)) - 59*feval(f,T(1,i-1),W(1,i-1)) + 37*feval(f,T(1,i-2),W(1,i-2)) - 9*feval(f,T(1,i-3),W(1,i-3)));
        w = W(1,i) + (h/24)*(9*feval(f,T(1,i+1),wp) + 19*feval(f,T(1,i),W(1,i)) - 5*feval(f,T(1,i-1),W(1,i-1)) + feval(f,T(1,i-2),W(1,i-2)));
            M1 = M1 + 1;
            W(1,M1+1) = w;   
            
    %   Debug    
    %   fprintf('wp is %d\nw is %d\n \n',wp,w);
    %   display(wp);
    %   display(T(1,i+1));
    %   display(feval(f,T(1,i+1),wp));
    %   display(i);
% STEP 8        
    %   fprintf('ADAM LOOP:\nt is %d\nw is %d\n \n \n',t,w);
    end
% STEP 9    
    for j = 0:1:2
        
    %   Steps 9-11, fucks up the algortithm 
        
    %   Debug
    %   fprintf('T(1,1) = %d\nT(1,2) = %d\nT(1,3) = %d\nT(1,4)= %d\n \n',T(1,1),T(1,2),T(1,3),T(1,4));
        
    %   T(1,j+1) = T(1,j+2);
    %   W(1,j+1) = W(1,j+2);
% STEP 10
    %   T(1,4) = t;
    %   W(1,4) = w;
        
% STEP 11        
    end
    ti = [T'];
    wi = [W'];
    TABLE = table(ti, wi);
    Out = TABLE
end
    