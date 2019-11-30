m = [0 1 0 0 1 0];
n = length(m);
x = [];
y = [];
a=1;
for i=1:n
    x=[x i-1 i];
    if(m(i)== 0)
        y=[y a a];
        a=a*(-1);
    else
        y=[y 0 0];
    end
end

plot(x,y),axis([0,n,-2,2]);
title('Bipolar Pseudoternary / opposite of AMI');
