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

