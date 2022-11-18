%AUFGABE6
home 
clear
close all
dt = 1e-3;      % Zeitauflösung
t = -7:dt:7;    % Zeitvektor definieren
a = 5;
T0 = 4;
T = 2;

u = a.*[sigma(t)-sigma(t-T0)];
subplot(3,2,1)
plot(t,u,'g','LineWidth',3)
grid
title('u(t)')

g = ((1/T)*exp(-t/T)).*sigma(t);
subplot(3,2,2)
plot(t,g,'g','LineWidth',3)
grid
title('g(t)')

g1 = ((1/T)*exp(t/T)).*sigma(-t);
subplot(3,2,3)
plot(t,g1,'g','LineWidth',3)
grid
title('g(-t)')

g2 = ((1/T)*exp(-(T-t)/T)).*sigma(T-t);
subplot(3,2,4)
plot(t,g2,'g','LineWidth',3)
grid
title('g(T-t)')

t1 = -14:dt:14;
y = dt * conv(u,g);
subplot(3,2,5)
plot(t1,y,'g','LineWidth',3)
grid
title('y(t)')
