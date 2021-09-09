clear
close all
clc
%
% Code to plot the maximum value of the
% DFT of 40 points taken on a pure sine wave with
% frequencies between 20 Hz and 80 Hz.
% The sampling frequency is 400 Hz. 
% rtrato.a.fct.unl.pt - 2021

qFs= 400;
qTs= 1/qFs;

qNN= 40;
bnn=0:(qNN-1);
ktt= qTs*bnn';

qZeroPadExp= 1;
kFf= (qFs*(0:(qZeroPadExp*qNN-1))')./(qZeroPadExp*qNN);

for ff=20:0.1:80
    kSs= sin(2*pi*ff*ktt);
    kSsf= abs(fft(kSs, qNN*qZeroPadExp));
    
    kSsfH= kSsf(1:(qNN));
    kFfH= kFf(1:(qNN));
    qMax= max(kSsfH);
    
    % Signal
    subplot(3,1,1);
    plot(ktt,kSs); grid on;
    title('Freqs 20Hz -- 80Hz (Fs= 400Hz)')
    ylabel(sprintf('Freq= %3.1f', ff));
    axis([ 0 0.1 -1.1 1.1]);
    xlabel('Seconds')    
    
    % abs(DFT) - linear units
    subplot(3,1,2);
    stem(kFfH, kSsfH,'.');
    axis([0 max(kFfH) 0 25]);
    xlabel('Freq');
    ylabel('abs(DFT)')

    % Scalloping loss - Perda espectral 
    subplot(3,1,3)
    hold on;
    plot(ff, qMax, '.r');
    hold off;
    axis([20 80 10 25]);
    xlabel('Freq');
    ylabel('Max DFT');
    grid on;
    
    pause(0.01);
end

