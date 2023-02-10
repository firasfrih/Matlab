home
clear
close all

disp('G1(s)')
z = [1 4];
n = [1 3];
G1 = tf(z, n)
figure(1)
step(G1)
grid
title('Impulsantwort 1')
figure(2)
pzmap(G1)
title('Nullstellen und Polstellen 1')
pause

disp('G2(s)')
z = [1 5 4];
n = [1 4 8 0];
G2 = tf(z, n)
figure(1)
step(G2)
grid
title('Impulsantwort 2')
figure(2)
pzmap(G2)
title('Nullstellen Polstellen 2')
pause

disp('G3(s)')
z = [2 3];
n = [1 2 -3];
G3 = tf(z, n)
figure(1)
step(G3)
grid
title('Impulsantwort 3')
figure(2)
pzmap(G3)
title('Nullstellen und Polstellen 3')
pause
