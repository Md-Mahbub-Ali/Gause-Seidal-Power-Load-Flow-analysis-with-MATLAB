clc 
clear all 
close all
%For the power system shown in fig., with the data as given in tables below, 
%obtain the bus voltages at the end of first iteration, by applying GS method.


% Impedence
z12 = 0.05+0.15i;
z13 = 0.10+0.30i;
z23 = 0.15+0.45i;
z24 = 0.10+0.30i;
z34 = 0.05+0.15i;

% Admittance
y12 = 1/z12 
y13 = 1/z13 
y23 = 1/z23 
y24 = 1/z24 
y34 = 1/z34 

y11 = y12+y13;
y22=y12+y23+y24;
y33=y13+y23+y34;
y44=y34+y24;


%Y BUS MATRIX

y12=-y12;
y13=-y13;
y23=-y23;
y24=-y24;
y34=-y34;

% y21=-y12;
% y31=-y13;
% y32=-y23;
% y42=-y24;
% y43=-y34;

p2=0.5;
q2=-0.2i;
p3=-1;
q3=0.5i;
p4=0.3;
q4=-0.1;

v1=1.04+0i;
v2=1+0i;
v3=1+0i;
v4=1+0i;

iter = 0;

for k = 0:1
    
    iter = iter +1
    
    v2 = ((p2-q2)/conj(v2)-((y12)*v1)-(y23*v3)-(y24*v4))/(y22)
    v22 = [abs(v2)  (angle(v2))*(180/pi)]
    v3 = (((p3-q3)/conj(v3))-((y13*v1)+(y23*v2)+(y34*v4)))/(y33)
    v33= [abs(v3)  (angle(v3))*(180/pi)]
    v4 = (((p4-q4)/conj(v4))-((y34*v3)+(y24*v2)))/(y44)
    v44= [abs(v4)  (angle(v4))*(180/pi)]
    
end
