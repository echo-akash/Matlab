m = [0 1 0 0 1 1];
n = length(m);
x = [];
y = [];
a = 1;
for i=1:n
    x=[x i-1 i-1+0.5 i-1+0.5 i];
    if(m(i)==0)
        y=[y -a -a a a];
    else
        y=[y a a -a -a];
    end
    a=y(length(y));
end

plot(x,y),axis([0,n,-2,2]);
title('Differential Manchester');
