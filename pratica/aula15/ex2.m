clear all, clc, close all;
data = importdata('Dados2.mat');
kSs2=data.kSs2;
SNR=data.SNRdBs;
MM=length(kSs2);
BB=14;
NN=fix(MM/BB);
kS1=kSs2(1:14);
k0B=zeros(MM,1);
k1B=zeros(MM,1);
for nn =1:NN
   qStart=1+(nn-1)*BB;
   qEnd=qStart+BB-1;
   kTTb= kSs2(qStart:qEnd);
   if(kTTb'*kS1)>0.7
       k0B=[k0B;kTTb];
   else
       k1B=[k1B;kTTb];
   end
end