clear all;
close all;
clc;
L = 32;
%d=gausswin(L);
%  e=rectwin(L);
% f=triang(L);
% g=hann(L);
% h=hamming(L);
% plot(fft(d));

d= wvtool(gausswin(L))
% wvtool(rectwin(L))
% wvtool(triang(L))
% wvtool(hann(L))
% wvtool(hamming(L))



	

