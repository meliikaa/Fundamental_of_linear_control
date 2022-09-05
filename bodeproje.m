clear all;
clc
close all;
%num =[1423.658 61217.29 7118.29 ];
%den =[1 53 454 1032];
den =[2];
num =[-];
f=tf(num,den);
rlocus(f)
%bode (f), grid
stepinfo(f)
%% 
%s=tf('s');
%g=(s+3)/(s*(s+4)*(s+6)*(s+9));

s = tf('s');          
G = s+1/((s^3)+(s^2*3.6)+(s+1)) 
rlocus(G)
stepinfo(G)
%% 
syms s
F = 1/(s^3-s^2);
ilaplace(F)
%% bode sade
clear all;
clc
close all;
num =[1];
den =[1 10 0 0];
plant=tf(num,den)
bode(plant)
margin (plant)
grid
%%bode tashih 
%bode(plant*Gc)
%% bode ta 
clear all;
clc
close all;
num =[1];
den =[1 10 0 0];
plant=tf(num,den);
bode(plant)
grid
%% poles and zeros
 num=[4 3];
den=[1 6 5];
sys=tf(num,den)
[p,z]=pzmap(sys)



%% net
den =[1 13 32 20];
num =[1];
plant =tf(num,den);
den1 =[1 0];
num1 =[1 0.1];
C1=tf(num1,den1)
cl1 = feedback (plant,C1)
pole(cl1)
%close_loop=plant/(1+plant*C1)
%% try
den =[1 2 6 0];
num =[1];
plant =tf(num,den);
den1 =[1 ];
num1 =[1 2];
C1=tf(num1,den1)
cl1 = feedback (plant*C1,1)
pole(cl1)
%% bode
n=[40];d=[1 2 0];
bode(tf(n,d));
grid
%bode tarmimi
nc= 3*[1 4.8];
dc=[1 14.5];
x= conv(nc,n);
y= conv(dc,d);

roots(x)
bode(x,y)
%% bode lag
num =[40]
den= [1 2 0]
g = tf (num , den)
bode (g)
grid
%% rank
A=[0 0 1 0;0 0 0 1; 0 600 -35 0;0 -1256 35 0];
B=[0; 0 ;62; -62];
rank(ctrb(A,B))