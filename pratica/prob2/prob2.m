close all, clear all, clc;
w = importdata('rect.mat');
n = [0:3599];
fs = 530;
T = 1/fs;
%L = length(n);
L = 64;
t = (0:L-1)/fs;
X = w'.*cos(2*pi*70*t + pi);
%X=[zeros(1,500) X zeros(1,500)];
Y = fft(X);
P = abs(Y/L);
%f = (fs/L)*(n(1:end));
f = (fs/L)*(n(1:L))
figure();
stem(f,P);
title('Espectro do sinal x(n)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

