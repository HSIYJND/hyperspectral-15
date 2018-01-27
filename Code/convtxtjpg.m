%% Conver to JPG

folder_path = '/Users/davidbrenes/Desktop/lab/Data/Text/';
folder_des = '/Users/davidbrenes/Desktop/lab/Data/Images/';
data_files = dir([folder_path, '*.txt']);

for i = 1:numel(data_files)
    file_struct = data_files(i);
    img=dlmread([folder_path, file_struct.name]);
    imwrite(uint8(img), [folder_des,file_struct.name, '.jpg']);
end