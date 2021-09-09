clc, clear all;
data = importdata('kA15.mat')
fs = data.fs;
kU = data.kA02;
fig = figure();
plot(abs(fft(kU)));
hold on;
for n = 1:length(kU)
   kU(n) = ((-1)^n) *  kU(n);
end
plot(abs(fft(kU)));

