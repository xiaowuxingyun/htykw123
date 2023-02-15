function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 13-Jan-2022 16:33:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% add path
addpath Spatial_trans
addpath spatial_filter\smooth
addpath spatial_filter\sharpen
addpath normalFun
addpath Histogram_retrieval
addpath zhifangtu
addpath freq_trans

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.bmp');
if ~(isequal(file,0))
   set(handles.edit1,'String',fullfile(path,file) );
else
    return;
end
img = my_BMPread([path file]);
my_imshow(img,handles.axes1);
title('原图'); 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, ~, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return;
end
[filename,pathname,~]=uiputfile({'*.bmp'},'save picture as');
if ~filename
    return
else
    file=strcat(pathname,filename);
    set(handles.edit2,'String',file);
    imwrite(img,file,'bmp');
end


function edit1_Callback(~, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(~, ~, ~)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, ~, ~)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(~, ~, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Gray,'visible','on');
set(handles.text_Gray,'visible','on');
set(handles.X,'visible','on');
set(handles.text_X,'visible','on');
set(handles.Y,'visible','on');
set(handles.text_Y,'visible','on');
set(handles.R,'visible','on');
set(handles.text_R,'visible','on');
set(handles.G,'visible','on');
set(handles.text_G,'visible','on');
set(handles.B,'visible','on');
set(handles.text_B,'visible','on');

a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
    axes(handles.axes1);
elseif a==2
    img = handles.axes2.UserData;
    axes(handles.axes2);
elseif a==3
    img = handles.axes3.UserData;
    axes(handles.axes3);
elseif a==4
    img = handles.axes4.UserData;
    axes(handles.axes4);
else
    set(handles.Gray,'visible','off');
    set(handles.text_Gray,'visible','off');
    set(handles.X,'visible','off');
    set(handles.text_X,'visible','off');
    set(handles.Y,'visible','off');
    set(handles.text_Y,'visible','off');
    set(handles.R,'visible','off');
    set(handles.text_R,'visible','off');
    set(handles.G,'visible','off');
    set(handles.text_G,'visible','off');
    set(handles.B,'visible','off');
    set(handles.text_B,'visible','off');
    return
end
z = size(img,3);
try
    while 1
        [y0,x0]=ginput(1);
        y0=round(y0);
        x0=round(x0);
        set(handles.text_X,'string',y0)
        set(handles.text_Y,'string',x0)
        impixel = img(x0,y0,:);
        if z==1
            set(handles.text_Gray,'string',impixel);
            set(handles.text_R,'string',0);
            set(handles.text_G,'string',0);
            set(handles.text_B,'string',0);
        else
            set(handles.text_Gray,'string',0);
            set(handles.text_R,'string',impixel(1));
            set(handles.text_G,'string',impixel(2));
            set(handles.text_B,'string',impixel(3));
        end
    end
catch 
end
set(handles.Gray,'visible','off');
set(handles.text_Gray,'visible','off');
set(handles.X,'visible','off');
set(handles.text_X,'visible','off');
set(handles.Y,'visible','off');
set(handles.text_Y,'visible','off');
set(handles.R,'visible','off');
set(handles.text_R,'visible','off');
set(handles.G,'visible','off');
set(handles.text_G,'visible','off');
set(handles.B,'visible','off');
set(handles.text_B,'visible','off');




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(~, ~, ~)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear;close all;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(~, ~, ~)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, ~, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
if a==1
    set(handles.radiobutton2,'Value',0);
    set(handles.radiobutton3,'Value',0);
    set(handles.radiobutton4,'Value',0);
    handles.uipanel1.UserData = 1;
else
    handles.uipanel1.UserData = 0;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, ~, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
if a==1
    set(handles.radiobutton1,'Value',0);
    set(handles.radiobutton3,'Value',0);
    set(handles.radiobutton4,'Value',0);
    handles.uipanel1.UserData = 2;
else
    handles.uipanel1.UserData = 0;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, ~, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
if a==1
    set(handles.radiobutton1,'Value',0);
    set(handles.radiobutton2,'Value',0);
    set(handles.radiobutton4,'Value',0);
    handles.uipanel1.UserData = 3;
else
    handles.uipanel1.UserData = 0;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, ~, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
if a==1
    set(handles.radiobutton1,'Value',0);
    set(handles.radiobutton2,'Value',0);
    set(handles.radiobutton3,'Value',0);
    handles.uipanel1.UserData = 4;
else
    handles.uipanel1.UserData = 0;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --------------------------------------------------------------------
function jihe_Callback(~, ~, ~)
% hObject    handle to jihe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function jingxinag_Callback(~, ~, ~)
% hObject    handle to jingxinag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function pingyi_Callback(~, ~, handles)
% hObject    handle to pingyi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 1;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.pingyi.UserData = hd;
img = hd.UserData;
my_imshow(img,handles.axes4);
[R,C] = size(img,1,2);
set(handles.slider3,'Min',-C);
set(handles.slider3,'Max',C);
set(handles.slider3,'value',0);
set(handles.text31,'string',num2str(0));
set(handles.slider4,'Min',-R);
set(handles.slider4,'Max',R);
set(handles.slider4,'value',0);
set(handles.text30,'string',num2str(0));


% --------------------------------------------------------------------
function jianqie_Callback(~, ~, handles)
% hObject    handle to jianqie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
img_out = img_cut(hd);
my_imshow(img_out,handles.axes4);

% --------------------------------------------------------------------
function xuanzhuan_Callback(~, ~, ~)
% hObject    handle to xuanzhuan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function suofang_Callback(~, ~, ~)
% hObject    handle to suofang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function suofang1_Callback(~, ~, handles)
% hObject    handle to suofang1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 4;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.suofang.UserData = hd;
img = hd.UserData;
my_imshow(img,handles.axes4);
warndlg('下方滑块为横向缩放倍数，右侧为纵向缩放倍数！','提示','modal'); 
set(handles.slider3,'Min',0.1);
set(handles.slider3,'Max',5);
set(handles.slider3,'value',1);
set(handles.text31,'string',num2str(1));
set(handles.slider4,'Min',0.1);
set(handles.slider4,'Max',5);
set(handles.slider4,'value',1);
set(handles.text30,'string',num2str(1));

