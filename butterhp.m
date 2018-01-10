function [ out ] = butterhp(d,n )
%BUTTERHP Summary of this function goes here
%   Detailed explanation goes here
h =96;
w = 96;
[x,y] = meshgrid(-floor(w/2):floor(w-1)/2, -floor(h/2):floor(h-1)/2);
out = 1./(1.+(d./(x.^2+y.^2).^0.5).^(2*n));
end

