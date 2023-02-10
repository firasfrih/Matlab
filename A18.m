home
clear
close all
disp('Übertragungsfunktion:')
s = tf('s');
G = (3*s+12)/((s^2+2*s+4)*(s+6))
pause
figure(1)
pzmap(G)
title('Nullstellen und Polstellen')
pause
disp('LT der Sprungantwort:')
H = 1/s * G 
pause
disp('Partialbruchzerlegung von H(s):')
[z,n] = tfdata(H);
z = z{1,1};
n = n{1,1};
[R P K] = residue(z, n)
pause
disp('Term mit zusätzlicher Polstelle bei s = -6 aus H(s) entfernen:')
H1 = H - R(1)/(s-P(1))
figure(2)
impulse(H, 'b', H1, 'r')
grid
title('Vergleich')
