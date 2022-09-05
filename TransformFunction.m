A = [64.11];
B =[1 36.42 0];
Plant = tf(A,B);
C=[1 0.05];
D=[1 0.0088];
lag = tf(C,D);
PID= feedback(lag * Plant ,1);
syms Kp Kd Ki N
NPID_num=[Kp+N*Kd Kp*N+Ki N*Ki];
NPID_den=[1 N 0];
eqn1=PID.Numerator{1}(1)==NPID_num(1);
eqn2=PID.Numerator{1}(2)==NPID_num(2);
eqn3=PID.Numerator{1}(3)==NPID_num(3);
eqn4=PID.Denominator{1}(2)==NPID_den(2);
solx=vpasolve([eqn1 eqn2 eqn3 eqn4]);
Kp=subs(Kp,solx.Kp)
Kd=subs(Kd,solx.Kd)
Ki=subs(Ki,solx.Ki)
N=subs(N,solx.N)
%% %% try
den =[1 0];
num =[2];
plant =tf(num,den);
den1 =[1 1];
num1 =[ 1];
C1=tf(num1,den1)
cl1 = feedback (plant,C1 ,1)
%% 
K = tf([1],[1 1]) ;
G = tf([1],[1 0]);
H = feedback(G*K,1)


%% 


K = tf([1],[1 1]) ;
G = tf([1],[1 0]);
H2 = G/(1+G*K)
zpk(H2)
%%
clear all;
clc
close all;
s = tf ('s');
plant = 64.11 / (s^2 + 36.42*s);
sys_without_lead = feedback(plant,1);
figure;
rlocus(plant);
figure;
step (sys_without_lead)
step_sys_without_lead = stepinfo (sys_without_lead);


pd=43.46*(s+75.21);  %%k(s+z)
%pd = pid (43.63*75.21,0,75.21);    %%pidsybtax=pid(kp,ki,kd,tf)
%pidTuner (P,'p')
sys = feedback(pd*plant,1);
t=0:0.1:10;
figure;
rlocus(pd*plant);
figure;
fig2=step(sys,t);
figure;
plot(fig2)