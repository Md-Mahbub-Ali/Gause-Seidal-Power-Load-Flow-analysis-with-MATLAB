clc 
clear all 
close all

%Schedule generation and loads and assumed bus voltage for sample power
%system

% Impedence
z12 = 0.02+0.04i;  
z13 = 0.01+0.03i;
z23 = 0.0125+0.025i;



% Admittance
y12 = 1/z12 ;
y13 = 1/z13 ;
y23 = 1/z23 ;

y11 = y12+y13;
y22=y12+y23;
y33=y13+y23;

y12=-y12;
y13=-y13;
y23=-y23;


% y21=-y12;
% y31=-y13;
% y32=-y23;
% y42=-y24;
% y43=-y34;






p2=-2.556; % (Pg/100)-(PL/100)
q2=-1.102i;
p3=-1.386;
q3=-0.452i;


v1=1.05;
v2=1+0i;
v3=1+0i;


iter = 0;


for k = 0:1 %required iteration number
    
    iter = iter +1
    
    v2 = (((p2-q2)/conj(v2)-(y12*v1)-(y23*v3)))/(y22)
    v22 = [abs(v2)  (angle(v2))*(180/pi)]
    v3 = (((p3-q3)/conj(v3))-((y13*v1)+(y23*v2)))/(y33)
    v33= [abs(v3)  (angle(v3))*(180/pi)] % showing in Polar Form
    
end