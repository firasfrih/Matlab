%AUFGABE610
home 
clear
close all

dt = 0.2;     % Zeitinkrement
te = 200;      % Endzeit (muss größer als Signallänge sein!)
t = 0:dt:te;   % Zeitvektor
s = 3*(sigma(t)-sigma(t-2));   % s(t)

df = 1/te;      % Frequenzauflösung
fmax = 1/dt/2;
f =-fmax:df:fmax; % Frequenzvektor
S = dt*fftshift(fft(s)); % Fast Fourier-Transformation berechnen
S = S.*exp(-j*2*pi*f*dt/2); % Kompensation der Phasenverschiebung dt/2 zwischen s(t) und s
subplot(3,1,1)
plot(t,s,'g','LineWidth',3)
title('s(t)')
grid
subplot(3,1,2)
plot(f,abs(S),'g','LineWidth',3)
title('abs(S(f))')
grid minor
subplot(3,1,3)
plot(f,angle(S),'g','LineWidth',3)
title('phi(S(f))')
grid minor
