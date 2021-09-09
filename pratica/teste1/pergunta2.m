clc, clear all;
data = importdata('kE15.mat')
kE = data.kE02;
fs = data.fs;
L = length(kE);
n = [0:L-1];
% f = (fs/L)*(n(1:L));
F = [0 .0798 .0799 .0800 .0801 .1615 .1616 .1617 .1618  .1619  1];
A = [1  1    .5      0     .5    1      .5    0     .5     1     1];

bhi = fir2(1024*10,F, A);
L = length(kE);
n=[0:L-1];
filtered = filter(bhi,1,kE);
dft = fft(filtered);

%f = (fs/L)*(n(1:L));
f = 2*n/L;
figure();
plot(f,abs(fft(kE)));
figure();
plot(f,abs(dft));


figure(3); 
freqz(bhi); 



%a) 2 tons
%b) 443.5Hz e 891.5 Hz
%c) 891.5 Hz - 443.5Hz
