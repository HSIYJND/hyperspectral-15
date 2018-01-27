% David Brenes
% Created: January 27, 2018
% run_hyper_create.m: This script will initiate the creation of the hypercube

% Function hypercube_2 can be used to create the initial hypercube of data.
% Inputs:
%   - pathname: Path to text files with data
%   - filename_0: file name without specific identifiers
%   - image_num: number of images taken
%   - high_lambda: top wavelength recorded
%   - low_lambda: bottom wavelength recorded
%   - lambda_step: increments of the wavelength
%   - acc_num: number of accumulations performed per wavelength

clear all;
close all;

pathname = '/Users/davidbrenes/Desktop/Duke_University/Senior/Second Semester/Independent Study/hyperspectral/Data/Text/';
filename_0 = 'david_img_';
image_num = 2;
high_lambda = 830;
low_lambda = 810;
lambda_step = 1;
acc_num = 25;

hypercube = hypercube_2(pathname,filename_0, image_num, high_lambda,...
    low_lambda, lambda_step, acc_num);

save('hypercube.mat', 'hypercube');
