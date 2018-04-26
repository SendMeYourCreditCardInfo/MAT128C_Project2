function Euler(f,a,b,h,alpha)
%{
    Euler is a function designed to implement Euler's Method for function
    f(t,y) on the interval t in [a,b], number of intervals N, and initial 
    condition
    y(a) = alpha. 

    note that f is an @ function. i.e. f=@(t,y) exp(t)-y^2
%}
    N=(b-a)/h; time=a; w=alpha; wPlus=0; 
    X=zeros(ceil(N+1),1);               %Initialize a Matrix to hold values time values
    X(1,1)=(time);                      %Initialize first time value in matrix
    Y=zeros(ceil(N+1),1);
    Y(1,1)=w;
    fprintf('Euler approximation of f(t,y) at time t=%d is %d.\n', a, alpha);
    for k=1:N                           % for loop perfomrs Euler's Method,
        fx = feval(f,time,w);           % i.e. Taylor method of order 1, and
        wPlus = w + h*fx;               % prints approximation at time t. 
        time  = a + k*h;
        w = wPlus;
        X(k+1,1)=time;
        Y(k+1,1)=w;
        fprintf('Euler approximation of f(t,y) at time t=%d is %d.\n', time, wPlus);
    end
        figure
        plot(X,Y)
        str = sprintf('Eulers Method using stepsize %d', h);
        title(str)

