function Q1_plotter()
    x = linspace(-2,2,100); %array of 100 points between -2 and 2
    y = exp(x).*sin(x); %f(x)
    y1 = x; %T1(x)
    y2 = x + x.^2; %T2(x)
    y3 = x + x.^2 + (x.^3)/3; %T3(x)
    
    figure(1);
    plot(x,y,x,y1,x,y2,x,y3);
    legend('f(x)','T1(x)','T2(x)','T3(x)');
end

function Q1_plotter2()
    x = linspace(-2,2,100);
    
    R1 = 1.551.*(x.^2);
    R2 = 0.3333.*(x.^3);
    R3 = 0.0537.*(x.^4);
    R4 = -R3;
    
    figure(1);
    plot(x,R1,x,R2,x,R3);
    legend('R1(x)','R2(x)','R3(x)');
    
    figure(2);
    plot(x,R3,x,R4);
    legend('R3(x)','R4(x)');
    
end

function y = threenplus1(length)
    n = 0; %counter starting at zero
    for jj = 1:length
        n = 5*(2^length);
        y = n;
        while n > 1
        if mod(n,2)==0
            n = n/2;
        else
            n = 3*n+1;
        end
        y = [y n];
    end
end
end

function threenplus1_plotter()

    x1 = threenplus1(2);
    x2 = threenplus1(3);
    x3 = threenplus1(6);
    x4 = threenplus1(7);

    figure(1);
    subplot(2,2,1);
    plot(x1, 'blue', 'LineWidth', 2);
    title('Length of 2');
    xlabel('Index (n)');
    ylabel('Magnitude: 3n+1');
    
    subplot(2,2,2);
    plot(x2, 'blue', 'LineWidth', 2);
    title('Length of 3');
    xlabel('Index (n)');
    ylabel('Magnitude: 3n+1');
    
    subplot(2,2,3);
    plot(x3, 'blue', 'LineWidth', 2);
    title('Length of 6');
    xlabel('Index (n)');
    ylabel('Magnitude: 3n+1');
    
    subplot(2,2,4);
    plot(x4, 'blue', 'LineWidth', 2);
    title('Length of 7');
    xlabel('Index (n)');
    ylabel('Magnitude: 3n+1');
end

function Q3_threenplus1(length)

y = 1; %first value is 1
for jj = 2:length %starts at 2 because we already set first value 'y' to 1
    n = 1; %counter 
    while (jj ~= 1) %loop until 3n + 1 sequence reaches 1
        if mod(jj,2)==0
            jj = jj/2;
        else
            jj = 3*jj+1;
        end
        n = n + 1; %increment counter
    end
    y = [y n]; %concatenate 'y' and 'counter'

end

figure(1);
plot(y, 'blue', 'LineWidth', 1);
title('Values of 3n+1 through 1000 Iterations');
end

function trinum = trinums(m)
    n = 1; %so start at index 1
    
    while(n^2 + n - 2*m <= 0) %condition given by problem
        n = n + 1;
    end
    
    v = 1:n;
    trinum = v.*(v+1)/2;
end

function Q5(n)
    A = 1;
    for jj = 2:n
        A(jj,jj) = 0; %create new row and col based on 'jj'
        A(:,jj) = jj; %set that row to all 'jj'
        A(jj,:) = jj; %set col to all 'jj'
    end
    A = A.^2 %vectorized multiply for getting jj^2
    %A(:,1:2:n)
    %A
end

function S = spiral(n,c)
%SPIRAL SPIRAL(n) is an n-by-n matrix with elements
%1:n^2 arranged in a rectangular spiral pattern.
    S = [];
    for m = 1:n
        S = rot90(S,2);
        S(m,m) = 0;
        p = m^2 - m + c;
        v = (m-1:-1:0);
        S(:,m) = p-v';
        S(m,:) = p+v;
    end
    if mod(n,2)==1
        S = rot90(S,2);
    end
    %r1 = S(n+1,1:n-2)
    %r2 = S(n-1,n+2:end)
end




