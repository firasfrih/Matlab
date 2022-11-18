%AUFGABE7
home 
clear
close all
dt = 1e-3;
t = -7:dt:7;
T = 2;
T0 = 4;
a = 5;

u = a.*[sigma(t)-sigma(t-T0)];
subplot(3,2,1)
plot(t,u,'g','LineWidth',3)
grid
title('u(t)')

u1 = a.*[sigma(t-T)-sigma(t-T-T0)];
subplot(3,2,2)
plot(t,u1,'g','LineWidth',3)
grid
title('u(t-T)')

t1 = -14:dt:14;
y = dt * conv(u,u1);
subplot(3,2,3)
plot(t1,y,'g','LineWidth',3)
grid
title('y(t)')
