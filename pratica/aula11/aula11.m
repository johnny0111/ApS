kSs1 = importdata('kSs1.mat');
tt=0:5;
bex=(1/sqrt(3))*sin(2*pi*tt/6);
bey=(1/sqrt(3))*cos(2*pi*tt/6);

b00=(1/sqrt(2)) * (bex+bey);
b01=(1/sqrt(2)) * (bex-bey);
b10=(1/sqrt(2)) * (-bex+bey);
b11=(1/sqrt(2)) * (-bex-bey);

c_b00 = conv(flip(b00),kSs1);
c_b01 = conv(flip(b01),kSs1);
c_b10 = conv(flip(b10),kSs1);
c_b11 = conv(flip(b11),kSs1);

figure();
stem(c_b00);
title('Correlação com b00')
figure();
stem(c_b01);
title('Correlação com b01')
figure();
stem(c_b10);
title('Correlação com b10')
figure();
stem(c_b11);
title('Correlação com b11')
