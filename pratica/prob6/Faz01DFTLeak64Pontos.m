clear
close all
clc
%
qNN= 64;
qFs= 20;
n=[0:qNN-1];
bFreq= 0:0.05:(qFs/2);

ktt= ((0:63)')/qFs;
%kff= qFs*( ((0:(qNN-1))')/qNN) ;
kff=2*n/qNN;
for ff= bFreq
    kSs= triang(length(ktt)).*cos(2*pi*ff*ktt);
    %kSs= cos(2*pi*ff*ktt);
    kSsfa= abs(fft(kSs));
    stem(kff, kSsfa); 
    title(sprintf('Cos com freq= %4.2f. Notar as freqs 1.25, 2.50, ...', ff));
    grid  on
    xlabel('Freq Hz');
    pause
end








