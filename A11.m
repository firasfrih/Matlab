%AUFGABE11
home
clear
close all

dt = 0.2;
tendezeit = 20;
t = 0:dt:tendezeit;
s = 3*(sigma(t)-sigma(t-2));
df = 1/tendezeit;
fmax = 1/dt/2;
f = -fmax:df:fmax;


y = dt*conv(s,s);
y = y(1:length(s)); 
Y = fftshift(fft(y)*dt);

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