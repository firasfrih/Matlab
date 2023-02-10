home
clear
close all

z = [4 13 20];
n = conv([2 0 8],[1 1]);
G2 = tf(z, n)
tf2vn(z, n);
[betrag,phase,w] = bode(G2);
betrag=reshape(betrag,[1,length(w)]);
phi=reshape(phase,[1,length(w)]);
bdB=20*log10(betrag);


tf2vn(z, n);
G2a = tf(2.5,1);
s = tf('s');
G2b = (1 + 2*0.72672*0.44721*s + 0.2*s^2);
G2c = 1/(1 + 2*8.3267e-017*0.5*s + 0.25*s^2);
G2d = 1/(1 + s);
figure(1)
bode(G2a,'r',G2b,'b',G2c,'g',G2d,'y', G2, 'c', w);
grid on
title('Zerlegung von G2 in Elementarsysteme (cyan = Gesamtsystem)')
