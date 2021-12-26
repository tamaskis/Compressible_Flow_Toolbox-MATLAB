clear;clc;

T0 = rayleigh_sonic(0,'T/T*')
T1 = rayleigh_sonic(1,'T/T*')

P0 = rayleigh_sonic(0,'P/P*')
P1 = rayleigh_sonic(1,'P/P*')

rho0 = rayleigh_sonic(0,'rho/rho*')
rho1 = rayleigh_sonic(1,'rho/rho*')

U0 = rayleigh_sonic(0,'U/U*')
U1 = rayleigh_sonic(1,'U/U*')

a0 = rayleigh_sonic(0,'a/a*')
a1 = rayleigh_sonic(1,'a/a*')

h0 = rayleigh_sonic(0,'h/h*')
h1 = rayleigh_sonic(1,'h/h*')

Tt0 = rayleigh_sonic(0,'Tt/Tt*')
Tt1 = rayleigh_sonic(1,'Tt/Tt*')

Pt0 = rayleigh_sonic(0,'Pt/Pt*')
Pt1 = rayleigh_sonic(1,'Pt/Pt*')

rhot0 = rayleigh_sonic(0,'rhot/rhot*')
rhot1 = rayleigh_sonic(1,'rhot/rhot*')

at0 = rayleigh_sonic(0,'at/at*')
at1 = rayleigh_sonic(1,'at/at*')

ht0 = rayleigh_sonic(0,'ht/ht*')
ht1 = rayleigh_sonic(1,'ht/ht*')

ds0 = rayleigh_sonic(0,'(s-s*)/cp')
ds1 = rayleigh_sonic(1,'(s-s*)/cp')

M = 0:0.01:1;
rho = rayleigh_sonic(M,'rho/rho*');
plot(M,rho)