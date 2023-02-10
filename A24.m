home 
clear
close all

T = 0.5;        % Abtastzeit
kmax = 5;
td = 0:T:kmax*T % diskreter Zeitvektor
u = 2*sigma(td) % zeitdiskretes Eingangssignal

y(1) = 0;
for i = 1:kmax
    y(i+1) = (1-T)*y(i) + T*u(i);   % Differenzengleichung nach manueller Diskretisierung
end
stem(td,y)     % zeichnen der Abtastfolge
hold on
grid

% Vergleich mit zeitkontinuierlichem System:
A=[-1];         % Systemmatrix
b=[1];          % Eingangsvektor
c=[1];          % Ausgangsvektor
d=0;            % Durchgangsfaktor
disp('zeitkontinuierliche Zustandsform des Systems:')
sys = ss(A,b,c,d)   % LTI-Objekt aus Zustandsform erzeugen
t = 0:0.01:kmax*T;
h = 2*step(sys,t);
plot(t,h,'r')
