function result = dominance_relation(a,b)
% If a dominates b, then result is -1;
% If a and b are nondominated vectors, then result is 0;
% If a is dominated by b, then result is +1;

m = length(a);

if sum(a==b)==m
    result = 0;
else
    t = a<=b;
    if sum(t)==m
        result = -1;
    elseif sum(t)==0
        result = +1;
    else
        result = 0;
    end
end
