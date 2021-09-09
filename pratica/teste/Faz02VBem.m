close all
clear
clc
%
load('VBem.mat')
sound(kSs, fs)
close all;spectrogram(kSs,512,0, 'yaxis')


