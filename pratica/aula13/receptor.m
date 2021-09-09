clear;clc;close all;

load MxFull
BB=numel(kSa);
MM=numel(kMx);

NN=fix(MM/BB);

kMbOut = -ones(NN,1);
kMx=awgn(kMx,0.01);
for nn =1:NN
   qStart=1+(nn-1)*BB;
   qEnd=qStart+BB-1;
   kTTb= kMx(qStart:qEnd);
   if(kTTb'*kSa)>(kTTb'*kSb)
       kMbOut(nn)=0;
   else
       kMbOut(nn)=1;
   end
end

disp(sum(kMbOut == -1));
disp(sum(kMbOut == kMb));