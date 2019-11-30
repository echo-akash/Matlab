m = [0 1 0 1 1 0 1 1];
n = length(m);
x = [];
y = [];
cur_lvl=0;
last_non_zero_lvl=-1;
for i=1:n
    x=[x i-1 i];
    if(m(i)==0)
        y=[y cur_lvl cur_lvl];
    else
        if(cur_lvl~=0)
            y=[y 0 0];
            cur_lvl=0;
        else
            y=[y -last_non_zero_lvl -last_non_zero_lvl];
            last_non_zero_lvl = last_non_zero_lvl*(-1);
            cur_lvl = last_non_zero_lvl;
        end
    end
end

plot(x,y),axis([0,n,-2,2]);
title('MLT-3');
