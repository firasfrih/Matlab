home
clear
close all


z = [400 0];
n = conv([1 2],[2 800]);
G2 = tf(z, n)
tf2vn(z, n);
[betrag,phase,w] = bode(G2);
betrag=reshape(betrag,[1,length(w)]);
phi=reshape(phase,[1,length(w)]);
bdB=20*log10(betrag);


tf2vn(z, n);
G2a = tf(0.25);
s = tf('s');
G2b = 1/(1 + (s/2));
G2c = 1/(1 + (s/400));
G2d = s;
figure(1)
bode(G2a,'r',G2b,'b',G2c,'g',G2d ,'c', G2, 'k', w);
grid on
title('Zerlegung von G2 in Elementarsysteme (black = Gesamtsystem)')
