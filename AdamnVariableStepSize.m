function Out =  AdamVSSPC(f, a, b, alpha, TOL, hmax, hmin)
	
	function R = RK4(h, v0, x0, v1,x1, v2, x2, v3, x3)
		V1 = 1;		
		X1 = 1;
		V = zeros(1, 3);
			V(1,1) = v0;
			V(1,2) = v1;
			V(1,3) = v2;
		X = zeros(1, 3);
			X(1,1) = x0;
			X(1,2) = x1;
			X(1,3) = x2;
    		for j = 1:3
        		k1 = h*feval( f, X(1,X1-1), V(1,V1-1) );
        		k2 = h*feval( f, X(1,X1-1) + (h/2), V(1,V1-1 + k1/2 );
        		k3 = h*feval( f, X(1,X1-1) + (h/2), V(1,V1-1) + (k2/2) );
        		k4 = h*feval( f, X(1,X1-1) + h, V(1,X1-1) + k3 );
        	
       	 		V(1,V1) = V(1,V1-1) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
        		X(1,X1) = x0 + j*h;
    	end

	T1 = 1;
	W1 = 1;
	T = zeros(1,T1);
	W = zeros(1,W1);
	T(1,1) = a;
	W(1,1) = alpha;
	h = hmax;
	FLAG = 1;
	LAST = 0;
	fprintf( 't0 is %d\nw0 is %d\n',T(1,1), W(1,1) );
	
	RK4(h, W(1,1), T(1,1), W(1,2), T(1,2), W(1,3), T(1,3), W(1,4), T(1,4) );
	NFLAG = 1;
	i =4;
	t = T(1,4) + h;

	while FLAG == 1
		WP = W(1,i-1) + ( h/34 )*( 55*feval( f, T(1,i-1), W(1,i-1)) - 59*feval( f, T(1,i-2), W(1,i-2) ) + 37*feval( f, T(1,i-3), W(1,i-3) ) - 9*feval( f, T(1, i-4), W(1,i-4) ));
		WC = W(1,i-1) + ( h/24 )*( 9*feval( f, WP) + 19*feval( f, T(1,i-1), W(1,i-1) ) - 5*feval( f, T(1,i-2), W(1,i-2) ) +  feval( f, T(1,i-3), W(1,i-3) ));
		sd = ( 19/(270*h) )*abs( WC - WP );
 		
		if sd <= TOL
			W(1,i) =  WC;
			T(1,i) = t;
			
			if NFLAG == 1
				j = i-3,i-2,i-1,i
			else
			end
		
			if LAST = 1
				FLAG = 0;
				if sd <= 0.1*TOL || T(1,i-1) +h > b
					q = ( TOL/(2*sd) )^(1/4);
					if q > 4
						h = 4*h;
					else
						h = q*h;
					if h > hmax 
						h = hmax;
					if T(1,i-1) + 4*h > b
						h = (b - T(1,i-1))/4;
						LAST = 1;
					RK4mod(h, W(1,i-1), T(1,i-1), W(1,i), T(1,i), W(1,i+1), T(1,i+1), W(1,i+2), T(1,i+2) )
					NFLAG = 1;
					i = i + 3;
			end


 
		else q = ( TOL/(2*sd) )^(1/4)
		
		if q < 0.1
			h = 0.1*h;
		else
			h = q*h;
		if h < hmin
			FLAG = 0;
			fprintf('hmin exceeded\n');
		else
			NFLAG = 1;
			i = i - 3;
			RK4mod(h, W(1,i-1), T(1,i-1), 
