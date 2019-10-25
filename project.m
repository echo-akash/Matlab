function varargout = project(varargin)
% PROJECT MATLAB code for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 20-Oct-2018 01:53:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im I I1
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im=imread(path);
I=im
im=im2double(im); %converts to double
I1=im; %for backup process :)
axes(handles.axes1);
imshow(I);

I=rgb2gray(I);
axes(handles.axes1);

I2=thresholding(I);
%imshow(I2);

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
k=regionprops(I2,'Area','Perimeter','MajorAxisLength','MinorAxisLength','Eccentricity','EquivDiameter','Solidity','Orientation','Extent','EulerNumber');
    
for i=1:n
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
%csvwrite('csvlist1.csv',data,0,0);
data(1,1)=mean(majoraxis)/mean(minoraxis)
data(1,2)=mean(orientation)
data(1,3)=mean(equivdiameter)
data(1,4)=mean(eccentricity)
data(1,5)=mean(solidity)
data(1,6)=mean(extent)
data(1,7)=(4*3.1416*mean(Area))/(mean(perimeter)*mean(perimeter));
data(1,8)=(mean(perimeter)*mean(perimeter))/mean(Area)
data(1,9)=mean(eulernumber)

csvwrite('csvlist1.csv',data,1,0);

 %a='healthy applei'




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%a='healthy applei'
global aii;

filename = 'csvlist2000.csv';
M = csvread(filename);

filename = 'csvlist1.csv';
data = csvread(filename)
data(2,1)

M(2,:)
r=length(M(:,1))
f=0
s=0
t=0
si=0
fr=0
fi=0
se=0
ei=0
ni=0
for i=1:r
    
    if(M(i,1)==data(2,1))
        f=f+1
    end
    if(M(i,2)==data(2,2))
            s=s+1
    end
    if(M(i,3)==data(2,3))
        t=t+1
    end
    if(M(i,4)==data(2,4))
        fr=fr+1
    end
    
     if(M(i,5)==data(2,5))
        fi=fi+1
     end
     if(M(i,6)==data(2,6))
        si=si+1
     end
     if(M(i,7)==data(2,7))
        se=se+1
     end
     if(M(i,8)==data(2,8))
        ei=ei+1
     end
     if(M(i,9)==data(2,9))
        ni=ni+1
    end
end


filename = 'csvlist3000.csv';
M = csvread(filename);
M(2,:)
rt=length(M(:,1))
ft=0
st=0
tt=0
frt=0
fit=0
sit=0
seti=0
eit=0
nit=0
for i=1:rt
    
    if(M(i,1)==data(2,1))
        ft=ft+1
    end
    if(M(i,2)==data(2,2))
            st=st+1
    end
    if(M(i,3)==data(2,3))
        tt=tt+1
    end
    if(M(i,4)==data(2,4))
        frt=frt+1
    end
    
    if(M(i,5)==data(2,5))
        fit=fit+1
    end
    if(M(i,6)==data(2,6))
        sit=sit+1
    end
    if(M(i,7)==data(2,7))
        seti=seti+1
    end
    if(M(i,8)==data(2,8))
        eit=eit+1
    end
    if(M(i,9)==data(2,9))
        nit=nit+1
    end
end

p1=(f/r)*(s/r)*(t/r)*(fr/r)*(fi/r)*(si/r)*(se/r)*(ei/r)*(ni/r)
p2=(ft/rt)*(st/rt)*(tt/rt)*(frt/rt)*(fit/rt)*(sit/rt)*(seti/rt)*(eit/rt)*(nit/rt)


filename = 'csvlist35.csv';
M = csvread(filename);
M(2,:)
rtt=length(M(:,1))
ft=0
st=0
tt=0
frt=0
fit=0
sit=0
seti=0
eit=0
nit=0
for i=1:rt
    
    if(M(i,1)==data(2,1))
        ft=ft+1
    end
    if(M(i,2)==data(2,2))
            st=st+1
    end
    if(M(i,3)==data(2,3))
        tt=tt+1
    end
    if(M(i,4)==data(2,4))
        frt=frt+1
    end
    
    if(M(i,5)==data(2,5))
        fit=fit+1
    end
    if(M(i,6)==data(2,6))
        sit=sit+1
    end
    if(M(i,7)==data(2,7))
        seti=seti+1
    end
    if(M(i,8)==data(2,8))
        eit=eit+1
    end
    if(M(i,9)==data(2,9))
        nit=nit+1
    end
end


p3=(ft/rtt)*(st/rtt)*(tt/rtt)*(frt/rtt)*(fit/rtt)*(sit/rtt)*(seti/rtt)*(eit/rtt)*(nit/rtt)



