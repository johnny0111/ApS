clc, clear all;
data = importdata('kUfs.mat')
fs = data.fs;
kU = data.kU;
 sound(kU,fs);
for n = 1:length(kU)
   kU(n) = ((-1)^n) *  kU(n);
end

sound(kU, fs);