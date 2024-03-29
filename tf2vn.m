function tf2vn(zaehler,nenner)
 

[nl,pol,kf]=tf2zp(zaehler,nenner);  

Vzg=1;				                % Gesamtverstaerkungsfaktor Zaehler.
Vng=1;				                % Gesamtverstaerkungsfaktor Nenner.
k=0;				                % k-Faktor derLinenearfaktoren ohne 
			 	                    % Absolutglied.
m=length(nl);                       % Zaehlergrad.
n=length(pol);                      % Nennergrad.
Tdz=zeros(m,2);                     % siehe help-Text
Tdn=zeros(n,2);                     % siehe help-Text
x=0;                                % Merker zur Berechnung von V, 
				                    % da die Funktion tf2zp komplexe Nullstellen
				                    % doppelt darstellt, muß eine zur Berechnung
				                    % von V eliminiert werden.

for i=1:m 
    if abs(imag(nl(i))) <= 1.e-4, 
    end     
end

for i=1:n
    if abs(imag(pol(i))) <= 1.e-4,  % Der Algorithmus tf2zp arbeitet ungenau.
    pol(i)=real(pol(i));            % In der if-Schleife werden daher
    end                             % Imaginärteile der Nennernullstellen,
end                                 % die kleiner als 1.e-4 sind, reel gemacht.

% Berechnung des Zählers
merk=0;                             % Initialisierung eines Merkers:
                                    % 0: Zähler ist rein proportional,
                                    % 1: Zähler enthält Dynamikanteile
Vn=1;                               % Initialisierungfür den (seltenen)
% rein proportionalen Fall.
no_d=1;                             % Merker für "es exisitiert kein
                                    % Dämpfungsfaktor";
for i=1:1:m,
    a=real(nl(i));
    b=imag(nl(i));
       if a==0,
	  if b==0, 
	  % Realteil=0, Imaginärteil=0
	  k=k-1;                        % k-Faktor im Zähler
	  Vz(i)=1;                      % Zählerverstärkungsfaktor
	  Tdz(i,2)=no_d;                % kein Dämpfungsfaktor definiert
	  else
	   % Realteil=0, Imaginärteil/=0
	     if x==1,
	     Vz(i)=1;                   % Zählerverstärkungsfaktor
	     x=0;                       % nicht doppelt berechnen
	     else
	     Vz(i)=b^2;                 % Zählerverstärkungsfaktor
	     x=1;
	     end
	  Tdz(i,1)=sqrt(1/b^2);         % Vorhaltzeitkonstante
	  end
       else
	  if b==0,
	  % Realteil/=0, Imaginärteil=0
	  Vz(i)=abs(a);                 % Zählerverstärkungsfaktor
	  Tdz(i,1)=-1/a;                % Vorhaltzeitkonstante 
	  Tdz(i,2)=no_d;                % kein Dämpfungsfaktor definiert             
	  else
	  % Realteil/=0, Imaginärteil/=0
	     if x==1,
	     Vz(i)=1;                   % Zählerverstärkungsfaktor
	     x=0;                       % nicht doppelt berechnen
	     else
	     Vz(i)=a^2+b^2;             % Zählerverstärkungsfaktor
	     x=1;
	     end
	  Tdz(i,1)=sqrt(1/(a^2+b^2));   % Vorhaltzeitkonstante
	  Tdz(i,2)=-a/sqrt(a^2+b^2);    % Dämpfungsfaktor
	  end
  end
  merk=1;                           % Zähler enthält Dynamikanteile

end


% Berechnung des Nenners

for i=1:1:n,
    a=real(pol(i));
    b=imag(pol(i));
    if a==0,
	  if b==0, 
	  % Realteil=0, Imaginärteil=0
	  k=k+1;                        % k-Faktor des Nenners
     Vn(i)=1;                       % Nennerverstärkungsfaktor
     Tdn(i,2)=no_d;                 % kein Dämpfungsfaktor definiert
     else
	  % Realteil=0, Imaginärteil/=0
	     if x==1,
	     Vn(i)=1;                   % Nennerverstärkungsfaktor
	     x=0;                       % nicht doppelt berechnen
	     else
	     Vn(i)=b^2;                 % Nennerverstärkungsfaktor
	     x=1;
	     end
	  Tdn(i,1)=sqrt(1/b^2);         % Verzögerungszeitkonstante
	  end
       else
	  if b==0,
	  % Realteil/=0, Imaginärteil=0 
	  Vn(i)=abs(a);                 % Nennerverstärkungsfaktor
	  Tdn(i,1)=-1/a;                % Verzögerungszeitkonstante
	  Tdn(i,2)=no_d;                % kein Dämpfungsfaktor definiert
	  else
	  % Realteil/=0, Imaginärteil/=0 
	     if x==1,
	     Vn(i)=1;                   % Nennerverstärkungsfaktor
	     x=0;                       % nicht doppelt berechnen
	     else
	     Vn(i)=a^2+b^2;             % Nennerverstärkungsfaktor
	     x=1;
	     end
	  Tdn(i,1)=sqrt(1/(a^2+b^2));   % Verzögerungszeitkonstante
	  Tdn(i,2)=-a/sqrt(a^2+b^2);    % Dämpfungsfaktor
	  end
       end
end
if merk==0 
Vz=1; 
end
Vzg=prod(Vz);  
Vng=prod(Vn);
V=abs(kf*Vzg/Vng);
disp(' ')
disp(' ')
disp('                                                          2   2')
disp('                    (1 + T  *s)* ... *(1 + 2*d  *T  *s + T  *s )* ... ')
disp('               1          1z                  2z  2z      2z')          
disp('   G(s) = V * --- * --------------------------------------------------')
disp('                                                          2   2')
disp('              s^k   (1 + T  *s)* ... *(1 + 2*d  *T  *s + T  *s )* ... ')
disp('                          1n                  2n  2n      2n')
disp(' ')
disp(' ')
disp(['   Verstärkungsfaktor: V = ',num2str(V)])
disp(' ')
disp(['   Globalverhalten:    k = ',num2str(k)])
disp(' ')
disp('   Zählerdynamik: Z(s)= ')
disp(' ')

merk=[0,0];   
for i=1:m 
if Tdz(i,1)~=0
if Tdz(i,2)~=no_d
if Tdz(i,:)~=merk
disp(['   (1 + 2*',num2str(Tdz(i,2)),'*',num2str(Tdz(i,1)),'*s + ',num2str(Tdz(i,1)^2),'*s^2)'])
merk=Tdz(i,:);
else
end
else
disp(['   (1 + ',num2str(Tdz(i,1)),'*s)'])
end                    
end
end
disp(' ')
disp('   Nennerdynamik: N(s)= ')
disp(' ')

merk=[0,0];                     
for i=1:n 
if Tdn(i,1)~=0  
if Tdn(i,2)~=no_d 
disp(['   (1 + 2*',num2str(Tdn(i,2)),'*',num2str(Tdn(i,1)),'*s + ',num2str(Tdn(i,1)^2),'*s^2)'])
merk=Tdn(i,:);
else
end
else
disp(['   (1 + ',num2str(Tdn(i,1)),'*s)'])
end         
end
end