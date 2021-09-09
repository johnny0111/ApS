clear,clc;
kMx= importdata('kRrA.mat');
kS= importdata('mkOnds40.mat');
%kSaRaw = kMx(41:80);
%plot(conv(kMx,flip(kSaRaw)))
kSaRaw=kS.kOndH;

kSbRaw=kS.kOndL;
%kSbRaw=kMx(241:280);

kSa=kSaRaw/sqrt(kSaRaw'*kSaRaw);
kSb=kSbRaw/sqrt(kSbRaw'*kSbRaw);

BB=numel(kSa);
MM=numel(kMx);
NN=fix(MM/BB);


kMbOut = -ones(NN,1);
for nn =1:NN
   qStart=1+(nn-1)*BB;
   qEnd=qStart+BB-1;
   kTTb= kMx(qStart:qEnd);
   if(kTTb'*kSa)>(kTTb'*kSb)
       kMbOut(nn)=1;
   else
       kMbOut(nn)=0;
   end
end

StrRecieved = kMbOut;
NChars= NN/8;
strByte = zeros(round(NChars),1);

for aux= 1:NChars
    currByte=0;
    currByte= currByte + StrRecieved((aux-1)*8+1) * 2^7;
    currByte= currByte + StrRecieved((aux-1)*8+2) * 2^6;
    currByte= currByte + StrRecieved((aux-1)*8+3) * 2^5;
    currByte= currByte + StrRecieved((aux-1)*8+4) * 2^4;
    currByte= currByte + StrRecieved((aux-1)*8+5) * 2^3;
    currByte= currByte + StrRecieved((aux-1)*8+6) * 2^2;
    currByte= currByte + StrRecieved((aux-1)*8+7) * 2^1;
    currByte= currByte + StrRecieved((aux-1)*8+8) * 2^0;
    strByte(aux)=currByte; 
end

strDecod=char(strByte);
disp(strDecod');