% --------------------------------------------------------------------
function suofang2_Callback(~, ~, handles)
% hObject    handle to suofang2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 5;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.suofang.UserData = hd;
img = hd.UserData;
my_imshow(img,handles.axes4);
warndlg('下方滑块为横向缩放倍数，右侧为纵向缩放倍数！','提示','modal'); 
set(handles.slider3,'Min',0.1);
set(handles.slider3,'Max',5);
set(handles.slider3,'value',1);
set(handles.text31,'string',num2str(1));
set(handles.slider4,'Min',0.1);
set(handles.slider4,'Max',5);
set(handles.slider4,'value',1);
set(handles.text30,'string',num2str(1));

% --------------------------------------------------------------------
function xuanzhuan1_Callback(~, ~, handles)
% hObject    handle to xuanzhuan1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 2;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.xuanzhuan.UserData = hd;
img = hd.UserData;
my_imshow(img,handles.axes4);
warndlg('两个滑块数值为旋转度数，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',-180);
set(handles.slider3,'Max',180);
set(handles.slider3,'value',0);
set(handles.text31,'string',num2str(0));
set(handles.slider4,'Min',-180);
set(handles.slider4,'Max',180);
set(handles.slider4,'value',0);
set(handles.text30,'string',num2str(0));


% --------------------------------------------------------------------
function xuanzhuan2_Callback(~, ~, handles)
% hObject    handle to xuanzhuan2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 3;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.xuanzhuan.UserData = hd;
img = hd.UserData;
my_imshow(img,handles.axes4);
warndlg('两个滑块数值为旋转度数，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',-180);
set(handles.slider3,'Max',180);
set(handles.slider3,'value',0);
set(handles.text31,'string',num2str(0));
set(handles.slider4,'Min',-180);
set(handles.slider4,'Max',180);
set(handles.slider4,'value',0);
set(handles.text30,'string',num2str(0));


% --------------------------------------------------------------------
function jingxiang1_Callback(~, ~, handles)
% hObject    handle to jingxiang1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = img_mirror(img,1);
my_imshow(imgout,handles.axes4);


% --------------------------------------------------------------------
function jingxiang2_Callback(~, ~, handles)
% hObject    handle to jingxiang2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = img_mirror(img,2);
my_imshow(imgout,handles.axes4);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(~, ~, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = handles.uipanel1.UserData;
if b==1
    img = handles.axes1.UserData;
elseif b==2
    img = handles.axes2.UserData;
elseif b==3
    img = handles.axes3.UserData;
elseif b==4
    img = handles.axes4.UserData;
else
    return;
end
a = handles.pushbutton6.UserData;
if a==1
    imgout = rgb_2_gray(img,1);
    my_imshow(imgout,handles.axes2);
elseif a==2
    imgout = rgb_2_gray(img,2);
    my_imshow(imgout,handles.axes2);
elseif a==3
    imgout = rgb_2_gray(img,3);
    my_imshow(imgout,handles.axes2);
elseif a==4
    imgout = rgb_2_gray(img,4);
    my_imshow(imgout,handles.axes2);
else
    return;
end


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, ~, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
if a==1
    set(handles.radiobutton6,'Value',0);
    set(handles.radiobutton7,'Value',0);
    set(handles.radiobutton8,'Value',0);
    handles.pushbutton6.UserData = 1;
else
    handles.pushbutton6.UserData = 0;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, ~, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
if a==1
    set(handles.radiobutton5,'Value',0);
    set(handles.radiobutton7,'Value',0);
    set(handles.radiobutton8,'Value',0);
    handles.pushbutton6.UserData = 2;
else
    handles.pushbutton6.UserData = 0;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, ~, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
if a==1
    set(handles.radiobutton5,'Value',0);
    set(handles.radiobutton6,'Value',0);
    set(handles.radiobutton8,'Value',0);
    handles.pushbutton6.UserData = 3;
else
    handles.pushbutton6.UserData = 0;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, ~, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
if a==1
    set(handles.radiobutton5,'Value',0);
    set(handles.radiobutton6,'Value',0);
    set(handles.radiobutton7,'Value',0);
    handles.pushbutton6.UserData = 4;
else
    handles.pushbutton6.UserData = 0;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(~, ~, ~)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on slider movement.
function slider3_Callback(~, ~, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uslider3 = handles.slider3.UserData;
if uslider3==1
    pingyi1 = handles.pingyi.UserData;
    img = pingyi1.UserData;
    lr = round(get(handles.slider3,'value'));
    ud = round(get(handles.slider4,'value'));
    set(handles.text31,'string',num2str(lr));
    set(handles.text30,'string',num2str(ud));
    imgout = im_translate(img,lr,-ud);
    my_imshow(imgout,handles.axes4);
elseif uslider3==2
    xuanzhuan1 = handles.xuanzhuan.UserData;
    img = xuanzhuan1.UserData;
    theta = get(handles.slider3,'value');
    set(handles.text31,'string',num2str(theta));
    imgout = img_rotate(img,theta,1);
    my_imshow(imgout,handles.axes4);
elseif uslider3==3
    xuanzhuan1 = handles.xuanzhuan.UserData;
    img = xuanzhuan1.UserData;
    theta = get(handles.slider3,'value');
    set(handles.text31,'string',num2str(theta));
    imgout = img_rotate(img,theta,2);
    my_imshow(imgout,handles.axes4);
elseif uslider3==4
    suofang1 = handles.suofang.UserData;
    img = suofang1.UserData;
    c = get(handles.slider3,'value');
    d = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(c));
    set(handles.text30,'string',num2str(d));
    img_out = img_zoom(img, c,d,1);
    my_imshow(img_out,handles.axes4);
elseif uslider3==5
    suofang1 = handles.suofang.UserData;
    img = suofang1.UserData;
    c = get(handles.slider3,'value');
    d = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(c));
    set(handles.text30,'string',num2str(d));
    img_out = img_zoom(img, c,d,2);
    my_imshow(img_out,handles.axes4);
elseif uslider3==6
    thrd1 = handles.thrd.UserData;
    img = thrd1.UserData;
    thrd = get(handles.slider3,'value');
    set(handles.text31,'string',num2str(thrd));
    img_out = smooth_thrd(img, thrd);
    my_imshow(img_out,handles.axes4);
elseif uslider3==7
    nthrd1 = handles.nthrd.UserData;
    img = nthrd1.UserData;
    T = get(handles.slider3,'value');
    Y = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(T));
    set(handles.text30,'string',num2str(Y));
    img_out = smooth_NThrd(img, T,Y);
    my_imshow(img_out,handles.axes4);
