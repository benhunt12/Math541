function phi_plotter()

    %plot
    ten = phi_fib(3,-1/2,2,1,10);
    
    subplot(2,2,1);
    semilogy(abs(ten),'LineWidth',2,'Color','blue');
    xlabel('Count (N)');
    ylabel('Value at Index "N"');
    title('N = 10');
    
    twenty = phi_fib(3,-1/2,2,1,20);
    subplot(2,2,2);
    semilogy(abs(twenty),'LineWidth',2,'Color','blue');
    xlabel('Count (N)');
    ylabel('Value at Index "N"');
    title('N = 20');
    
    thirty = phi_fib(3,-1/2,2,1,30);
    subplot(2,2,3);
    semilogy(abs(thirty),'LineWidth',2,'Color','blue');
    xlabel('Count (N)');
    ylabel('Value at Index "N"');
    title('N = 30');
    
    fourty = phi_fib(3,-1/2,2,1,40);
    subplot(2,2,4);
    semilogy(abs(fourty),'LineWidth',2,'Color','blue');
    xlabel('Count (N)');
    ylabel('Value at Index "N"');
    title('N = 40');
    
    

end

