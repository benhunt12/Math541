function decimal = char_to_dec(binary)
    decimal = 0; %total decimal number
    term = 0; %term to be added to total through each iteration
    for jj=1:length(binary) %starts at one, goes until the end of the input array
        term = 2^(length(binary)-jj)*binary(jj); %formula
        decimal = decimal + term; %add term to total
    end
    decimal = decimal - 1023; %subratct 1023 by the formula
end

