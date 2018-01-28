% David Brenes 
% Created: January 25, 2018
% Function hypercube_2: Used to create the initial hypercube of data.

% Inputs:
%   - pathname: Path to text files with data
%   - filename_0: file name without specific identifiers
%   - image_num: number of images taken
%   - high_lambda: top wavelength recorded
%   - low_lambda: bottom wavelength recorded
%   - lambda_step: increments of the wavelength
%   - acc_num: number of accumulations performed per wavelength

function [ hypercube ] = hypercube_2(pathname, filename_0, image_num, high_lambda, low_lambda, lambda_step, acc_num)
base_filename = filename_0;   
hypercube_images = {};
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

%% David Brenes
% Vo-Dinh Laboratory 2017
% Scanner Create Hypercubes
image_num_1 = 1;
image_num_2 = 2;
image_count = 0;
flag = false;
for x = 1:image_num_1
    horz_arr = [];
    for y = 1:image_num_2
        cube = hypercube_images{y}
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

hypercube = [];
for i = 1:numel(cell_image)
        hypercube = [hypercube;cell_image{i}];
end

save('hypercube.mat', 'hypercube');
end




%     % If image =2
%     if image_num<4
%         for i = 1:image_num
%             if i == 1
%                 hypercube = cat(1, images_saved{i+1}, images_saved{i});
%             else 
%                 hypercube = cat(1, images_saved{i+1}, hypercube);
%             end 
%         end
%     end
%     if image_num >= 4
%         img_per_row = sqrt(image_num);
%         for i = 1: img_per_row
%             
%         end
%     end
%         
%         
% end
% 
% % i = 0
% % size_lambda = ((top - bot)/step)+1;
% % image_cube = zeros (512, 512, round(size_lambda));
% % lambda = bot;
% % a = 1;
% % extension = '.txt'
% %     while lambda <= top
% %        filename = strcat(base_filename, num2str(lambda*10),'-0', extension);
% %        full_name = strcat(pathname,filename);
% %        image = dlmread(full_name{1});
% %        image_cube (:,:, a) = image;
% %        lambda = lambda + step
% %        a = a + 1;
% %     end
% % end
% % 
% % 
