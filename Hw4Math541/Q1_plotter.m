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

