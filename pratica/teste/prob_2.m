clear all, clc, close all;
data = importdata('kVfs.mat');
kV = data.kV;
fs = data.fs;
F = [0 .0798 .0799 .0800 .0801 .1615 .1616 .1617 .1618  .1619  1];
A = [1  1    .5      0     .5    1      .5    0     .5     1     1];

bhi = fir2(1024*10,F, A);
L = length(kV);
n=[0:L-1];
filtered = filter(bhi,1,kV);
dft = fft(filtered);

%f = (fs/L)*(n(1:L));
f = 2*n/L;
figure();
plot(f,abs(fft(kV)));
figure();
plot(f,abs(dft));


figure(3); 
freqz(bhi); 
%filtered = filter(filtro,1,10*log10(magnitude));