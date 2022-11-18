clear
home 
close all
dt = 1e-3;      % Zeitauflösung
t = -7:dt:7;    % Zeitvektor definieren


s1 = sigma(t-1)-sigma(t-3);
subplot(3,1,1)
plot(t,s1,'g','LineWidth',2)
grid
title('s1)')

s2 = sigma(t-2)-2.*sigma(t-3)+sigma(t-4);
subplot(3,1,2)
plot(t,s2,'g','LineWidth',2)
grid
title('s2)')

t1 = -14 :dt:14;
E = dt * conv(flip(s1),s2);
subplot(3,1,3)
plot(t1,E,'g','LineWidth',2)
grid
title('Energie')