elseif uslider3==8
    ilp1 = handles.ilp.UserData;
    img = ilp1.UserData;
    d = get(handles.slider3,'value');
    set(handles.text31,'string',num2str(d));
    s=mhfts(fft2(img));
    [a,b]=size(s);
    a0=round(a/2);
    b0=round(b/2);
    for i=1:a
        for j=1:b
            distance=sqrt((i-a0)^2+(j-b0)^2);
            if distance<=d
                h=1;
            else
                h=0;
            end
            s(i,j)=h*s(i,j);
        end
    end
    s=uint8(real(ifft2(ifftshift(s))));
    my_imshow(s,handles.axes4);
elseif uslider3==9
    ihp1 = handles.ihp.UserData;
    img = ihp1.UserData;
    d = get(handles.slider3,'value');
    set(handles.text31,'string',num2str(d));
    s=mhfts(fft2(img));
    [a,b]=size(s);
    a0=round(a/2);
    b0=round(b/2);
    for i=1:a
        for j=1:b
            distance=sqrt((i-a0)^2+(j-b0)^2);
            if distance>=d
                h=1;
            else
                h=0;
            end
            s(i,j)=h*s(i,j);
        end
    end
    s=uint8(real(ifft2(ifftshift(s))));
    my_imshow(s,handles.axes4);
elseif uslider3==10
    blp1 = handles.blp.UserData;
    img = blp1.UserData;
    d0 = get(handles.slider3,'value');
    n = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(d0));
    set(handles.text30,'string',num2str(n));
    f=double(img);%数据类型转换
    g=mhft2(f);%图像傅里叶转换
    g=mhfts(g);%傅里叶变换平移
    [N1,N2]=size(g);%傅里叶变换图像尺寸
    n1=fix(N1/2);%数据圆整
    n2=fix(N2/2);%数据圆整
    result = zeros(N1,N2);
    for i=1:N1%遍历图像像素
        for j=1:N2
            d=sqrt((i-n1)^2+(j-n2)^2);
            if d==0
                h=0;
            else
                h=1/(1+(d/d0)^(2*n));
            end
            result(i,j)=h*g(i,j);%图像矩阵计算处理
        end
    end
    result=ifftshift(result);
    X2=ifft2(result);
    X3=uint8(real(X2));
    my_imshow(X3,handles.axes4);
elseif uslider3==11
    bhp1 = handles.bhp.UserData;
    img = bhp1.UserData;
    d0 = get(handles.slider3,'value');
    n = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(d0));
    set(handles.text30,'string',num2str(n));
    f=double(img);%数据类型转换
    g=mhft2(f);%图像傅里叶转换
    g=mhfts(g);%傅里叶变换平移
    [N1,N2]=size(g);%傅里叶变换图像尺寸
    n1=fix(N1/2);%数据圆整
    n2=fix(N2/2);%数据圆整
    result = zeros(N1,N2);
    for i=1:N1%遍历图像像素
        for j=1:N2
            d=sqrt((i-n1)^2+(j-n2)^2);
            if d==0
                h=0;
            else
                h=1/(1+(d0/d)^(2*n));
            end
            result(i,j)=h*g(i,j);%图像矩阵计算处理
        end
    end
    result=ifftshift(result);
    X2=ifft2(result);
    X3=uint8(real(X2));
    my_imshow(X3,handles.axes4);
elseif uslider3==12
    glp1 = handles.glp.UserData;
    img = glp1.UserData;
    D0 = get(handles.slider3,'value');
    set(handles.text31,'string',num2str(D0));
    [f1,f2]=freqspace(size(img),'meshgrid');
    D=D0/size(img,1);
    r=f1.^2+f2.^2;
    Hd=ones(size(img));
    for i=1:size(img,1)
        for j=1:size(img,2)
            t=r(i,j)/(D*D);
            Hd(i,j)=exp(-t);
        end
    end
    Y=mhft2(double(img));
    Y=mhfts(Y);
    Ya=Y.*Hd;
    Ya=ifftshift(Ya);
    Ia=uint8(real(ifft2(Ya)));
    my_imshow(Ia,handles.axes4);
elseif uslider3==13
    ghp1 = handles.ghp.UserData;
    I = ghp1.UserData;
    d0=get(handles.slider3,'value');
    set(handles.text31,'string',num2str(d0));
    [M ,N]=size(I);
    img_f = mhft2(double(I));%傅里叶变换得到频谱
    img_f=mhfts(img_f);  %移到中间
    m_mid=floor(M/2);%中心点坐标
    n_mid=floor(N/2);
    h = zeros(M,N);%高斯低通滤波器构造
    for i = 1:M
        for j = 1:N
            d = ((i-m_mid)^2+(j-n_mid)^2);
            h(i,j) = 1-exp(-(d)/(2*(d0^2)));
        end
    end
    img_lpf = h.*img_f;
    img_lpf=ifftshift(img_lpf);    %中心平移回原来状态
    img_lpf=uint8(real(ifft2(img_lpf)));  %反傅里叶变换,取实数部分
    my_imshow(img_lpf,handles.axes4);
elseif uslider3==14
    elp1 = handles.elp.UserData;
    I = elp1.UserData;
    d0=get(handles.slider3,'value');
    set(handles.text31,'string',num2str(d0));
    f=double(I);
    k=mhft2(f);
    g=mhfts(k);
    [N1,N2]=size(g);
    n=1;
    u0=round(N1/2);
    v0=round(N2/2);
    y = zeros(N1,N2);
    for i=1:N1
        for j=1:N2
            d=sqrt((i-u0)^2+(j-v0)^2);
            h=exp(-(d/d0)^(2*n));
            y(i,j)=h*g(i,j);
        end
    end
    y=ifftshift(y);
    e1=ifft2(y);
    e2=uint8(real(e1));
    my_imshow(e2,handles.axes4);
elseif uslider3==15
    ehp1 = handles.ehp.UserData;
    I = ehp1.UserData;
    d0=get(handles.slider3,'value');
    set(handles.text31,'string',num2str(d0));
    f=double(I);
    k=mhft2(f);
    g=mhfts(k);
    [N1,N2]=size(g);
    n=1;
    u0=round(N1/2);
    v0=round(N2/2);
    y = zeros(N1,N2);
    for i=1:N1
        for j=1:N2
            d=sqrt((i-u0)^2+(j-v0)^2);
            h=exp(-(d0/d)^(2*n));
            y(i,j)=h*g(i,j);
        end
    end
    y=ifftshift(y);
    e1=ifft2(y);
    e2=uint8(real(e1));
    my_imshow(e2,handles.axes4);
