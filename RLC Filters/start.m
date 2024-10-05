close all
clear all 


%declaram si initializam  variabilele de intrare  

R=100;
L=1e-3;
C=1e-6;
%selectare_circuit=1;
tip=1;
alegere = 2;
tipr = 2;
tipc = 1;
valr = 3;

interfata1(R,L,C,tip, alegere, tipr, valr, tipc);
find_obj;
calcul_plot;