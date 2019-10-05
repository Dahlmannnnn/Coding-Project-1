% Alexander Dahlmann
% EE599 Machine Learning - Fall 2019
% Coding Project 1
% Using Blood Pressure to Identify Risk of Heart Disease

% Input Data Set - Store data in matrix of size 11,n where n is the number
% of data points

% Download Data set from online, create file 'output.txt'
fid = fopen('output.txt','wb');
b=websave('output.txt', 'https://web.stanford.edu/~hastie/ElemStatLearn/datasets/SAheart.data');
beta = char(b);
fwrite(fid, beta, 'char');
fclose(fid);
% Save the text file as a table and limit to second column
a = readtable('output.txt');
dat = a(:,[2]);

% Sum Values of Kernels to create equation Y


% Output Graph n,k, and Y/10 [This allows the data to be displayed ]