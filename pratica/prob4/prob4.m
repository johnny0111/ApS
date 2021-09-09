clear all, close all, clc;
data = importdata('Aula30Mar.mat');
kRr = data.kRr;
qTs = data.qTs;


%tempo-amplitude
 qTT = (length(kRr)-1)*qTs; %duração do sinal
 btt = 0:qTs:qTT; %contrução do vector de tempo
 figure();
 plot(btt,kRr);
 title('Gráfico tempo-amplitude do sinal')
 xlabel('t(s)')
 ylabel('Amplitude')
 
 %abordagem espectral clássica
dft = abs(fft(kRr));
f = ((1/qTs) * 1/(length(kRr)) * (0:length(kRr)-1))'; %normalização das frequências
figure();
stem(f, 10*log10(dft)');
title('Espectro do sinal')
xlabel('f (Hz)')
ylabel('PdB')

pxx = pburg(kRr, 32, f, 1/qTs);
figure();
% plot(f,10*log10(pxx));
stem(f,pxx);
title('Burg estimation')
xlabel('f (Hz)')
ylabel('|P(f)|')


[pxx,~] = pcov(kRr,32,f,1/qTs);
figure();
stem(f,pxx);
title('covariance estimation')
xlabel('f (Hz)')
ylabel('|P(f)|')