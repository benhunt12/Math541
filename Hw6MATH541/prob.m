function answer = prob()
    tol = 0.001;
    upper = 50 + tol;
    lower = 50 - tol;
    for p = 0 : 0.000001 : 100
        P = (((1+p)/2)*(p/(1-p+p^2))^21)*100;
        if (P > lower && P < upper)
            answer = p * 100;
            return;
        end
    end
   
    %.842305
end