filename = 'csvlist100.csv';
M = csvread(filename);
M(2,:)
rttt=length(M(:,1))
ft=0
st=0
tt=0
frt=0
fit=0
sit=0
seti=0
eit=0
nit=0
for i=1:rt
    
    if(M(i,1)==data(2,1))
        ft=ft+1
    end
    if(M(i,2)==data(2,2))
            st=st+1
    end
    if(M(i,3)==data(2,3))
        tt=tt+1
    end
    if(M(i,4)==data(2,4))
        frt=frt+1
    end
    
    if(M(i,5)==data(2,5))
        fit=fit+1
    end
    if(M(i,6)==data(2,6))
        sit=sit+1
    end
    if(M(i,7)==data(2,7))
        seti=seti+1
    end
    if(M(i,8)==data(2,8))
        eit=eit+1
    end
    if(M(i,9)==data(2,9))
        nit=nit+1
    end
end



p4=(ft/rttt)*(st/rttt)*(tt/rttt)*(frt/rttt)*(fit/rttt)*(sit/rttt)*(seti/rttt)*(eit/rttt)*(nit/rttt)



filename = 'csvlist200.csv';
M = csvread(filename);
M(2,:)
rtttt=length(M(:,1))
ft=0
st=0
tt=0
frt=0
fit=0
sit=0
seti=0
eit=0
nit=0
for i=1:rt
    
    if(M(i,1)==data(2,1))
        ft=ft+1
    end
    if(M(i,2)==data(2,2))
            st=st+1
    end
    if(M(i,3)==data(2,3))
        tt=tt+1
    end
    if(M(i,4)==data(2,4))
        frt=frt+1
    end
    
    if(M(i,5)==data(2,5))
        fit=fit+1
    end
    if(M(i,6)==data(2,6))
        sit=sit+1
    end
    if(M(i,7)==data(2,7))
        seti=seti+1
    end
    if(M(i,8)==data(2,8))
        eit=eit+1
    end
    if(M(i,9)==data(2,9))
        nit=nit+1
    end
end



p5=(ft/rtttt)*(st/rtttt)*(tt/rtttt)*(frt/rtttt)*(fit/rtttt)*(sit/rtttt)*(seti/rtttt)*(eit/rtttt)*(nit/rtttt)



filename = 'csvlist250.csv';
M = csvread(filename);
M(2,:)
rttttt=length(M(:,1))
ft=0
st=0
tt=0
frt=0
fit=0
sit=0
seti=0
eit=0
nit=0
for i=1:rt
    
    if(M(i,1)==data(2,1))
        ft=ft+1
    end
    if(M(i,2)==data(2,2))
            st=st+1
    end
    if(M(i,3)==data(2,3))
        tt=tt+1
    end
    if(M(i,4)==data(2,4))
        frt=frt+1
    end
    
    if(M(i,5)==data(2,5))
        fit=fit+1
    end
    if(M(i,6)==data(2,6))
        sit=sit+1
    end
    if(M(i,7)==data(2,7))
        seti=seti+1
    end
    if(M(i,8)==data(2,8))
        eit=eit+1
    end
    if(M(i,9)==data(2,9))
        nit=nit+1
    end
end



p6=(ft/rttttt)*(st/rttttt)*(tt/rttttt)*(frt/rttttt)*(fit/rttttt)*(sit/rttttt)*(seti/rttttt)*(eit/rttttt)*(nit/rttttt)

p1
p2
p3
p4
p5
p6
r
rt
rtt
rttt
rtttt
rttttt


p1=p1*(r/r+rt+rtt+rttt+rtttt+rttttt)
p2=p2*(rt/r+rt+rtt+rttt+rtttt+rttttt)
p3=p3*(rtt/r+rt+rtt+rttt+rtttt+rttttt)
p4=p4*(rttt/r+rt+rtt+rttt+rtttt+rttttt)
p5=p5*(rtttt/r+rt+rtt+rttt+rtttt+rttttt)
p6=p6*(rttttt/r+rt+rtt+rttt+rtttt+rttttt)

a=[p1 p2 p3 p4 p5 p6]
j=max(a)
r
rt
 
if(j==p1)
      %fprintf('healthy apple')
     % aii='healthy apple'
      aii='Leg without pvd'

      
elseif(j==p2)
      %fprintf('apple with scab')
       %aii='apple with scab'
       aii='Leg with pvd'
elseif(j==p3)
    
       %fprintf('Cherry with Powdery_mildew')
        %aii='Cherry with Powdery_mildew'
        aii='Can not recognize image'
elseif(j==p5)
    
       %fprintf('Cherry with Powdery_mildew')
       aii='Can not recognize image'
        %aii='Potato with late_blight'
      
elseif(j==p6)
    
       %fprintf('Cherry with Powdery_mildew')
        %aii='healthy potato '
        aii='Can not recognize image'
else
       %fprintf('helathy cherry')
         %aii='helathy cherry'
         aii='Can not recognize image'
end
 set(handles.edit1,'string',aii)

 %set(hObject,'String',aii);
   



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global aii;
%set(hObject,'String',aii);


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
