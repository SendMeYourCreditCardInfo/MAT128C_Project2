function TwoS = AdamB2S(f, a, b, h, alpha)
M1 = 0;
M2 = 0;
N = (b - a)/h;
W = zeros(1,M1+1);
W(1,1) = alpha;
T = zeros(1,M2+1);
T(1,1) = a;
T(1,2) = a +h;
W(1,2) = alpha + h*feval(f, alpha,a);
M1 = 3;
M2 = 3;


for i = 1:N-1
    
    W(1,M1) = W(1,M1-1) + (h/2)*(3*feval(f, T(1,M2-1), W(1,M1-1)) - feval(f, T(1,M2-2), W(1,M1 -2)));
    M1 = M1 + 1;
   fprintf('W%d is %d\n \n',M1-2,W(1,M1-1));
    T(1,M2) = T(1,M2-1) + h;
    M2 = M2 + 1;
end

