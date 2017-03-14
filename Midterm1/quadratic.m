function quadratic(a, b, c)
    classic1 = (-b+sqrt(b^2-4*a*c))/(2*a); %quadratic formula, '+' root
    classic2 = (-b-sqrt(b^2-4*a*c))/(2*a); %quadratic formula, '-' root
    
    new1 = (2*c)/(-b - sqrt(b^2-4*a*c));
    new2 = (2*c)/(-b + sqrt(b^2-4*a*c));
    
    return1 = 0;
    return2 = 0;
    
    if(b > 0 && b^2 - 4*a*c > 10^6)
        return1 = new1;
        return2 = classic2;
        elseif(b < 0 && b^2 - 4*a*c < -10^6)
            return1 = classic1;
            return2 = new2;
    else
        return1 = classic1;
        return2 = classic2;
    end
 
    rvals = roots([a b c]); %quadratic formula using 'roots' funciton
    
%     %comparing 'roots' and 'r1'
%     error1 = (abs((new1-classic1)/classic1))*100;
%     fprintf('Root(1) = %i, Custom(r1) = %i, Percent Error = %i\n', new2, classic1, error1);
%     
%    
%     %comparing 'roots' and 'r2'
%     error2 = (abs((new2-classic2)/classic2))*100;
%     fprintf('Root(2) = %i, Custom(r2) = %i, Percent Error = %i\n\n', new1, classic2, error2);
      fprintf('Root1 = %i, Root2 = %i\n\n', return1, return2);
      fprintf('Correct1 = %i, Correct2 = %i\n\n', rvals(1), rvals(2));
end

