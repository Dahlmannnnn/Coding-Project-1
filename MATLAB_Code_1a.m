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
x=100:0.01:220;
X=size(x);

N = n(2);
dx=zeros(X(2), N+1);
dx(:,1)=x;
SD = std(dat);
MN = mean(dat);
syms f(x)
syms g(x)
hold on

for d = 1:1:10
    disp(d)
    dd=dat(d);
f = symfun(normpdf(x,dd,4),x);
for sx = 1:1:X
dx(sx,dd)=f(sx/);
end

%f = (1/(N*2*(SD^2*pi)^(x/2)))*exp(-0.5*abs(MN-dd)/SD)^2;
%f = normpdf(x,dd,sqrt(SD))/N;
g =@(x) (f+g(x))/2;
fplot(f/15, [100 220],'-b')
plot([dd dd], [-0.1 0], '-g')
 
ylim ([-0.001 0.025])
end
fplot(g)

% Output Graph n,k, and Y/10 [This allows the data to be displayed ]