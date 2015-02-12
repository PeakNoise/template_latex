%% nettoyage
close all; clear; clc;

%% paramètre
fe = 12000;
h = 1/fe;
Tmv = 1.6e-3;

fig = 0;
%% chargement
data = load('comparaison_omega_omegaf_avecSinus.dat');

omega = data(:,3);
omegaf = data(:,5);

N = length(omega);
t = linspace(0,N/fe,N)*1000;
%% filtrage theorique

b = [(1-exp(-h/Tmv))];
a= [1, (-exp(-h/Tmv))];
omegaf_theo = filter(b,a,omega);

%% Affichage
fig = fig +1;
figure(fig);
plot(t,[omega,omegaf,omegaf_theo]);
xlabel('t [ms]');
ylabel('\omega [rad/s]');
legend('omega','omegaf mesuré','omegaf théo');
grid on;
axis tight;
