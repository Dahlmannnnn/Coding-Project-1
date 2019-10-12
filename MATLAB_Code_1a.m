% Alexander Dahlmann
% EE599 Machine Learning - Fall 2019
% Coding Project 1
% Using Blood Pressure to Identify Risk of Heart Disease

clear

% Download Data set from online, create file 'output.txt'
if isfile('output.txt')    
    fprintf('Downloading Data')
fid = fopen('output.txt','wb');
b=websave('output.txt', 'https://web.stanford.edu/~hastie/ElemStatLearn/datasets/SAheart.data');
beta = char(b);
fwrite(fid, beta, 'char');
fclose(fid);
else
fprintf('File Exists')
end
% Save the text file as a table and limit to second column
a = readtable('output.txt');
dat = (table2array((a(:,[2])))).';
% Initiate the variables for the code
n = size(dat);
x=100:0.01:220;
X=size(x);
N = n(2);
su=zeros(N,1);
dx(1,:)=100:0.01:220;
hold on

% first for loop is to store the values in a matrix
for d = 2:1:N+1
    % This next line will be deleted before submission, just for my own
    % information
    disp(d)
    dd=dat(d-1);
    % calculates the gaussian distribution around each data point 
    for xd = 1:1:X(2)
       dx(d+1,xd)= normpdf(100+(xd/100),dd,4);
    end
plot([dd dd], [-0.1 0], '-g')
end
for d=2:1:N+1
    plot(dx(1,:),dx(d,:)/10,'-b')
end
for dd=1:1:xd
su(dd)=sum(dx)/N;
end
ylim ([-0.001 0.025])

plot(dx(1,:),su/10,'-r')
