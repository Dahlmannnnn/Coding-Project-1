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

    % Read .txt file in same folder, starting with line 2 (Line 1 is header)
    % Input data to vector V(Data point (###), Blood Pressure (###))

% create Vector (v) of size n and establish kernels (k) at each datapoint

    % Max(V(1))=n
    % vector k[n]=[F(d)]
    % F(d)-> sinc^2(d) -> limit sinc function to +-gamma, where gamma is
    % the distance from current datapoint -> should determine best value
    % for gamma
    % 
    

% Sum Values of Kernels to create equation Y


% Output Graph n,k, and Y/10 [This allows the data to be displayed ]