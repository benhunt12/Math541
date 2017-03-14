function phi_n = phi_fib(a,b,phi1,phi2,N)
    
    %creates array of zeros, the size of desired N, to be filled by loop
    %sets first two indexes with user input
    phi_n = zeros(1,N); 
    X = linspace(0,N,N);
    phi_n(1)=phi1;
    phi_n(2)=phi2;
    n = 3; %start at 3 because indexes 1 and 2 have alread been filled
    
    %loops until the number of iterations has reach user inputs
    while n <= N
        phi_n(n)=(a*phi_n(n-1))+(b*phi_n(n-2));
        n=n+1;
    end
    
    %slope of semilog
    deltaY = phi_n(2:end) - phi_n(1:end-1);
    deltaX = X(2:end) - X(1:end-1);
    
    slope = deltaY./deltaX
end

