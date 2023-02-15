function [coef_sort, name_sort] = bubblesort(coef, name)
    len = length(coef);
    for i=1:1:len
        for j=1:1:len-i
           if coef(j)<coef(j+1)
               t = coef(j+1); coef(j+1) = coef(j); coef(j) = t;
               tt = name{j+1}; name{j+1} = name{j}; name{j} = tt;             
           end
        end
    end
    coef_sort = coef;
    name_sort = name;
end