elseif uslider3==16
    tlp1 = handles.tlp.UserData;
    I = tlp1.UserData;
    D0=get(handles.slider3,'value');
    D1=get(handles.slider4,'value');
    set(handles.text31,'string',num2str(D0));
    set(handles.text30,'string',num2str(D1));
    if D0>D1
        temp = D0;
        D0=D1;
        D1=temp;
    end
    M = 2*size(I,1);
    N = 2*size(I,2);
    u = -M/2:(M/2-1);
    v = -N/2:(N/2-1);
    [U,V] = meshgrid(u,v);
    D = sqrt(U.^2 + V.^2);
    H = ones(size(D,1), size(D,2));
    for i=1:N
        for j=1:M
            if D(i,j)<=D1
                H(i,j) = 1;
            elseif D(i,j) <D1 && D(i,j) > D0
                H(i,j) = (D(i,j) - D0)./(D1 - D0);
            else
                H(i,j) = 0;
            end
        end
    end
    J = mhfts(mhft2(I, size(H,1), size(H,2)));
    C = J.*H;
    C = ifft2(ifftshift(C));
    C = C(1:size(I,1), 1:size(I,2));
    C=uint8(C);
    my_imshow(C,handles.axes4);
elseif uslider3==17
    thp1 = handles.thp.UserData;
    I = thp1.UserData;
    D0=get(handles.slider3,'value');
    D1=get(handles.slider4,'value');
    set(handles.text31,'string',num2str(D0));
    set(handles.text30,'string',num2str(D1));
    if D0>D1
        temp = D0;
        D0=D1;
        D1=temp;
    end
    M = 2*size(I,1);
    N = 2*size(I,2);
    u = -M/2:(M/2-1);
    v = -N/2:(N/2-1);
    [U,V] = meshgrid(u,v);
    D = sqrt(U.^2 + V.^2);
    H = ones(size(D,1), size(D,2));
    for i=1:N
        for j=1:M
            if D(i,j)>=D1
                H(i,j) = 1;
            elseif D(i,j) <D1 && D(i,j) > D0
                H(i,j) = (D(i,j) - D0)./(D1 - D0);
            else
                H(i,j) = 0;
            end
        end
    end
    J = mhfts(mhft2(I, size(H,1), size(H,2)));
    C = J.*H;
    C = ifft2(ifftshift(C));
    C = C(1:size(I,1), 1:size(I,2));
    C=uint8(C);
    my_imshow(C,handles.axes4);
else
    return;
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, ~, ~)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(~, ~, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uslider3 = handles.slider3.UserData;
if uslider3==1
    pingyi1 = handles.pingyi.UserData;
    img = pingyi1.UserData;
    lr = round(get(handles.slider3,'value'));
    ud = round(get(handles.slider4,'value'));
    set(handles.text31,'string',num2str(lr));
    set(handles.text30,'string',num2str(ud));
    imgout = im_translate(img,lr,-ud);
    my_imshow(imgout,handles.axes4);
elseif uslider3==2
    xuanzhuan1 = handles.xuanzhuan.UserData;
    img = xuanzhuan1.UserData;
    theta = -get(handles.slider4,'value');
    set(handles.text30,'string',num2str(theta));
    imgout = img_rotate(img,theta,1);
    my_imshow(imgout,handles.axes4);
elseif uslider3==3
    xuanzhuan1 = handles.xuanzhuan.UserData;
    img = xuanzhuan1.UserData;
    theta = -get(handles.slider4,'value');
    set(handles.text30,'string',num2str(theta));
    imgout = img_rotate(img,theta,2);
    my_imshow(imgout,handles.axes4);
elseif uslider3==4
    suofang1 = handles.suofang.UserData;
    img = suofang1.UserData;
    c = get(handles.slider3,'value');
    d = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(c));
    set(handles.text30,'string',num2str(d));
    img_out = img_zoom(img, c,d,1);
    my_imshow(img_out,handles.axes4);
elseif uslider3==5
    suofang1 = handles.suofang.UserData;
    img = suofang1.UserData;
    c = get(handles.slider3,'value');
    d = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(c));
    set(handles.text30,'string',num2str(d));
    img_out = img_zoom(img, c,d,2);
    my_imshow(img_out,handles.axes4);
elseif uslider3==6
    thrd1 = handles.thrd.UserData;
    img = thrd1.UserData;
    thrd = get(handles.slider4,'value');
    set(handles.text30,'string',num2str(thrd));
    img_out = smooth_thrd(img, thrd);
    my_imshow(img_out,handles.axes4);
elseif uslider3==7
    nthrd1 = handles.nthrd.UserData;
    img = nthrd1.UserData;
    T = get(handles.slider3,'value');
    Y = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(T));
    set(handles.text30,'string',num2str(Y));
    img_out = smooth_NThrd(img, T,Y);
    my_imshow(img_out,handles.axes4);
elseif uslider3==8
    ilp1 = handles.ilp.UserData;
    img = ilp1.UserData;
    d = get(handles.slider4,'value');
    set(handles.text30,'string',num2str(d));
    s=mhfts(fft2(img));
    [a,b]=size(s);
    a0=round(a/2);
    b0=round(b/2);
    for i=1:a
        for j=1:b
            distance=sqrt((i-a0)^2+(j-b0)^2);
            if distance<=d
                h=1;
            else
                h=0;
            end
            s(i,j)=h*s(i,j);
        end
    end
    s=uint8(real(ifft2(ifftshift(s))));
    my_imshow(s,handles.axes4);
elseif uslider3==9
    ihp1 = handles.ihp.UserData;
    img = ihp1.UserData;
    d = get(handles.slider4,'value');
    set(handles.text30,'string',num2str(d));
    s=mhfts(fft2(img));
    [a,b]=size(s);
    a0=round(a/2);
    b0=round(b/2);
    for i=1:a
        for j=1:b
            distance=sqrt((i-a0)^2+(j-b0)^2);
            if distance>=d
                h=1;
            else
                h=0;
            end
            s(i,j)=h*s(i,j);
        end
    end
    s=uint8(real(ifft2(ifftshift(s))));
    my_imshow(s,handles.axes4);
