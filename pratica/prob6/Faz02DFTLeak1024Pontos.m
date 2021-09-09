clear
close all
clc
%
qNN= 1024;
qFs= 20;

bFreq= 0:0.05:(qFs/2);

ktt= ((0:63)')/qFs;
kff= qFs*( ((0:(qNN-1))')/qNN) ;

for ff= bFreq
    kSs= triang(length(ktt)).*cos(2*pi*ff*ktt);
    kSsfa= abs(fft(kSs, qNN));
    plot(kff, kSsfa); 
    title(sprintf('Cos com freq= %4.2f. Notar as freqs 1.25, 2.50, ...', ff));
    grid  on
    xlabel('Freq Hz');
    pause
end








