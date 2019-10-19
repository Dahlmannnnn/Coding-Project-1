function MATLAB_Code_1a(~)
% Alexander Dahlmann
% EE599 Machine Learning - Fall 2019
% Coding Project 1
% Using Blood Pressure to Identify Risk of Heart Disease

% Download Data set from online, create file 'output.txt'
if isfile('output.txt')    
    fprintf('Downloading Data\n')
fid = fopen('output.txt','wb');
b=websave('output.txt', 'https://web.stanford.edu/~hastie/ElemStatLearn/datasets/SAheart.data');
beta = char(b);
fwrite(fid, beta, 'char');
fclose(fid);
else
fprintf('File Exists\n')
end
% Save the text file as a table and limit to second column
a = readtable('output.txt');
dat = (table2array((a(:,(2))))).';

% Initiate the variables for the code
n = size(dat);
x=100:0.01:220;
X=size(x);
N = n(2);
su=zeros(X(2),1);
dx=zeros(N+1,X(2));
dx(1,:)=100:0.01:220;
hold on

% first for loop is to store the values in a matrix
for d = 2:1:N
    dd=dat(d-1);
    % calculates the gaussian distribution around each data point 
    for xd = 1:1:X(2)
       dx(d+1,xd)= normpdf(100+(xd/100),dd,4);
    end
    % This line plots the green bars indicating the initial data points
plot([dd dd], [-0.1 0], '-g')
end
% This for loop plots each of the kernels in blue. They are scaled down by
% 10 as was the case in the example
for d=2:1:N
    plot(dx(1,:),dx(d,:)/10,'-b')
    for dd=1:1:xd
        su(dd)=su(dd)+(dx(d,dd));
    end
end

ylim ([-0.001 max(su)/N])
% This line plots the final average summation of the kernels in red
plot(dx(1,:),su/N,'-r')
end