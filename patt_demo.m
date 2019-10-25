% n=1.75;
% y1=n:-0.25:1;
% y2=n:-0.25:1.25;
% y3=n:-0.25:1.50;
% y4=n:-0.25:1.75;
% 
% x=1:0.25:n;
% 
% plot(x(1),y1,'*',x(2),y2,'*',x(3),y3,'*',x(4),y4,'*')

load in.txt;
m=in;
n=length(m);

x=[];
y=[];
cur=0;
f=-1;

for i=1:n
    x=[x i-1 i];
    if(m(i)==0)
        y=[y cur cur];
    elseif(m(i)==1 && cur~=0)
        cur=0;
        y=[y cur cur];
    elseif(m(i)==1 && cur==0)
        f=f*-1;
        cur=f;
        y=[y cur cur];
    end
    
end

plot(x,y),axis([0,n,-2,2])
title('MLT-3');
xlabel('Time');
ylabel('value');
