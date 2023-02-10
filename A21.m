home
clear
close all

z = [10 0];
n = [1 70];
G = tf(z, n)
w = logspace(-1,4, 200);
figure(1)
bode(G,'r',w)
grid on
title('Bodediagramm von G(s)')
