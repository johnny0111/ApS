% clear
% clc
% close all
% 
% kk=0:19;
% k0=sin(2*pi*(1/40)*kk');
% % plot(kk,k0)
% 
% k1=-k0;
% km0=k0-mean(k0);
% ke0=km0/sqrt(km0'*km0);
% ke1=-ke0;
% 
% kd0 = flip(k0);
% kd1 = flip(k1);
% 
% strM=rand(10000,1)>0.5;
% kM=2*strM-1;
% 
% kS=zeros(200000,1);
% for nn=1:10000
%    
%         qStart = 1+20*(nn-1);
%         qEnd=qStart+19;
%         kS(qStart:qEnd)=kM(nn)*ke1;
% end

%% Aps 

clear
clc
%close all

kk=0:19;
k0=sin(2*pi*(1/40)*kk');
k1=-k0;

%% c)

km0=k0-mean(k0);
%bm0=km0';
kE0=km0/(sqrt(km0'*km0));

%% d) 

kE1=-kE0;

%sinal de média nula, inversos com centro em 0

%% e) Verificar se sao antipodais - os sinais têm sentidos opostos

ap = kE1'*kE0;

%% f) Filtros adaptados Kd0 e Kd1

kd0= flip(k0);
kd1= flip(k1);

%% String binária aleatória 10000 elementos

strM = rand(10000, 1) > 0.5 ;%10k linhas, 1 coluna
kM=2*strM-1; %Codificação com 1 e -1

%% Construir kS, sinal emitido com 10000*20 amostras

kS=zeros(200000,1);

for nn=1:10000
    qStart=1+20*(nn-1);
    qEnd=qStart+19; %20 casas
    kS(qStart:qEnd)=kM(nn)*kE0; %Põe a ondula correspondente em kS
end
alpha=linspace(0,1,200);
for i=1:length(alpha)-1
    kNoise = alpha(i)*randn(200000,1); %construção do vector de ruido gaussiano

    %% Sinal recebido, que vai ser o sinal a saida do receptor
    kR = kS + kNoise;

    %% String estimada a partir de kR

    kE0=conv(kR,kd0);
    kE1=conv(kR,kd1);
    kMe=0*kM;

    for nn=1:10000
        ee=nn*20;
        if(kE0(ee)>kE1(ee))
            kMe(nn)=1;
        else
            kMe(nn)=-1;
        end
    end
    %% relaçao sinal ruido      
    %0 erros > 8 dbs 
    %5000 < -20dbs

    wS=kS'*kS;
    wN=kNoise'*kNoise;
    snrDbs(i)=10*log10(wS/wN);

    P(i)=sum(kM~=kMe)/10000;

end
%% 
figure()
plot(snrDbs,P);
title('Evolução da probabilidade do erro com o SNR (antipodais)')
xlabel('SNR')
ylabel('Probabilidade de erro')
    

 


