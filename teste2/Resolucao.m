clear,clc;
%kMx= importdata('kRrA.mat');
kMx= importdata('kRrB.mat');
%%
%INSTRUÇÕES PARA A RESOLUÇÃO
%%%%%%%%%%%%%%%%%%EX1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%1-atribuir a BB o tamanho da ondula


%%%%%%%%%%%%%%%%%%EX2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1-tirar o comentário do ciclo for da linha 20, correr e observar o
%resultado na janela de comandos.
%2-Assim que se observar que a letra da musica apareceu na janela de
%comandos, interromper a execução do programa e retirar o index do ciclo,
%que corresponderá ao tamanho da ôndula.
%3-Atribuir a BB o tamanho da ôndula


%%
%for yy=1:200

%BB=38; %ex1
BB=42; %ex2
NN=numel(kMx)/BB;

%kSaRaw = kMx(BB+1:2*BB);
%kSbRaw = kMx(177:164);
%plot(conv(kMx,flip(kSaRaw)))
kSaRaw = -ones(BB,1);
kSbRaw = -ones(BB,1);
Hraw = kMx(1:BB);

for i = 1 : NN
    qStart = 1+(i -1)*BB;
    qEnd = qStart + BB -1;
    vAux = kMx(qStart : qEnd);
    auxH = Hraw'*vAux;
    if(auxH > 0.5)
        kSaRaw = kSaRaw + vAux;
    elseif (auxH < 0.5)
        kSbRaw  = kSbRaw + vAux;   
    end
end

kSa=kSaRaw/sqrt(kSaRaw'*kSaRaw);
kSb=kSbRaw/sqrt(kSbRaw'*kSbRaw);


kMbOut = -ones(1530,1);



for nn= 1:NN                               
    qStart= 1+(nn-1)*BB;             
    qEnd= qStart+BB-1;
    kTTb= kMx(qStart:qEnd);      
    if (kTTb'*kSa) > (kTTb'*kSb)      
        kMbOut(nn)=0;
    else
        kMbOut(nn)=1;
    end    
end

strRecieved = kMbOut;

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
%pause(0.1)
%disp(yy)
%end
