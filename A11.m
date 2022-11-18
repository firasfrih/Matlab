%AUFGABE11
home
clear
close all

dt = 0.2;                      % Zeitinkrement
te = 200;                      % Endzeit (muss größer als Signallänge sein!)
t = 0:dt:te;                   % Zeitvektor
s = 3*(sigma(t)-sigma(t-2));   % s(t)
df = 1/te;                     % Frequenzauflösung
fmax = 1/dt/2;
f = -fmax:df:fmax;             % Frequenzvektor

y = 9*(t.*sigma(t) - 2*(t-2).*sigma(t-2) + (t-4).*sigma(t-4));

Y = fftshift(fft(y)*dt);       % Fast Fourier-Transformation berechnen
                              
% Keine Phasenkompensation zwischen y(t) und y erforderlich!
subplot(3,1,1)
plot(t,y,'g','LineWidth',3)
title('y(t)')
grid
subplot(3,1,2)
plot(f,abs(Y),'g','LineWidth',3)
title('Betrag von Y(f)')
grid minor
subplot(3,1,3)
plot(f,angle(Y),'g','LineWidth',3)
title('Winkel von Y(f)')
grid minor