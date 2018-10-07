f=1;
t=[];
w=[];
load in1.txt
x=in1;
y=length(x);
for i=1:y
    t=[t i-1 i-.5 i-.5 i];
    if x(i)==0
        w=[w -1 -1 0 0];
    else
        w=[w 1 1 0 0];
    end
end
plot(t,w),axis([0,y,-2,2])
