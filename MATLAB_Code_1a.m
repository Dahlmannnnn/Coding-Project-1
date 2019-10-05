% Alexander Dahlmann
% EE599 Machine Learning - Fall 2019
% Coding Project 1
% Using Blood Pressure to Identify Risk of Heart Disease


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
n = size(dat);
x=-50:0.01:50;


N = n(2);
SD = std(dat);
MN = mean(dat);

syms f(x)
hold on

for d = 1:1:50
    disp(d)
    dd=dat(d);
f = symfun(normpdf(x,dd,(SD)),x);
fplot(f, [100 220],'-b')
ylim ([0 0.025])
end


% Output Graph n,k, and Y/10 [This allows the data to be displayed ]