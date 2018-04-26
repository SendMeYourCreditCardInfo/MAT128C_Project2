function FourS = AdamB4S(f,a,b,h,alpha)
M1 = 0;
M2 = 0;
N = (b - a)/h;
W = zeros(1,M1+1);
W(1,1) = alpha;
T = zeros(1,M2+1);
T(1,1) = a;
T(1,2) = a +h;
T(1,3) = T(1,2) +h;
T(1,4) = T(1,3) + h;
W(1,2) = alpha + h*feval(f, alpha,a);
W(1,3) = W(1,2) + h*feval(f, T(1,2),W(1,2));
W(1,4) = W(1,3) + h*feval(f, T(1,3),W(1,3));

M1 = 5;
M2 = 5;

    for i = 1:N-1
        W(1, M1) = W(1,M1-1) + (h/24)*(23*feval(f, T(1,M2-1),W(1,M1-1)) - 16*feval(f, T(1,M2-2),W(1,M1-2)) + 5*feval(f, T(1,M2-3),W(1,M1-3)));
        M1 = M1 +1;
      fprintf('W%d is %d\n',M1-2, W(1,M1-1));
        T(1,M2) = T(1,M2-1) + h;
        M2 = M2 + 1;
    end

end