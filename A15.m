home
clear
close all
disp('G(s)')
z = [100];
n = [10 6 10.5 1];
G = tf(z, n)
disp('Zustandsform')
sys = ss(G);
[A b c d] = ssdata(sys)
