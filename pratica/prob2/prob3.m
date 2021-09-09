clear all, close all, clc;
data = importdata('Aula25Mar.mat');
kRr = data.kRr;
qTs = data.qTs;

qTT = length(kRr)*qTs;
btt = 0:qTs:qTT;

dft = abs(fft(kRr));
f = (1/qTs) * 1/(length(kRr)-1) * (0:length(kRr)-1);
plot(f, 10*log10(dft));
