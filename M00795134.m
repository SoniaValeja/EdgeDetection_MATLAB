function varargout = M00795134(varargin)
% M00795134 MATLAB code for M00795134.fig
%      M00795134, by itself, creates a new M00795134 or raises the existing
%      singleton*.
%
%      H = M00795134 returns the handle to a new M00795134 or the handle to
%      the existing singleton*.
%
%      M00795134('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M00795134.M with the given input arguments.
%
%      M00795134('Property','Value',...) creates a new M00795134 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M00795134_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M00795134_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M00795134

% Last Modified by GUIDE v2.5 14-Mar-2021 16:32:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M00795134_OpeningFcn, ...
                   'gui_OutputFcn',  @M00795134_OutputFcn, ...
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


% --- Executes just before M00795134 is made visible.
function M00795134_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M00795134 (see VARARGIN)

% Choose default command line output for M00795134
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M00795134 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M00795134_OutputFcn(hObject, eventdata, handles) 
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
axes(handles.axes3);

global loc
global gry;
global a;
[file,path] = uigetfile('{*.jpg;*.png;*.tif;*.jpeg;*.bmp;*.JPG;*.PNG;*.TIF;*.JPEG;*.BMP}','Please select the image');
loc = strcat(path,file);
a=imread(loc);
imshow(a);
gry=rgb2gray(a);
set(handles.text8, 'String', 'Uploaded Image');

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
str = get(hObject,'String');
val = get(hObject,'Value');


axes(handles.axes5);
switch str{val}
    case 'Sobel'
        global loc;
        global gry;
        sobl= edge(gry,'Sobel');
        imshow(sobl);
        set(handles.text4, 'String', 'Sobel (Inbuilt Edge Detection)');
        impixelregion;
    case 'Prewitt'
        global loc;
        global gry;
        pw= edge(gry,'Prewitt');
        imshow(pw); 
        set(handles.text4, 'String', 'Prewitt (Inbuilt Edge Detection)');
        impixelregion;
    case 'Canny'
        global loc;
        global gry;
        cny= edge(gry,'Canny');
        imshow(cny);   
        set(handles.text4, 'String', 'Canny (Inbuilt Edge Detection)');
        impixelregion;

    case 'Zerocross'
        global loc;
        global gry;
        zc= edge(gry,'zerocross');
        imshow(zc);      
        set(handles.text4, 'String', 'Zerocross (Inbuilt Edge Detection)');
        impixelregion;
     
     case 'Log'
        global loc;
        global gry;
        lg= edge(gry,'Log');
        imshow(lg); 
        set(handles.text4, 'String', 'Log (Inbuilt Edge Detection)');
        impixelregion;
        
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text4.
function text4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
str = get(hObject,'String');
val = get(hObject,'Value');


axes(handles.axes6);
switch str{val}
    case 'CreateBlueImage'
        global gry;
        imshow(gry, 'ColorMap', [1 1 1;0 0 0.9]);
        set(handles.text6, 'String', 'Blue (Custom Edge Detection)');
        impixelregion;
        
    case 'CreateGreenImage'
        global gry;
        imshow(gry, 'ColorMap', [1 1 1;0 0.5 0]);
        set(handles.text6, 'String', 'Green (Custom Edge Detection)');
        impixelregion;
        
    case 'CreateRedImage'
          global gry;
        imshow(gry, 'ColorMap', [1 1 1;0.9 0 0]);
        set(handles.text6, 'String', 'Red (Custom Edge Detection)');
        impixelregion;
        
    case 'MyOwnPrewitt'
        global a;
        wx=[1 0 -1;1 0 -1;1 0 -1];
        wy=[1 1 1 ;0 0 0 ;-1 -1 -1];
        [row col dim]=size(a);
        
        for x=2:1:row-1
            for y=2:1:col-1
                for z=2:1:dim - 1
                    ax(x,y)=abs(wx(9)*a(x-1,y-1,z-1)+wx(8)*a(x+1,y,z+1)+wx(7)*a(x,y-1,z+1));
                    ay(x,y)=abs(wy(1)*a(x-1,y-1,z-1)+wy(2)*a(x+1,y,z+1)+wy(3)*a(x,y-1,z));
                end    
            end
        end
        res=ax+ay;
        imshow(res);
        set(handles.text6, 'String', 'My Own Approach For Prewitt');
        impixelregion;   
   case 'MyOwnSobel'
          global gry;
         hx=[-1,-5,-1; 0,0,0;1,8,1];
         img1= conv2(gry,hx);
         
         hy=[1,0,-1; -5,0,8;-1,0,1];
         img2= conv2(img1,hy);
         imshow(img2);
        set(handles.text6, 'String', 'My Own Approach For Sobel');
        impixelregion;
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5


% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
img = imread('peppers.png');
subplot(1,2,1),imshow(img);
title('Actual Image');

im_edge=ones(1,1);
[row, col,dim] = size(img);
for i = 1: row-1
    for j = 1: col-1
            if (img(i,j,1)>85 && img(i,j,2)>85) && (abs(img(i,j,1)-img(i,j,2))<255)
                im_edge(i,j,:) = img(i,j,1);
                
            end
        
    end
end
subplot(1,2,2),imshow(uint8(im_edge));
title('Threshold 85 to 255 is removing the RED color portion');
