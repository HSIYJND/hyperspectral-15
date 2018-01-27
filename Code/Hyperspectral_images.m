function varargout = Hyperspectral_images(varargin)
% HYPERSPECTRAL_IMAGES MATLAB code for Hyperspectral_images.fig
%      HYPERSPECTRAL_IMAGES, by itself, creates a new HYPERSPECTRAL_IMAGES or raises the existing
%      singleton*.
%
%      H = HYPERSPECTRAL_IMAGES returns the handle to a new HYPERSPECTRAL_IMAGES or the handle to
%      the existing singleton*.
%
%      HYPERSPECTRAL_IMAGES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HYPERSPECTRAL_IMAGES.M with the given input arguments.
%
%      HYPERSPECTRAL_IMAGES('Property','Value',...) creates a new HYPERSPECTRAL_IMAGES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hyperspectral_images_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hyperspectral_images_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hyperspectral_images

% Last Modified by GUIDE v2.5 28-Aug-2017 22:53:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hyperspectral_images_OpeningFcn, ...
                   'gui_OutputFcn',  @Hyperspectral_images_OutputFcn, ...
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


% --- Executes just before Hyperspectral_images is made visible.
function Hyperspectral_images_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hyperspectral_images (see VARARGIN)

% Choose default command line output for Hyperspectral_images
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hyperspectral_images wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hyperspectral_images_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in image.
function image_Callback(hObject, eventdata, handles)
% hObject    handle to image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pathname = get(handles.path, 'String');
filename_0 = get(handles.filename, 'String');
top = str2num(get(handles.L_end, 'String')); %end of files numbers
bot = str2num(get(handles.L_start, 'String'));
base_filename = filename_0;                         %name of the files without the counts and the file extension
step = str2num(get(handles.interval, 'String'));
i = round ((str2num (get(handles.lambda_image, 'String')) - bot + 1)/step);
axis = linspace(0, 5.925, 5.925/512);
image_cube = get(handles.load, 'UserData');

figure ('position', [500, 500, 500, 500])
image_lambda = image_cube (:,:,i);
imagesc (axis, axis, image_lambda)
xlabel('X (mm)', 'FontSize', 12)
ylabel('Y (mm)', 'FontSize', 12)

pathname = get(handles.path, 'String');
newfilename = strcat(filename_0,'_image_lambda=', get(handles.lambda_image, 'String'), '.tiff')
fullfilename = fullfile(pathname, newfilename)
saveas(imgcf, fullfilename)




% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pathname = get(handles.path, 'String')
filename_0 = get(handles.filename, 'String');
top = str2num(get(handles.L_end, 'String')); %end of files numbers
bot = str2num(get(handles.L_start, 'String'));
base_filename = filename_0;                         %name of the files without the counts and the file extension
step = str2num(get(handles.interval, 'String'));
i = 0
size_lambda = ((top - bot)/step)+1;
image_cube = zeros (512, 512, round(size_lambda));
lambda = bot;
a = 1;
extension = '.txt'

if str2num(get(handles.acc, 'String')) == 1
    while lambda <= top
       filename = horzcat(base_filename, num2str(lambda*10),'-0', extension);
       image = dlmread(fullfile(pathname,filename));
       image_cube (:,:, a) = image;
       lambda = lambda + step
       a = a + 1;
    end
else
    while lambda <= top
        i = 0;
        image_ave = zeros (512, 512, str2num(get(handles.acc, 'String')));
        while i < str2num (get(handles.acc, 'String'));
           filename = horzcat(base_filename, num2str(lambda*10),'-',num2str(i),extension);
           image = dlmread(fullfile(pathname,filename));
           image_ave (:,:, i+1) = image;
           i = i +1;
        end
        image_1 = sum (image_ave, 3);
        image_cube (:,:, a) = image_1;
        lambda = lambda + step 
        a = a + 1;
    end
  
end
%% ERROR WAS HERE 
set (handles.load, 'UserData', image_cube);    






