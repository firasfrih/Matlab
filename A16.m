home
clear
close all

z1 = [1 2];
n1 = [1 4 3 0];
disp('G1')
G1 = tf(z1, n1)
disp('Produktform')
[null pol k] = tf2zp(z1, n1)
disp('Partialbruchform:')
[R P K] = residue(z1, n1)
disp('V-Normalform')
tf2vn(z1, n1)


z2 = [4 20 24];
n2 = [2 8 16 0];
disp('G2')
G2 = tf(z2, n2)
disp('Produktform:')
[null pol k] = tf2zp(z2, n2)
disp('Partialbruchform')
[R P K] = residue(z2, n2)
disp('V-Normalform')
tf2vn(z2, n2)


z3 = [1];
n3 = [1 1 0 0];
disp('G3')
G3 = tf(z3, n3)
disp('Produktform')
[null pol k] = tf2zp(z3, n3)
disp('Partialbruchform')
[R P K] = residue(z3, n3)
disp('V-Normalform')
tf2vn(z3, n3)
