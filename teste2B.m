clear;clc;close all;
%Alexandre Gabriel 50700 Resposta aos B
load kRrB
NN= numel(kRr);


BYTELEN= 8;
fi= fopen('Textrecoded2.txt','w');

for yy = 1 : 1000
    MM = fix(NN /yy);


    vHraw = zeros(yy,1);
    vLraw = zeros(yy,1);
    Hraw = kRr(1:yy);
    for ii = 1 : MM
        qStart = 1+(ii -1)*yy;
        qEnd = qStart + yy -1;
        vAux = kRr(qStart : qEnd);
        auxH = Hraw'*vAux;
        if(auxH > 0.5)
            vHraw = vHraw + vAux;
        elseif (auxH < 0.5)
            vLraw  = vLraw + vAux;   
        end
    end

    vHe = vHraw/sqrt(vHraw'*vHraw);
    vLe = vLraw/sqrt(vLraw'*vLraw);


    convH = conv (kRr,flip(vLe));
    convL = conv (kRr,flip(vHe));


    strMe = ones(MM,1);
    for nn=1:MM
        qStart = 1+(nn -1)*yy;
        qEnd = qStart + yy -1;
        if((convL(qEnd)) > (convH(qEnd)))
            strMe(nn) = 0;
        else
            strMe(nn) = 1;
        end
    end

    HHMM = numel(  strMe);
    MM = fix(HHMM/BYTELEN);
    Data_out2 = -ones(MM,1);
    Countk = 0;
    for nn= 1:MM
        DecByte = 0;
        qStart= 1+(nn-1)*BYTELEN;
        qEnd= qStart+BYTELEN-1;
        kStrBits = flip(strMe(qStart:qEnd));
        for hh = 0 : (BYTELEN -1)
            if (kStrBits(hh +1) == 1)
                DecByte = DecByte + 2.^hh;
            end
        end
        if ((DecByte < 172 && DecByte > 96) || (DecByte < 91 && DecByte > 64) || DecByte == 32 || DecByte == 39)
            Data_out2(nn) = char(DecByte);
            fprintf(fi,'%c',Data_out2(nn));
            Countk = Countk + 1;
        end
    end
    
    if (Countk > 100)
        break;
    end
   
end
save Data_out2 Data_out2