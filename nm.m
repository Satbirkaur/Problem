clc;
clear all;

load ini.mat

disp('Bearing Capacity Based on Standard Penetration Test Value')
disp('AS per I.S.Code - 6403:1981')
fprintf('\n');
Dw;
 
Table(:,1)= spt(:,1);
Table(:,2)= spt(:,2);

%%Overburden Pressure

%% 8 is the number of rows in spt table from ini.mat file
%% i represents the row of spt table

for i=1:8

if Dw>=spt(i,2)
Table(i,3)=spt(i,2)*gamma;
elseif Dw<spt(i,2)
Table(i,3)=(spt(i,2)*gamma)+((gamma-10)*(spt(i,2)-Dw));
endif
endfor
Table

