%%rrlocous for system
s=tf('s');
P=(s+1)/(s*(s+2)*(s+3));
rlocus (P)
%%bode
s=tf('s')
G=10;
bode (s/s)
grid minor
%%equation solver
syms z
w=.4*z*z+1.5*z+.8;
vpa(solve (w))
close all
syms zi
zi=solve(exp(-zi*pi/sqrt(1-zi^2))==.10)
vpa(zi);
%%Margin finding 
clear all;
clc
close all;
% num =[25 0 -17550];
% sys = tf(25  -17550,[1160 42570 5748180 22639500 350298000]);
% margin (sys)
% den =[1160 42570 5748180 22639500 350298000];
num =[25 0 -17550];
den =[1160 42570 5748180 22639500 350298000];
G=tf(num,den);
m = allmargin(G)
GainMargins_dB = mag2db(m.GainMargin)

%% nyquist
clear all;
clc
close all;
num =[25 0 -17550];
den =[1160 42570 5748180 22639500 350298000];
f=tf(num,den);
nyquist(f)


%% nyquist with another way
clear all;
clc
close all;
syms s w
G=(29*s^2 + 129*s + 1996)/(10*(116*s^4 + 4257*s^3 + 574818*s^2 + 2263950*s + 35029800)) - (4*s^2 + 129*s + 19546)/(10*(116*s^4 + 4257*s^3 + 574818*s^2 + 2263950*s + 35029800));
G_w=subs(G,s,j*w)
W =[-100:.01:100];
nyq = eval(subs(G_w,w,W));
x= real(nyq);
y= imag (nyq);

plot (x,y);
temp = sign(y);
temp1 = sign (x);
differences1=diff(temp1);
 differences = diff(temp);
%  indexes = find (differences ~= 0 )
  indexes = find (differences1 ~= 0 )

%  W(12307)
%  1/abs(x(12307))
 W(16996)
 1/abs (y(16996))
 %% step info plant
 clear all;
close all;
A = [64.11];
B =[1 36.42 0];
Plant = tf(A,B);
C=[1 0.05];
D=[1 0.0088];
lag = tf(C,D);
sys = feedback(lag * Plant ,1);
t = 0:0.1:10 ;
figure;
rlocus(Plant);
figure;
rlocus(lag*Plant);
figure2 = step (sys , t);
figure;
plot(figure2)
stepinfo(sys)

% % gain computing
F = [64.11];
G =[1 36.42 0];
Plant = tf(F,G);
stepinfo(plant)

A = [0 0 1 0; 0 0 0 1 ; 0 600 -35 0 ; 0 -1256 35 0];
B = [0 ;0 ;62 ;-62];
C = [1 0 0 0 ; 0 0 0 0];
D = [0 ; 0];
p =[-50;-50;-10+10i;-10-10i];
k=[12.2935 -43.2549 1.566 -0.2144];
Anew= A-B*k;
acker (A,B,p)

%% root
s=tf('s');
plant = (61.07*s^2+40120) / (s^4 + 34.69*s^3 + 1252*s^2+ 22790*s)
rlocus (plant)
can=canon (plant,'companion')
a_ccontrollable = can.a
% % diff system
clear all;
clc
close all;
s = tf ('s');
plant = (61.07 * s^2+ 40120)/(s^4 + 34.69*s^3 + 1252*s^2 + 22790*s);
G1= 5.6805 * plant;    %%kG
bode(G1);
T=0.118;
alpha = 0.6237;
k= 5.6805;
lead = k*(T*s+1)/(T*alpha*s+10);
figure;
bode (lead);
sys = lead *plant;
