function Q3_threenplus1(length)

y = 1; %first value is 1
for jj = 2:length %starts at 2 because we already set 'y' to 1
    n = 1; %counter 
    while (jj ~= 1) %loop until 3n + 1 sequence reaches 1
        if mod(jj,2)==0
            jj = jj/2;
        else
            jj = 3*jj+1;
        end
        n = n + 1; %increment counter
    end
    y = [y n]; %concatonate 'y' and 'counter'

end

figure(1);
plot(y, 'blue', 'LineWidth', 1);
title('Values of 3n+1 through 1000 Iterations');
end
