home
clear
close all

w = logspace(-3, 3, 200);
G = tf([10 10],[10 1 0]);
figure(1)
bode(G, w)
grid on
title('Bodediagramm von G(s)')

