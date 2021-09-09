

close all
clear
clc
%
load('DMonky.mat')
kDm= kDMonky(21100:25500);

NN= 8192;
bff= (0:(NN-1))*(44100/NN);
kDmfa= abs(fft(kDm,NN));

plot(bff(1:300), kDmfa(1:300)); grid on; xlabel('Hz')


