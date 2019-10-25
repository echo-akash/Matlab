clc;
close all;
clear all;
I=imread('2.JPG');
imshow(I);

I=rgb2gray(I);
%imshow(I);
I2=thresholding(I);
cc=bwconncomp(I2,8);
n=cc.NumObjects;
Area=zeros(n,1);
perimeter=zeros(n,1);
majoraxis=zeros(n,1);
minoraxis=zeros(n,1);
eccentricity=zeros(n,1);
equivdiameter=zeros(n,1);
solidity=zeros(n,1);
orientation=zeros(n,1);
extent=zeros(n,1);
eulernumber=zeros(n,1);

%k=regionprops(I2,'Area','Perimeter','MajorAxisLength','MinorAxisLength');
k=regionprops(cc,'Area','Perimeter','MajorAxisLength','MinorAxisLength','Eccentricity','EquivDiameter','Solidity','Orientation','Extent','EulerNumber');
    
for i=1:n
    grain=false(size(I2));
    grain(cc.PixelIdxList{i})=true;
   % figure(i);
    %imageshow(grain);
    %imshow(grain);
    Area(i)=k(i).Area;
    perimeter(i)=k(i).Perimeter;
    majoraxis(i)=k(i).MajorAxisLength;
    minoraxis(i)=k(i).MinorAxisLength;
    eccentricity(i)=k(i).Eccentricity;
    equivdiameter(i)=k(i).EquivDiameter;
    solidity(i)=k(i).Solidity;
    orientation(i)=k(i).Orientation;
    extent(i)=k(i).Extent;
    eulernumber(i)=k(i).EulerNumber;
    
end
%data(1,1)=mean(Area)
%data(1,2)=mean(perimeter)
%data(1,3)=mean(majoraxis)
%data(1,4)=mean(minoraxis)
data(1,1)=mean(majoraxis)/mean(minoraxis)
data(1,2)=mean(orientation)
data(1,3)=mean(equivdiameter)
data(1,4)=mean(eccentricity)
data(1,5)=mean(solidity)
data(1,6)=mean(extent)
data(1,7)=(4*3.1416*mean(Area))/(mean(perimeter)*mean(perimeter));
data(1,8)=(mean(perimeter)*mean(perimeter))/mean(Area)
data(1,9)=mean(eulernumber)

csvwrite('csvlist123.csv',data,1,0);
Area(1)
n

%imshow(I2);