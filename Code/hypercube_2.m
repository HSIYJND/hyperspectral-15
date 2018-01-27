% David Brenes 
% Created January 25, 2018

function [ hypercube ] = hypercube_2(pathname, filename_0, image_num, high_lambda, low_lambda, lambda_step, acc_num)
base_filename = filename_0;   %name of the files without the counts and the file extension
images_saved = {};
for i = 0:image_num-1
    for j = low_lambda:lambda_step:high_lambda
        for z = 0:24
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
    images_saved{i+1} = temp_lambdas;
end
    % If image =2
    hypercube = cat(1, images_saved{2}, images_saved{1});
    % if image = 4
end

% i = 0
% size_lambda = ((top - bot)/step)+1;
% image_cube = zeros (512, 512, round(size_lambda));
% lambda = bot;
% a = 1;
% extension = '.txt'
%     while lambda <= top
%        filename = strcat(base_filename, num2str(lambda*10),'-0', extension);
%        full_name = strcat(pathname,filename);
%        image = dlmread(full_name{1});
%        image_cube (:,:, a) = image;
%        lambda = lambda + step
%        a = a + 1;
%     end
% end
% 
% 
