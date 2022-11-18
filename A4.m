%AUFGABE 4
home 
clear
close all
dt = 1e-3;
t = -7:dt:7; 
T = 2;

s1 = sigma(t).*exp(-t/T);
subplot(3,2,1)
plot(t,s1,'g','LineWidth',3)
grid
title('s1')
E1 = dt * sum(s1.^2)

s2 = sigma((0.5*t)-T);
subplot(3,2,2)
plot(t,s2,'g','LineWidth',3)
grid
title('s2')

s3 = (t-T).*sigma(t-T);
subplot(3,2,3)
plot(t,s3,'g','LineWidth',3)
grid
title('s3')

s4 = [sigma(t)-sigma(t-4)].*cos(((2*pi)/8)*(t-2));
subplot(3,2,4)
plot(t,s4,'g','LineWidth',3)
grid
title('s4')
E4 = dt * sum(s4.^2)

s5 = sigma(T-t);
subplot(3,2,5)
plot(t,s5,'g','LineWidth',3)
grid
title('s5')

s6 = sigma(1-t.^2).*2;
subplot(3,2,6)
plot(t,s6,'g','LineWidth',3)
grid
title('s6')
E6 = dt * sum(s6.^2)
