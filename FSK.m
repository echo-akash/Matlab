%FSK (Frequency Shift Keying - Digital to Analog Conversion)
%input file(in.txt) contains 1 0 1 1 0

load in.txt;
m=in;
n=length(m);

x=[];
y=[];
en=[];
t=[];
f=-1;

for i=1:n
   t=[t i-1 i];
   if m(i)==1
       x=[x 1 1];
   else
       x=[x 0 0];
   end
end

A=5;
fc=20;
time = 0:0.001:1;
Sc=A.*sin(2*pi*fc.*time);


fc1=40;
time = 0:0.001:1;
Sc1=A.*sin(2*pi*fc1.*time);

for i=1:n
    for j=((i-1)*200)+1:(i*200)
        if m(i)==1
           y(j)=Sc(j); 
        else
           y(j)=Sc1(j);
        end
    end
end

subplot(4,1,1);
plot(t,x),axis([0,n,-2,+2]);
subplot(4,1,2);
plot(time,Sc),axis([0,1,-2,+2]);
subplot(4,1,3);
plot(time,Sc1),axis([0,1,-2,+2]);
subplot(4,1,4);
plot(y)

