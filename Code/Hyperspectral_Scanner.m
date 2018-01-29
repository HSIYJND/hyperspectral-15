function varargout = Hyperspectral_Scanner(varargin)
% HYPERSPECTRAL_SCANNER MATLAB code for Hyperspectral_Scanner.fig
%      HYPERSPECTRAL_SCANNER, by itself, creates a new HYPERSPECTRAL_SCANNER or raises the existing
%      singleton*.
%
%      H = HYPERSPECTRAL_SCANNER returns the handle to a new HYPERSPECTRAL_SCANNER or the handle to
%      the existing singleton*.
%
%      HYPERSPECTRAL_SCANNER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HYPERSPECTRAL_SCANNER.M with the given input arguments.
%
%      HYPERSPECTRAL_SCANNER('Property','Value',...) creates a new HYPERSPECTRAL_SCANNER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hyperspectral_Scanner_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hyperspectral_Scanner_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hyperspectral_Scanner

% Last Modified by GUIDE v2.5 29-Jan-2018 14:09:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hyperspectral_Scanner_OpeningFcn, ...
                   'gui_OutputFcn',  @Hyperspectral_Scanner_OutputFcn, ...
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


% --- Executes just before Hyperspectral_Scanner is made visible.
function Hyperspectral_Scanner_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hyperspectral_Scanner (see VARARGIN)

% Choose default command line output for Hyperspectral_Scanner
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hyperspectral_Scanner wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hyperspectral_Scanner_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in text_file_folder.
function text_file_folder_Callback(hObject, eventdata, handles)
% hObject    handle to text_file_folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile('*.*')
handles.folder_path = pathname;
set(handles.file_path, 'String', handles.folder_path);





function base_name_Callback(hObject, eventdata, handles)
% hObject    handle to base_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of base_name as text
%        str2double(get(hObject,'String')) returns contents of base_name as a double


% --- Executes during object creation, after setting all properties.
function base_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to base_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num_images_Callback(hObject, eventdata, handles)
% hObject    handle to num_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_images as text
%        str2double(get(hObject,'String')) returns contents of num_images as a double


% --- Executes during object creation, after setting all properties.
function num_images_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function start_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to start_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start_lambda as text
%        str2double(get(hObject,'String')) returns contents of start_lambda as a double


% --- Executes during object creation, after setting all properties.
function start_lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function end_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to end_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of end_lambda as text
%        str2double(get(hObject,'String')) returns contents of end_lambda as a double


% --- Executes during object creation, after setting all properties.
function end_lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to step_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_lambda as text
%        str2double(get(hObject,'String')) returns contents of step_lambda as a double


% --- Executes during object creation, after setting all properties.
function step_lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function acc_num_Callback(hObject, eventdata, handles)
% hObject    handle to acc_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of acc_num as text
%        str2double(get(hObject,'String')) returns contents of acc_num as a double


% --- Executes during object creation, after setting all properties.
function acc_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to acc_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in process_data.
function process_data_Callback(hObject, eventdata, handles)
% hObject    handle to process_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AccN = str2num(handles.acc_num.String); % Accumulations
StepL = str2num(handles.step_lambda.String); % Step Lambda
EndL = str2num(handles.end_lambda.String); % End Lambda
StartL = str2num(handles.start_lambda.String); % Start Lambda
NumI = str2num(handles.num_images.String); % Number of Images
BaseN = handles.base_name.String; % Base name of folder
hypercube = create_hypercube(handles.file_path.String, BaseN, NumI, EndL, StartL,StepL, AccN);  
waitfor(hypercube)
handles.hypercube = hypercube;
guidata(hObject, handles);

function [ hypercube ] = create_hypercube(pathname, filename_0, image_num, high_lambda, low_lambda, lambda_step, acc_num)
base_filename = filename_0;   
hypercube_images = {};
total_files = ((high_lambda - low_lambda)+1)*acc_num*image_num;
processed_files = 0;
h = waitbar(0,'Please wait...');
for i = 0:image_num-1
    for j = low_lambda:lambda_step:high_lambda
        for z = 0:acc_num-1
            file_name = strcat(base_filename, num2str(i), ' lambda_',num2str(j*10), '-', num2str(z), '.txt');
            full_name = strcat(pathname,file_name);
            if z == 0
                image = dlmread(full_name); 
                a = size(image);
                temp_acc = zeros(a(1,1), a(1,2), acc_num);
            end
            image = dlmread(full_name); 
            temp_acc(:,:,z+1) = image;
            processed_files = processed_files+1;
            waitbar(processed_files/total_files)
        end
        if j == low_lambda
            temp_lambdas = zeros(a(1,1), a(1, 2), numel(low_lambda:lambda_step:high_lambda));
        end
        tem_acc_mean = mean(temp_acc, 3);
        temp_lambdas(:,:, j-low_lambda+1) = tem_acc_mean;
    end
    B = rot90(temp_lambdas);
    hypercube_images{i+1} = B;