elseif uslider3==10
    blp1 = handles.blp.UserData;
    img = blp1.UserData;
    d0 = get(handles.slider3,'value');
    n = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(d0));
    set(handles.text30,'string',num2str(n));
    f=double(img);%数据类型转换
    g=mhft2(f);%图像傅里叶转换
    g=mhfts(g);%傅里叶变换平移
    [N1,N2]=size(g);%傅里叶变换图像尺寸
    n1=fix(N1/2);%数据圆整
    n2=fix(N2/2);%数据圆整
    result = zeros(N1,N2);
    for i=1:N1%遍历图像像素
        for j=1:N2
            d=sqrt((i-n1)^2+(j-n2)^2);
            if d==0
                h=0;
            else
                h=1/(1+(d/d0)^(2*n));
            end
            result(i,j)=h*g(i,j);%图像矩阵计算处理
        end
    end
    result=ifftshift(result);
    X2=ifft2(result);
    X3=uint8(real(X2));
    my_imshow(X3,handles.axes4);
elseif uslider3==11
    bhp1 = handles.bhp.UserData;
    img = bhp1.UserData;
    d0 = get(handles.slider3,'value');
    n = get(handles.slider4,'value');
    set(handles.text31,'string',num2str(d0));
    set(handles.text30,'string',num2str(n));
    f=double(img);%数据类型转换
    g=mhft2(f);%图像傅里叶转换
    g=mhfts(g);%傅里叶变换平移
    [N1,N2]=size(g);%傅里叶变换图像尺寸
    n1=fix(N1/2);%数据圆整
    n2=fix(N2/2);%数据圆整
    result = zeros(N1,N2);
    for i=1:N1%遍历图像像素
        for j=1:N2
            d=sqrt((i-n1)^2+(j-n2)^2);
            if d==0
                h=0;
            else
                h=1/(1+(d0/d)^(2*n));
            end
            result(i,j)=h*g(i,j);%图像矩阵计算处理
        end
    end
    result=ifftshift(result);
    X2=ifft2(result);
    X3=uint8(real(X2));
    my_imshow(X3,handles.axes4);
elseif uslider3==12
    glp1 = handles.glp.UserData;
    img = glp1.UserData;
    D0 = get(handles.slider4,'value');
    set(handles.text30,'string',num2str(D0));
    [f1,f2]=freqspace(size(img),'meshgrid');
    D=D0/size(img,1);
    r=f1.^2+f2.^2;
    Hd=ones(size(img));
    for i=1:size(img,1)
        for j=1:size(img,2)
            t=r(i,j)/(D*D);
            Hd(i,j)=exp(-t);
        end
    end
    Y=mhft2(double(img));
    Y=mhfts(Y);
    Ya=Y.*Hd;
    Ya=ifftshift(Ya);
    Ia=uint8(real(ifft2(Ya)));
    my_imshow(Ia,handles.axes4);
elseif uslider3==13
    ghp1 = handles.ghp.UserData;
    I = ghp1.UserData;
    d0=get(handles.slider4,'value');
    set(handles.text30,'string',num2str(d0));
    [M ,N]=size(I);
    img_f = mhft2(double(I));%傅里叶变换得到频谱
    img_f=mhfts(img_f);  %移到中间
    m_mid=floor(M/2);%中心点坐标
    n_mid=floor(N/2);
    h = zeros(M,N);%高斯低通滤波器构造
    for i = 1:M
        for j = 1:N
            d = ((i-m_mid)^2+(j-n_mid)^2);
            h(i,j) = 1-exp(-(d)/(2*(d0^2)));
        end
    end
    img_lpf = h.*img_f;
    img_lpf=ifftshift(img_lpf);    %中心平移回原来状态
    img_lpf=uint8(real(ifft2(img_lpf)));  %反傅里叶变换,取实数部分
    my_imshow(img_lpf,handles.axes4);
elseif uslider3==14
    elp1 = handles.elp.UserData;
    I = elp1.UserData;
    d0=get(handles.slider4,'value');
    set(handles.text30,'string',num2str(d0));
    f=double(I);
    k=mhft2(f);
    g=mhfts(k);
    [N1,N2]=size(g);
    n=1;
    u0=round(N1/2);
    v0=round(N2/2);
    y = zeros(N1,N2);
    for i=1:N1
        for j=1:N2
            d=sqrt((i-u0)^2+(j-v0)^2);
            h=exp(-(d/d0)^(2*n));
            y(i,j)=h*g(i,j);
        end
    end
    y=ifftshift(y);
    e1=ifft2(y);
    e2=uint8(real(e1));
    my_imshow(e2,handles.axes4);
elseif uslider3==15
    ehp1 = handles.ehp.UserData;
    I = ehp1.UserData;
    d0=get(handles.slider4,'value');
    set(handles.text30,'string',num2str(d0));
    f=double(I);
    k=mhft2(f);
    g=mhfts(k);
    [N1,N2]=size(g);
    n=1;
    u0=round(N1/2);
    v0=round(N2/2);
    y = zeros(N1,N2);
    for i=1:N1
        for j=1:N2
            d=sqrt((i-u0)^2+(j-v0)^2);
            h=exp(-(d0/d)^(2*n));
            y(i,j)=h*g(i,j);
        end
    end
    y=ifftshift(y);
    e1=ifft2(y);
    e2=uint8(real(e1));
    my_imshow(e2,handles.axes4);
elseif uslider3==16
    tlp1 = handles.tlp.UserData;
    I = tlp1.UserData;
    D0=get(handles.slider3,'value');
    D1=get(handles.slider4,'value');
    set(handles.text31,'string',num2str(D0));
    set(handles.text30,'string',num2str(D1));
    if D0>D1
        temp = D0;
        D0=D1;
        D1=temp;
    end
    M = 2*size(I,1);
    N = 2*size(I,2);
    u = -M/2:(M/2-1);
    v = -N/2:(N/2-1);
    [U,V] = meshgrid(u,v);
    D = sqrt(U.^2 + V.^2);
    H = ones(size(D,1), size(D,2));
    for i=1:N
        for j=1:M
            if D(i,j)<=D1
                H(i,j) = 1;
            elseif D(i,j) <D1 && D(i,j) > D0
                H(i,j) = (D(i,j) - D0)./(D1 - D0);
            else
                H(i,j) = 0;
            end
        end
    end
    J = mhfts(mhft2(I, size(H,1), size(H,2)));
    C = J.*H;
    C = ifft2(ifftshift(C));
    C = C(1:size(I,1), 1:size(I,2));
    C=uint8(C);
    my_imshow(C,handles.axes4);
