clear;clc;close all

BB=64;
NN=20000;
%pH=0.6;
pH=1;

MM = BB*NN;

kSaRaw = randn(BB,1); kSbRaw=rand(BB,1);
kSam=kSaRaw-mean(kSaRaw); kSbm=kSbRaw-mean(kSbRaw);
kSa=kSam/sqrt(kSam'*kSam);
kSbo=kSbm-(kSbm'*kSa)*kSa;
kSb=kSbo/sqrt(kSbo'*kSbo);

kMb=(rand(NN,1)<pH);

kMx=zeros(MM,1);

for nn=1:NN
   if kMb(nn)
       kTTb=kSb;
   else
       kTTb=kSa;
   end
   qStart=1+(nn-1)*BB;
   qEnd=qStart+BB-1;
   kMx(qStart:qEnd)=kTTb;
end

save MxFull kMx kSa kSb kMb
save Mx kMx kSa kSb

stem(kMx(1:BB));hold on; plot(kSa,'r.'); plot(kSb,'g.');