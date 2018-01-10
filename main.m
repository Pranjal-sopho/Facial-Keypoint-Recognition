% facial recog using neural networks
% author : @starlord
%% Initialization
clear ; close all; clc
m = 7049;
% loading dataset
data = csvread('training.csv',1,0);

%extracting images from data
img = data(:,31:end);
Y = data(:,1:30);
%displayData(transpose(img(3,:)));
hold on;
%data preprocessing
%step1 : Histogram stretching
max_arr = transpose(max(transpose(img)));
min_arr = transpose(min(transpose(img)));
l=0;
u=255;
for i=1:m
    temp  = max_arr(i)-min_arr(i);
    temp2 = (max_arr(i)*l - min_arr(i)*u)/temp;
    temp = (u-l)/temp;
    img(i) = temp*img(i) + temp2;
end

%homomorphic filtering
fftlog = fft2(log(img));
filter = butterhp(15,1);
filter = transpose(filter(:));

for i=1:m
    x = real(fftlog(i).*filter);
    img(i,:) = exp(ifft2(x));
end
%displayData(img(3,:));
% loading parameters
theta1 = rand(50,9217);
theta2 = rand(30,51);

% Forward Propagation
J = cost(9216,50,30,theta1,theta2,lambda,img,Y);