clear all, close all, clc;
data = importdata('Aula25Mar.mat');
kRr = data.kRr;
qTs = data.qTs;

 qTT = (length(kRr)-1)*qTs; %duração do sinal
 btt = 0:qTs:qTT; %contrução do vector de tempo
 figure();
 plot(btt,kRr);
 title('Gráfico tempo-amplitude do sinal')
 xlabel('t(s)')
 ylabel('Amplitude')
 

dft = abs(fft(kRr));
f = ((1/qTs) * 1/(length(kRr)) * (0:length(kRr)-1))'; %normalização das frequências
figure();
plot(f, 10*log10(dft)');
title('Espectro do sinal')
xlabel('f (Hz)')
ylabel('PdB')
