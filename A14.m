home 
clear
close all
A=[-5,1;1,0];
b=[1;-1];
c=[0,1];
d=0;
disp('Zustandsform des Systems:')
ss_sys = ss(A,b,c,d)
disp('G(s)')
tf_sys = tf(ss_sys)
[z1 n1] = tfdata(tf_sys);
disp('Zählerpolynom und Nennerpolynom')
z = z1{1,1}
n = n1{1,1}
