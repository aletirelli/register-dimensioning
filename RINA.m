D=44.70; %[t]
g=9.81; %[m/s^2]
C_B=0.397;
L=20; %[m]
V=25; %[knots]
B=5; %[m]
T=1.100; %[m]
h_db=28*B+32*(T+10); %altezza minima double bottom in [mm]
%consideriamo valore minimo 700 mm come dice RINA

%Calcolo accelerazione verticale 
C_f=0.2+((0.6/(V/L^0.5))); %>= a 0.32, ma vedi calcolo S
S=0.65*C_f; %RINA dà un margine di 80% sul valore
a_cg=S*(V/L^0.5); %accelerazione verticale a LCG in [m/s^2]

%Calcolo momenti flettenti
C=6+0.02*L;
M_sh=85*C*L^2*B*(C_B+0.7)*10^-3; %momento flettente hogging acqua tranquilla
M_ss=63*C*L^2*B*(C_B+0.7)*10^-3; %momento flettente sagging acqua tranquilla
M_B_h=M_sh+0.95*S*C*L^2*B*C_B; %qui considero anche l'onda  [kN m]
M_B_s=M_ss+0.55*S*C*L^2*B*(C_B+0.7); %stessa cosa [kN m]

%Calcolo pressioni di progetto sul fondo
h_0=1.100; %ATTENZIONE RIVEDERE
a=0.036;  %ATTENZIONE RIVEDERE
C_s=10.27;  %ATTENZIONE RIVEDERE
F_1=1;  %ATTENZIONE RIVEDERE
F_L=0.90; %ATTENZIONE RIVEDERE
A_1=1;  %ATTENZIONE RIVEDERE
F_a=0.30-0.15*log10(1.43*A_1*T/D);
a_v=a_cg;
p1=0.24*L^0.5*(1-(h_0/2*T))+10*(h_0+a*L); %pressione 1 [kN/m^2]
p2=15*(1+a_v)*(D/(L*C_s))*g*F_L*F_1*F_a; %pressione 2 [kN/m^2]

%Calcolo pressioni di progetto sui fianchi
p=66.25*(a+0.024)*(0.15*L-h_0); %pressione in [kN/m^2]

%Spessori 
%ALLUMINIO 5086
eta=1; %coeff saldatura
R_02=100; %tensione snervamento 0.2% [N/mm^2]
K=110/(eta*R_02); %fattore K materiale
t_1=1.75*L^(1/3)*K^(0.5); %keel and bottom
t_2=1.50*L^(1/3)*K^(0.5); %Side
t_3=1.50*L^(1/3)*K^(0.5); %Open strenght deck
t_4=t_3-0.5; %Lower deck
t_5=t_1; 
t_6=t_5-1.5; %Watertight subdivision bulkhead
t_7=t_2-0.5; %tank bulkhead
t_8=t_2; %centre girder
t_9=2.3*L^(1/3)*K^(0.5); %floors and side girders
t_10=1.70*L^(1/3)*K^(0.5); 

%Moduli di resistenza fondo
k1=0.7; %perché p=p_2

