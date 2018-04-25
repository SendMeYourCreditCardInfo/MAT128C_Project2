function R = RKF(f,a,b,alpha,TOL,hmax,hmin)
%Having a problem finding my exact h in this algortithm
format long
%   STEP 1
    time=a; 
    w=alpha; 
    h = hmax;
    FLAG=1;
    N1 = 0;
    N2 = 0;
    N3 = 0;
    T = zeros(1,N1+1);
    T(1,1) = time;
    W =  zeros(1, N2+1);
    W(1,1) = alpha;
    H = zeros(1,N3+1);
    H(1,1) = hmax;

    %STEP 2
    while FLAG == 1
        
        %STEP 3
        k1 = h*feval(f,T(1,N1+1),W(1,N2+1));
        k2 = h*feval(f,T(1,N1+1)+(1/4)*h, w+(1/4)*k1);
        k3 = h*feval(f,T(1,N1+1)+(3/8)*h, w+(3/32)*k1 + (9/32)*k2);
        k4 = h*feval(f, T(1,N1+1)+(12/13)*h, w+(1932/2197)*k1 - (7200/2197)*k2+(7296/2197)*k3);
        k5 = h*feval(f, T(1,N1+1)+h, w + (439/216)*k1-8*k2+(3680/513)*k3 - (845/4104)*k4);
        k6 = h*feval(f, T(1,N1+1)+h/2, w - (8/27)*k1 + 2*k2 - (3544/2565)*k3 +(1859/4104)*k4 -(11/40)*k5);
        R = (1/h)*abs((1/360)*k1 - (128/4275)*k3 - (2197/75240)*k4 + (1/50)*k5 + (2/55)*k6);
        N1 = N1 + 1;
        N2 = N2 + 1;
     %  Debug
     %  display(k1);
     %  display(k2);
     %  display(k3);
     %  display(N1);
     %  display(R);
     %  display(T(1,N1));
     %  fprintf(' k1 is %d\n  k2 is %d\n  k3 is %d\n  k4 is %d\n  k5 is %d\n  k6 is %d\n R is %d\n \n \n \n time is %d\n \n ',k1,k2,k3,k4,k5,k6,R,time);
     %  fprintf('R < TOL ===> %d < %d\n \n \n',R,TOL);
     % STEP 5
        if R <= TOL
            %STEP 6
            %N1 = N1 +1;
            T(1,N1+1) = T(1,N1) + h;
            N2 = N2 +1;
     %  display(N2);
            w = W(1,N2-1) + (25/216)*k1 + (1408/2565)*k3 + (2197/4104)*k4 - (1/5)*k5;
            W(1,N2+1) = w; 
     %  display(W(1,N2+1));
     %  display(T(1,N1+1));
%  STEP 7
          %  fprintf('START\nTime is %d, w is %d, h is %d\nEND\n \n \n \n \n',time,w,h);
        end
%  STEP 8
        delta = 0.84*(TOL/R)^(1/4);
%  STEP 9
        if delta <= 0.1
            h = 0.1*h;  
        else if delta >= 4
                h= 4*h;                              
            else
                h = 8*h;                          
            end
        end
     %  STEP 10
        if h > hmax
            h = hmax;
        end
      % STEP 11
        if T(1,N1) >= b
            FLAG = 0;
        else if T(1,N1) + h > b
                h = b - T(1,N1);
                                    
            else if h < hmin
                    FLAG = 0;
                    fprintf('Minimum h has been exceeded');
                end
            end
        end
                                            N3 = N3 +1;
                                            H(1,N3+1) = h;
    end
   % Debug and Final format 
    ti = [T'];
    %wi = [W'];
    TABLE = table(ti);
    R = TABLE

  