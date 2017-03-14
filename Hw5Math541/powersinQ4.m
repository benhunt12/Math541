function powersinQ4(x)
    % POWERSIN. Power series for sin(x).
    % POWERSIN(x) tries to compute sin(x)
    % from a power series
    s = 0;
    t = x;
    n = 1;
    count = 0; %counts the number of times throught the loop
    max = t; % hold the max term value
    while s+t ~= s;
        s = s + t;
        if (t > max) %if the current term is bigger than the current max
            max = t; % set that t value to max
        end
        t = -x.^2/((n+1)*(n+2)).*t;
        n = n + 2;
        count = count + 1;
    end
    
    s1 = sin(x); %calculate matlab function sin(x)
    error = (abs((s-s1)/s1))*100; %find error between sin(x) and powersin(x)
    count; %display the counter
    max; %display the max value
    fprintf('sin(x): %i, powersin(x): %i, Error: %i, Count: %i, Max: %i \n\n', s1, s, error, count, max);
end
