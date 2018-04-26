function ThreeS = AdamB3S(f,a,b,h,alpha)
M1 = 0;
M2 = 0;
N = (b - a)/h;
W = zeros(1,M1+1);
W(1,1) = 0;
T = zeros(1,M2+1);
T(1,1) = 0;
T(1,2) = 0.01;
T(1,3) = 0.02;
W(1,2) = 1.027559;
W(1,3) = 1.05589;
M1 = 4;
M2 = 4;

    for i = 4:N-1
        W(1, M1) = W(1,M1-1) + (h/12)*(23*feval(f, T(1,M2-1),W(1,M1-1)) - 16*feval(f, T(1,M2-2),W(1,M1-2)) + 5*feval(f, T(1,M2-3),W(1,M1-3)));
        M1 = M1 +1;
      fprintf('W%d is %d\n',M1-2, W(1,M1-1));
        T(1,M2) = T(1,M2-1) + h;
        M2 = M2 + 1;
    end

end