end
image_num_1 = 1;
image_num_2 = 2;
image_count = 0;
flag = false;
for x = 1:image_num_1
    horz_arr = [];
    for y = 1:image_num_2
        cube = hypercube_images{y};
        if flag
            horz_arr = [horz_arr, cube];
        else
            horz_arr = [cube, horz_arr];
        end
    image_count = image_count+1;    
    end
    cell_image{x} = horz_arr;
    if flag
        flag = false;
    else
        flag = true;
    end
end
close(h)
hypercube = [];
for i = 1:numel(cell_image)
        hypercube = [hypercube;cell_image{i}];
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


% --- Executes on button press in spectrum.
function spectrum_Callback(hObject, eventdata, handles)
% hObject    handle to spectrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

top = str2num(get(handles.end_lambda, 'String'));
bot = str2num(get(handles.start_lambda, 'String'));
step = str2num(get(handles.step_lambda, 'String'));
% i = round((str2num(get(handles.lambda_image, 'String')) - bot)/step);
size_lambda = ((top - bot)/step)+1;

x = str2num(get(handles.x_value, 'String'))
y = str2num(get(handles.y_value, 'String'))

top_shift = ((1/785) - (1/top))*10^7;
bot_shift = ((1/785) - (1/bot))*10^7;
lambda = linspace (bot_shift, top_shift, round(size_lambda));
size = str2num(get(handles.size, 'String'));
image_cube = handles.hypercube;

if str2num(get(handles.size, 'String')) == 1
    spectrum_plot = image_cube (y,x,:);

else
    j = 0;
    spectra_ave = zeros (size, round(size_lambda));
      while j < size
          spectra_ave (j+1, :) = squeeze (image_cube (y+j,x+j,:));
          j = j + 1;
      end
    spectrum_plot = sum (spectra_ave, 1);
      
end

spectrum_plot = squeeze (spectrum_plot);

% WHAT IS THE POINT OF SPECTRUM 2
% spectrum_sub2 = transpose (spectrum_plot);  
% % spectrum_sub2 = RemoveFluoSpectra_LowestPoint(spectrum_sub1, 10, 1);
% spectrum_sub2 = transpose (spectrum_sub2 (:,1));


text1 = strcat ('X', get(handles.x_value, 'String'), ' Y', get(handles.y_value, 'String'));
axes(handles.spectrum_display) 
plot (lambda, spectrum_plot, 'LineWidth', 1)
xlabel('Raman Shift (rel. cm-1)', 'FontSize', 12)
ylabel('Intensity (counts)', 'FontSize', 12)
title (text1) 
image_cube = handles.hypercube;
axes(handles.image_display)
imagesc(image_cube(:,:,(str2num(get(handles.pic_wavelength, 'String'))-str2num(get(handles.start_lambda, 'String')))+1))
hold on
plot(str2num(get(handles.x_value, 'String')), str2num(get(handles.y_value, 'String')), 'r*', 'MarkerSize', 30)
xlabel('X')
ylabel('Y')



% text1 = strcat ('bkgsub', ' X', get(handles.x_value, 'String'), ' Y', get(handles.y_value, 'String'));
% figure
% plot (lambda, spectrum_sub2, 'LineWidth', 1)
% xlabel('Raman Shift (rel. cm-1)', 'FontSize', 12)
% ylabel('Intensity (counts)', 'FontSize', 12)
% title (text1) 



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


% --- Executes on button press in save_cube.
function save_cube_Callback(hObject, eventdata, handles)
% hObject    handle to save_cube (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hypercube = handles.hypercube;
[file,path] = uiputfile('hypercube.mat','hypercube');
save([path, file], 'hypercube') 


% --- Executes on button press in load_cube.
function load_cube_Callback(hObject, eventdata, handles)
% hObject    handle to load_cube (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile('*.*')
hypercube = load([pathname,filename]);
hypercube = hypercube.hypercube;
handles.hypercube = hypercube;
guidata(hObject, handles);



function pic_wavelength_Callback(hObject, eventdata, handles)
% hObject    handle to pic_wavelength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pic_wavelength as text
%        str2double(get(hObject,'String')) returns contents of pic_wavelength as a double


% --- Executes during object creation, after setting all properties.
function pic_wavelength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pic_wavelength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in display_picture.
function display_picture_Callback(hObject, eventdata, handles)
% hObject    handle to display_picture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_cube = handles.hypercube;
axes(handles.image_display)
imagesc(image_cube(:,:,(str2num(get(handles.pic_wavelength, 'String'))-str2num(get(handles.start_lambda, 'String')))+1))
hold on
plot(str2num(get(handles.x_value, 'String')), str2num(get(handles.y_value, 'String')), 'r*', 'MarkerSize', 30)
xlabel('X')
ylabel('Y')


% --- Executes on button press in save_image.
function save_image_Callback(hObject, eventdata, handles)
% hObject    handle to save_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% fh = figure;
% copyobj(handles.spectrum_display, fh);
[file,path] = uiputfile('image_name.jpg');
export_fig(handles.image_display,'-transparent',[path, file]);

% --- Executes on button press in save_spectrum.
function save_spectrum_Callback(hObject, eventdata, handles)
% hObject    handle to save_spectrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fh = figure;
copyobj(handles.spectrum_display, fh);
[file,path] = uiputfile('spectrum_name.jpg');
export_fig(handles.spectrum_display,'-transparent',[path, file]);

