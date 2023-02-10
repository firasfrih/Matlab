home
clear
close all

z3 = [200 0];
n3 = [1 402 800];
disp('G3')
G3 = tf(z3, n3)

disp('V-Normalform')
tf2vn(z3, n3)

w = logspace(-2, 2, 500);
figure(1)
bode(G3, w)
grid on
title('Bodediagramm von G(s)')