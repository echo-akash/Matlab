load in3.txt
m=in3;
n=length(m);

x=[];
y=[];

for i=1:n
    
    x=[x i-1  i];
    if(m(i)==0)
        y=[y 1 1];       
    else    
        y=[y -1 -1];      
    end
end

plot(x,y),axis([0,n,-3,3])
