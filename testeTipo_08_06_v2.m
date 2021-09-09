%FUNCIONA SABENDO A WAVELET

clc; clear; close all

kMx = importdata('kRra.mat');   %OU KRRB, Krb1, krb2 (da com kRra e mkonds40)
kS = importdata('mkOnds40.mat');
kSaRaw = kS.kOndH;
kSbRaw = kS.kOndL;

kSa = kSaRaw/sqrt(kSaRaw'*kSaRaw);
kSb = kSbRaw/sqrt(kSbRaw'*kSbRaw);

BB = numel(kSa);
MM = numel(kMx);
NN = fix(MM/BB);

kMbOut = -ones(NN,1);
for nn= 1:NN                               
    qStart= 1+(nn-1)*BB;    %PODE SER NECESSÁRIO METER O 1o BIT DIFERENTE          
    qEnd= qStart+BB-1;
    kTTb= kMx(qStart:qEnd);      
    if (kTTb'*kSa) > (kTTb'*kSb)      
        kMbOut(nn)=1;
    else
        kMbOut(nn)=0;
    end    
end

strRecieved = kMbOut;

%Resultado: visualizar a string
Nchars = NN/8;
strByte = zeros(round(Nchars),1);
for aux=1:Nchars
    currByte = 0;
    currByte = currByte + strRecieved((aux-1)*8+1) * 2^7;
    currByte = currByte + strRecieved((aux-1)*8+2) * 2^6;
    currByte = currByte + strRecieved((aux-1)*8+3) * 2^5;
    currByte = currByte + strRecieved((aux-1)*8+4) * 2^4;
    currByte = currByte + strRecieved((aux-1)*8+5) * 2^3;
    currByte = currByte + strRecieved((aux-1)*8+6) * 2^2;
    currByte = currByte + strRecieved((aux-1)*8+7) * 2^1;
    currByte = currByte + strRecieved((aux-1)*8+8) * 2^0;
    strByte(aux) = currByte;
end

strDecod = char(strByte);
disp(strDecod');

%Para kRrb e mkOnds40 nao da