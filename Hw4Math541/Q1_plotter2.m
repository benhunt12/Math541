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

