function [ image_cube ] = hypercube(pathname, filename_0, top, bot, step)

base_filename = filename_0;                         %name of the files without the counts and the file extension
i = 0
size_lambda = ((top - bot)/step)+1;
image_cube = zeros (512, 512, round(size_lambda));
lambda = bot;
a = 1;
extension = '.txt'
    while lambda <= top
       filename = strcat(base_filename, num2str(lambda*10),'-0', extension);
       full_name = strcat(pathname,filename);
       image = dlmread(full_name{1});
       image_cube (:,:, a) = image;
       lambda = lambda + step
       a = a + 1;
    end
end