elseif uslider3==17
    thp1 = handles.thp.UserData;
    I = thp1.UserData;
    D0=get(handles.slider3,'value');
    D1=get(handles.slider4,'value');
    set(handles.text31,'string',num2str(D0));
    set(handles.text30,'string',num2str(D1));
    if D0>D1
        temp = D0;
        D0=D1;
        D1=temp;
    end
    M = 2*size(I,1);
    N = 2*size(I,2);
    u = -M/2:(M/2-1);
    v = -N/2:(N/2-1);
    [U,V] = meshgrid(u,v);
    D = sqrt(U.^2 + V.^2);
    H = ones(size(D,1), size(D,2));
    for i=1:N
        for j=1:M
            if D(i,j)>=D1
                H(i,j) = 1;
            elseif D(i,j) <D1 && D(i,j) > D0
                H(i,j) = (D(i,j) - D0)./(D1 - D0);
            else
                H(i,j) = 0;
            end
        end
    end
    J = mhfts(mhft2(I, size(H,1), size(H,2)));
    C = J.*H;
    C = ifft2(ifftshift(C));
    C = C(1:size(I,1), 1:size(I,2));
    C=uint8(C);
    my_imshow(C,handles.axes4);
else
    return;
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, ~, ~)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function kongjianfilter_Callback(~, ~, ~)
% hObject    handle to kongjianfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function noise_Callback(~, ~, ~)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Pinghua_Callback(~, ~, ~)
% hObject    handle to Pinghua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ruihua_Callback(~, ~, ~)
% hObject    handle to ruihua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function highpass_Callback(~, ~, handles)
% hObject    handle to highpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = high_pass(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function highgain_Callback(~, ~, handles)
% hObject    handle to highgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = high_gain(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function roberts_Callback(~, ~, handles)
% hObject    handle to roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = robertFilter(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function prewitt_Callback(~, ~, handles)
% hObject    handle to prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = prewittFilter(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function sobel_Callback(~, ~, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = sobelFilter(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function Laplace_Callback(~, ~, handles)
% hObject    handle to Laplace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = laplacian(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function weigmean_Callback(~, ~, handles)
% hObject    handle to weigmean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = smooth_weig_mean(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function gradi_Callback(~, ~, handles)
% hObject    handle to gradi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = smooth_gradi(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function thrd_Callback(~, ~, handles)
% hObject    handle to thrd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 6;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.thrd.UserData = hd;
img = hd.UserData;
imgout = smooth_thrd(img);
my_imshow(imgout,handles.axes4);
warndlg('两个滑块数值为灰度阈值，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',255);
set(handles.slider3,'value',50);
set(handles.text31,'string',num2str(50));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',255);
set(handles.slider4,'value',50);
set(handles.text30,'string',num2str(50));

% --------------------------------------------------------------------
function nthrd_Callback(~, ~, handles)
% hObject    handle to nthrd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 7;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.nthrd.UserData = hd;
img = hd.UserData;
imgout = smooth_NThrd(img);
my_imshow(imgout,handles.axes4);
warndlg('下方滑块为灰度阈值，右侧滑块为个数阈值！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',255);
set(handles.slider3,'value',50);
set(handles.text31,'string',num2str(50));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',9);
set(handles.slider4,'value',5);
set(handles.text30,'string',num2str(5));

% --------------------------------------------------------------------
function median_Callback(~, ~, handles)
% hObject    handle to median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.nthrd.UserData = hd;
img = hd.UserData;
imgout = smooth_median(img);
my_imshow(imgout,handles.axes4);

% --------------------------------------------------------------------
function Gauss_Callback(~, ~, handles)
% hObject    handle to Gauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = imnoise(img,'gaussian');
my_imshow(imgout,handles.axes3);

% --------------------------------------------------------------------
function saltpepper_Callback(~, ~, handles)
% hObject    handle to saltpepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = imnoise(img,'salt & pepper');
my_imshow(imgout,handles.axes3);

% --------------------------------------------------------------------
function poisson_Callback(~, ~, handles)
% hObject    handle to poisson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
imgout = imnoise(img,'poisson');
my_imshow(imgout,handles.axes3);



function edit4_Callback(~, ~, ~)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, ~, ~)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(~, ~, ~)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, ~, ~)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function zhifangtucaozuo_Callback(~, ~, ~)
% hObject    handle to zhifangtucaozuo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function zhifangtu_Callback(~, ~, handles)
% hObject    handle to zhifangtu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
f = zhifangtu(img);
axes(handles.axes3);
bar(f);
handles.axes3.UserData = f;

% --------------------------------------------------------------------
function junhenghua_Callback(~, ~, handles)
% hObject    handle to junhenghua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
[imgout,f] = junheng(img);
axes(handles.axes3);
bar(f);
handles.axes3.UserData = f;
my_imshow(imgout,handles.axes4);


% --------------------------------------------------------------------
function pinyu_Callback(~, ~, ~)
% hObject    handle to pinyu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mdft_Callback(~, ~, handles)
% hObject    handle to mdft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
F=mhft2(img);
F1=log(abs(F)+1);
axes(handles.axes4);
imshow(F1,[]);
handles.axes4.UserData = F;
Fs=mhfts(F);
S=log(abs(Fs)+1);
axes(handles.axes3);
imshow(S,[]);
handles.axes3.UserData = Fs;

% --------------------------------------------------------------------
function midft_Callback(~, ~, handles)
% hObject    handle to midft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    Fs = handles.axes1.UserData;
elseif a==2
    Fs = handles.axes2.UserData;
elseif a==3
    Fs = handles.axes3.UserData;
elseif a==4
    Fs = handles.axes4.UserData;
else
    return
end
fr=real(ifft2(ifftshift(Fs)));%逆变换、取实部
ret=im2uint8(mat2gray(fr));
my_imshow(ret,handles.axes4);

% --------------------------------------------------------------------
function mdct_Callback(~, ~, handles)
% hObject    handle to mdct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    img = handles.axes1.UserData;
elseif a==2
    img = handles.axes2.UserData;
elseif a==3
    img = handles.axes3.UserData;
elseif a==4
    img = handles.axes4.UserData;
else
    return
end
F=dct2(img);
F1=log(abs(F));
axes(handles.axes3);
imshow(F1,[]);
handles.axes3.UserData = F;

% --------------------------------------------------------------------
function midct_Callback(~, ~, handles)
% hObject    handle to midct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    F = handles.axes1.UserData;
elseif a==2
    F = handles.axes2.UserData;
elseif a==3
    F = handles.axes3.UserData;
elseif a==4
    F = handles.axes4.UserData;
else
    return
end
ret=idct2(F)/255;
my_imshow(ret,handles.axes4);


% --------------------------------------------------------------------
function freq_filter_Callback(~, ~, ~)
% hObject    handle to freq_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function lowpass_Callback(~, ~, ~)
% hObject    handle to lowpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function highpass1_Callback(~, ~, ~)
% hObject    handle to highpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ihp_Callback(~, ~, handles)
% hObject    handle to ihp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 9;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.ihp.UserData = hd;
img = hd.UserData;
s=mhfts(fft2(img));
[a,b]=size(s);
a0=round(a/2);
b0=round(b/2);
d = 10;
for i=1:a 
    for j=1:b 
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance>=d
            h=1;
        else
            h=0;
        end
        s(i,j)=h*s(i,j);
    end
end
s=uint8(real(ifft2(ifftshift(s))));
my_imshow(s,handles.axes4);
warndlg('两个滑块均为截止频率，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(a0,b0));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',min(a0,b0));
set(handles.slider4,'value',10);
set(handles.text30,'string',num2str(10));

% --------------------------------------------------------------------
function bhp_Callback(~, ~, handles)
% hObject    handle to bhp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 11;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.bhp.UserData = hd;
img = hd.UserData;
f=double(img);%数据类型转换
g=mhft2(f);%图像傅里叶转换 
g=mhfts(g);%傅里叶变换平移
[N1,N2]=size(g);%傅里叶变换图像尺寸
n=2;
d0=10;
n1=fix(N1/2);%数据圆整
n2=fix(N2/2);%数据圆整
result = zeros(N1,N2);
for i=1:N1%遍历图像像素
    for j=1:N2 
        d=sqrt((i-n1)^2+(j-n2)^2);
        if d==0 
            h=0; 
        else
            h=1/(1+(d0/d)^(2*n));
        end
        result(i,j)=h*g(i,j);%图像矩阵计算处理
    end
end
result=ifftshift(result);
X2=ifft2(result);
X3=uint8(real(X2));
my_imshow(X3,handles.axes4);
warndlg('下方滑块为截止频率，右侧滑块为阶数！','提示','modal');
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(n1,n2));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',20);
set(handles.slider4,'value',2);
set(handles.text30,'string',num2str(2));

% --------------------------------------------------------------------
function ghp_Callback(~, ~, handles)
% hObject    handle to ghp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 13;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.ghp.UserData = hd;
I = hd.UserData;
d0=10;
[M ,N]=size(I);
img_f = mhft2(double(I));%傅里叶变换得到频谱
img_f=mhfts(img_f);  %移到中间
m_mid=floor(M/2);%中心点坐标
n_mid=floor(N/2);  
h = zeros(M,N);%高斯低通滤波器构造
for i = 1:M
    for j = 1:N
        d = ((i-m_mid)^2+(j-n_mid)^2);
        h(i,j) = 1-exp(-(d)/(2*(d0^2)));      
    end
end
img_lpf = h.*img_f;
img_lpf=ifftshift(img_lpf);    %中心平移回原来状态
img_lpf=uint8(real(ifft2(img_lpf)));  %反傅里叶变换,取实数部分
my_imshow(img_lpf,handles.axes4);
warndlg('两个滑块均为截止频率，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(m_mid,n_mid));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',min(m_mid,n_mid));
set(handles.slider4,'value',10);
set(handles.text30,'string',num2str(10));

% --------------------------------------------------------------------
function ehp_Callback(~, ~, handles)
% hObject    handle to ehp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 15;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.ehp.UserData = hd;
I = hd.UserData;
f=double(I);
k=mhft2(f);
g=mhfts(k);
[N1,N2]=size(g);
n=1;
d0=10;
u0=round(N1/2);
v0=round(N2/2);
y = zeros(N1,N2);
for i=1:N1
    for j=1:N2
        d=sqrt((i-u0)^2+(j-v0)^2);
        h=exp(-(d0/d)^(2*n));
        y(i,j)=h*g(i,j);
    end
end
y=ifftshift(y);
e1=ifft2(y);
e2=uint8(real(e1));
my_imshow(e2,handles.axes4);
warndlg('两个滑块均为截止频率，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(u0,v0));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',min(u0,v0));
set(handles.slider4,'value',10);
set(handles.text30,'string',num2str(10));

% --------------------------------------------------------------------
function thp_Callback(~, ~, handles)
% hObject    handle to thp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 17;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.thp.UserData = hd;
I = hd.UserData;
M = 2*size(I,1);
N = 2*size(I,2);
u = -M/2:(M/2-1);
v = -N/2:(N/2-1);
[U,V] = meshgrid(u,v);
D = sqrt(U.^2 + V.^2);
H = ones(size(D,1), size(D,2));
D0 = 20;
D1 = 50;
for i=1:N
    for j=1:M
        if D(i,j)>=D1
            H(i,j) = 1;
        elseif D(i,j) <D1 && D(i,j) > D0
            H(i,j) = (D(i,j) - D0)./(D1 - D0);
        else
            H(i,j) = 0;
        end
    end
end
J = mhfts(mhft2(I, size(H,1), size(H,2)));
C = J.*H;
C = ifft2(ifftshift(C));
C = C(1:size(I,1), 1:size(I,2));
C=uint8(C);
my_imshow(C,handles.axes4);
[N1,N2]=size(I);%傅里叶变换图像尺寸
n1=fix(N1/2);%数据圆整
n2=fix(N2/2);%数据圆整
warndlg('两个滑块分别为梯形滤波器的D0和D1，以较小值为D0，另一个为D1！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(n1,n2));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',min(n1,n2));
set(handles.slider4,'value',10);
set(handles.text30,'string',num2str(10));

% --------------------------------------------------------------------
function ilp_Callback(~, ~, handles)
% hObject    handle to ilp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 8;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.ilp.UserData = hd;
img = hd.UserData;
s=mhfts(fft2(img));
[a,b]=size(s);
a0=round(a/2);
b0=round(b/2);
d = 10;
for i=1:a 
    for j=1:b 
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance<=d
            h=1;
        else
            h=0;
        end
        s(i,j)=h*s(i,j);
    end
end
s=uint8(real(ifft2(ifftshift(s))));
my_imshow(s,handles.axes4);
warndlg('两个滑块均为截止频率，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(a0,b0));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',min(a0,b0));
set(handles.slider4,'value',10);
set(handles.text30,'string',num2str(10));


% --------------------------------------------------------------------
function blp_Callback(~, ~, handles)
% hObject    handle to blp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 10;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.blp.UserData = hd;
img = hd.UserData;
f=double(img);%数据类型转换
g=mhft2(f);%图像傅里叶转换 
g=mhfts(g);%傅里叶变换平移
[N1,N2]=size(g);%傅里叶变换图像尺寸
n=2;
d0=10;
n1=fix(N1/2);%数据圆整
n2=fix(N2/2);%数据圆整
result = zeros(N1,N2);
for i=1:N1%遍历图像像素
    for j=1:N2 
        d=sqrt((i-n1)^2+(j-n2)^2);
        if d==0 
            h=0; 
        else
            h=1/(1+(d/d0)^(2*n));
        end
        result(i,j)=h*g(i,j);%图像矩阵计算处理
    end
end
result=ifftshift(result);
X2=ifft2(result);
X3=uint8(real(X2));
% subplot(212),imshow(uint8(X3))
% title('Butterworth低通滤波');
my_imshow(X3,handles.axes4);
warndlg('下方滑块为截止频率，右侧滑块为阶数！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(n1,n2));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',20);
set(handles.slider4,'value',2);
set(handles.text30,'string',num2str(2));

% --------------------------------------------------------------------
function glp_Callback(~, ~, handles)
% hObject    handle to glp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 12;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.glp.UserData = hd;
img = hd.UserData;
[f1,f2]=freqspace(size(img),'meshgrid');
D0=10;
D=D0/size(img,1);
r=f1.^2+f2.^2;
Hd=ones(size(img));
for i=1:size(img,1)
    for j=1:size(img,2)
        t=r(i,j)/(D*D);
        Hd(i,j)=exp(-t);
    end
end
Y=mhft2(double(img));
Y=mhfts(Y);
Ya=Y.*Hd;
Ya=ifftshift(Ya);
Ia=uint8(real(ifft2(Ya)));
my_imshow(Ia,handles.axes4);
[N1,N2]=size(Y);%傅里叶变换图像尺寸
n1=fix(N1/2);%数据圆整
n2=fix(N2/2);%数据圆整
warndlg('两个滑块均为截止频率，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(n1,n2));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',min(n1,n2));
set(handles.slider4,'value',10);
set(handles.text30,'string',num2str(10));


% --------------------------------------------------------------------
function elp_Callback(~, ~, handles)
% hObject    handle to elp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 14;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.elp.UserData = hd;
I = hd.UserData;
f=double(I);
k=mhft2(f);
g=mhfts(k);
[N1,N2]=size(g);
n=1;
d0=10;
u0=round(N1/2);
v0=round(N2/2);
y = zeros(N1,N2);
for i=1:N1
    for j=1:N2
        d=sqrt((i-u0)^2+(j-v0)^2);
        h=exp(-(d/d0)^(2*n));
        y(i,j)=h*g(i,j);
    end
end
y=ifftshift(y);
e1=ifft2(y);
e2=uint8(real(e1));
my_imshow(e2,handles.axes4);
warndlg('两个滑块均为截止频率，以最新操作为准！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(u0,v0));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',min(u0,v0));
set(handles.slider4,'value',10);
set(handles.text30,'string',num2str(10));

% --------------------------------------------------------------------
function tlp_Callback(~, ~, handles)
% hObject    handle to tlp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 16;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.tlp.UserData = hd;
I = hd.UserData;
M = 2*size(I,1);
N = 2*size(I,2);
u = -M/2:(M/2-1);
v = -N/2:(N/2-1);
[U,V] = meshgrid(u,v);
D = sqrt(U.^2 + V.^2);
H = ones(size(D,1), size(D,2));
D0 = 20;
% 梯形低通滤波器
D1 = 50;
for i=1:N
    for j=1:M
        if D(i,j)<=D1
            H(i,j) = 1;
        elseif D(i,j) <D1 && D(i,j) > D0
            H(i,j) = (D(i,j) - D0)./(D1 - D0);
        else
            H(i,j) = 0;
        end
    end
end
J = mhfts(mhft2(I, size(H,1), size(H,2)));
C = J.*H;
C = ifft2(ifftshift(C));
C = C(1:size(I,1), 1:size(I,2));
C=uint8(C);
my_imshow(C,handles.axes4);
[N1,N2]=size(I);%傅里叶变换图像尺寸
n1=fix(N1/2);%数据圆整
n2=fix(N2/2);%数据圆整
warndlg('两个滑块分别为梯形滤波器的D0和D1，以较小值为D0，另一个为D1！','提示','modal'); 
set(handles.slider3,'Min',0);
set(handles.slider3,'Max',min(n1,n2));
set(handles.slider3,'value',10);
set(handles.text31,'string',num2str(10));
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',min(n1,n2));
set(handles.slider4,'value',10);
set(handles.text30,'string',num2str(10));


% --------------------------------------------------------------------
function zftjs_Callback(~, ~, handles)
% hObject    handle to zftjs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.slider3.UserData = 0;
a = handles.uipanel1.UserData;
if a==1
    hd = handles.axes1;
elseif a==2
    hd = handles.axes2;
elseif a==3
    hd = handles.axes3;
elseif a==4
    hd = handles.axes4;
else
    return
end
handles.zftjs.UserData = hd;
img = hd.UserData;
if isempty(img)
    errordlg('未读入图片','错误');
end
[~,~,bands] = size(img);
if bands==1
    errordlg('错误，不是彩色图像！','错误');
end
[coef, name, path]=histmatch(img);
len = length(coef);

row_num = ceil(len/5);
	
% 设置figure最大化显示
h = figure('Name','检索结果','NumberTitle','off');

% ————————————————
% 版权声明：本文为CSDN博主「Northan」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
% 原文链接：https://blog.csdn.net/am290333566/article/details/84581313
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');	% 关闭相关的警告提示（因为调用了非公开接口）
jFrame = get(h,'JavaFrame');	% 获取底层 Java 结构相关句柄吧
pause(0.1);					% 在 Win 10，Matlab 2017b 环境下不加停顿会报 Java 底层错误。各人根据需要可以进行实验验证
set(jFrame,'Maximized',1);	%设置其最大化为真（0 为假）
pause(0.1);					% 个人实践中发现如果不停顿，窗口可能来不及变化，所获取的窗口大小还是原来的尺寸。各人根据需要可以进行实验验证
warning('on','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');		% 打开相关警告设置
% ————————————————

axes('Parent', gcf);
for i = 1:1:len
    subplot(row_num,5,i);%每行最多显示五张图片
%    s = ['img',char(i+1)];
    img = imread([path, name{i}]);
%    axes(handles.(sprintf('axes%d',i+1)));
    name_t = replace(name{i},'_','\_');
    imshow(img)
    text('Unit','normalized','Position',[0,0],'String',[newline,name_t,sprintf(',相似度:%.2f',coef(i))]);
end
