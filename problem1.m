clc 
clear all 
close all

% Impedence
z12 = 0.10+0.40i;  
z14 = 0.15+0.60i;
z15 = 0.05+0.20i;
z23 = 0.05+0.20i;
z24 = 0.10+0.40i;
z35 = 0.05+0.20i;

% Admittance
y12 = 1/z12 ;
y14 = 1/z14 ;
y15 = 1/z15 ;
y23 = 1/z23 ;
y24 = 1/z24 ;
y35 = 1/z35 ;

y11 = y12+y14+y15;
y22= y12+y23+y24;
y33= y23+y35;
y44= y14+y24;
y55 = y15+y35;

% y21=-y12;
% y31=-y13;
% y32=-y23;
% y42=-y24;
% y43=-y34;


% Y Bus Matrix

 y12=-y12;
 y14=-y14;
 y15=-y15;
 y23=-y23;
 y24=-y24;
 y35=-y35;

p2=-0.6;
q2=-0.3i;
p3=1;
%q3= not given;
p4=-0.4;
q4=-0.1;
p5=-0.6;
q5=-0.2;


v1=1.02+0i;
v2=1+0i;
v3=1.04;
v4=1+0i;
v5=1+0i;


iter = 0;

for k = 0:1  % iteration number
    
    iter = iter +1
    v2  = ((p2-q2)/conj(v2)-(y12*v1)-(y23*v3)-(y24*v4))/(y22)
    v22 = [abs(v2)  (angle(v2))*(180/pi)]
    
    q3 = (-imag((v3*v2*y23)+(v3*v5*y35)+(v3*v3*y33)))*i % Q3 need to be determined
    
    v3 = (((p3-q3)/conj(v3))-((y23*v2)+(y35*v5)))/(y33)    
    v33= [abs(1.04)  (angle(v3))*(180/pi)] % show in Polar Form
    v4 = (((p4-q4)/conj(v4))-((y14*v1)+(y24*v2)))/(y44)
    v44= [abs(v4)  (angle(v4))*(180/pi)]
    v5 = (((p5-q5)/conj(v5))-((y35*v3)+(y15*v1)))/(y55)
    v55= [abs(v5)  (angle(v5))*(180/pi)]
   
end