function filename_Callback(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filename as text
%        str2double(get(hObject,'String')) returns contents of filename as a double


% --- Executes during object creation, after setting all properties.
function filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_start_Callback(hObject, eventdata, handles)
% hObject    handle to L_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L_start as text
%        str2double(get(hObject,'String')) returns contents of L_start as a double


% --- Executes during object creation, after setting all properties.
function L_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_end_Callback(hObject, eventdata, handles)
% hObject    handle to L_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L_end as text
%        str2double(get(hObject,'String')) returns contents of L_end as a double


% --- Executes during object creation, after setting all properties.
function L_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function interval_Callback(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interval as text
%        str2double(get(hObject,'String')) returns contents of interval as a double


% --- Executes during object creation, after setting all properties.
function interval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_start_Callback(hObject, eventdata, handles)
% hObject    handle to file_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_start as text
%        str2double(get(hObject,'String')) returns contents of file_start as a double


% --- Executes during object creation, after setting all properties.
function file_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_end_Callback(hObject, eventdata, handles)
% hObject    handle to file_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_end as text
%        str2double(get(hObject,'String')) returns contents of file_end as a double


% --- Executes during object creation, after setting all properties.
function file_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in autosave.
function autosave_Callback(hObject, eventdata, handles)
% hObject    handle to autosave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns autosave contents as cell array
%        contents{get(hObject,'Value')} returns selected item from autosave


% --- Executes during object creation, after setting all properties.
function autosave_CreateFcn(hObject, eventdata, handles)
% hObject    handle to autosave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function acc_Callback(hObject, eventdata, handles)
% hObject    handle to acc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of acc as text
%        str2double(get(hObject,'String')) returns contents of acc as a double


% --- Executes during object creation, after setting all properties.
function acc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to acc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_value_Callback(hObject, eventdata, handles)
% hObject    handle to x_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_value as text
%        str2double(get(hObject,'String')) returns contents of x_value as a double


% --- Executes during object creation, after setting all properties.
function x_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_value_Callback(hObject, eventdata, handles)
% hObject    handle to y_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_value as text
%        str2double(get(hObject,'String')) returns contents of y_value as a double


% --- Executes during object creation, after setting all properties.
function y_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function size_Callback(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size as text
%        str2double(get(hObject,'String')) returns contents of size as a double


% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in spectrum.
function spectrum_Callback(hObject, eventdata, handles)
% hObject    handle to spectrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pathname = get(handles.path, 'String')
filename_0 = get(handles.filename, 'String');
top = str2num(get(handles.L_end, 'String')); %end of files numbers
bot = str2num(get(handles.L_start, 'String'));
base_filename = filename_0;                         %name of the files without the counts and the file extension
step = str2num(get(handles.interval, 'String'));
i = round((str2num(get(handles.lambda_image, 'String')) - bot)/step);
size_lambda = ((top - bot)/step)+1;

x = str2num(get(handles.x_value, 'String'))
y = str2num(get(handles.y_value, 'String'))

top_shift = ((1/785) - (1/top))*10^7;
bot_shift = ((1/785) - (1/bot))*10^7;

lambda = linspace (bot_shift, top_shift, round(size_lambda));
size = str2num(get(handles.size, 'String'));
image_cube = get(handles.load, 'UserData');

if str2num(get(handles.size, 'String')) == 1
    spectrum_plot = image_cube (y,x,:);

else
    j = 0;
    spectra_ave = zeros (size, round(size_lambda));
      while j < size
          spectra_ave (j+1, :) = squeeze (image_cube (y+j,x+j,:));
          j = j + 1
      end
    spectrum_plot = sum (spectra_ave, 1);
      
end

spectrum_plot = squeeze (spectrum_plot);

spectrum_sub2 = transpose (spectrum_plot);  
% spectrum_sub2 = RemoveFluoSpectra_LowestPoint(spectrum_sub1, 10, 1);
spectrum_sub2 = transpose (spectrum_sub2 (:,1));


text1 = strcat ('X', get(handles.x_value, 'String'), ' Y', get(handles.y_value, 'String'));
figure
plot (lambda, spectrum_plot, 'LineWidth', 1)
xlabel('Raman Shift (rel. cm-1)', 'FontSize', 12)
ylabel('Intensity (counts)', 'FontSize', 12)
title (text1) 


text1 = strcat ('bkgsub', ' X', get(handles.x_value, 'String'), ' Y', get(handles.y_value, 'String'));
figure
plot (lambda, spectrum_sub2, 'LineWidth', 1)
xlabel('Raman Shift (rel. cm-1)', 'FontSize', 12)
ylabel('Intensity (counts)', 'FontSize', 12)
title (text1) 

newfilename = strcat(filename_0,'spectrum -', ' X', get(handles.x_value, 'String'), ' Y', get(handles.y_value, 'String'), '.txt')
fullfilename = fullfile(pathname, newfilename)
fid = fopen(fullfilename, 'w');
fprintf(fid, '%f \t %f \r\n', [lambda; spectrum_plot]);
fclose(fid);

newfilename = strcat(filename_0,'bkgsub-spectrum -', ' X', get(handles.x_value, 'String'), ' Y', get(handles.y_value, 'String'), '.txt')
fullfilename = fullfile(pathname, newfilename)
fid = fopen(fullfilename, 'w');
fprintf(fid, '%f \t %f \r\n', [lambda; spectrum_sub2]);
fclose(fid);




% --- Executes on button press in filename_1.
function filename_1_Callback(hObject, eventdata, handles)
% hObject    handle to filename_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname, filterindex] = uigetfile('Select file with data cube')
data_cube = load([pathname, filename]);
set (handles.load, 'UserData', data_cube.hypercube);  



function lambda_image_Callback(hObject, eventdata, handles)
% hObject    handle to lambda_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambda_image as text
%        str2double(get(hObject,'String')) returns contents of lambda_image as a double


% --- Executes during object creation, after setting all properties.
function lambda_image_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
