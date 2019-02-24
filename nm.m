clc;
clear all;

load ini.mat

format shortg
disp('Bearing Capacity Based on Standard Penetration Test Value')
disp('AS per I.S.Code - 6403:1981')
fprintf('\n');
Dw;

disp('S.No Depth(m) Overburden Pressure(kN/m2) correction Factor N N''')

%% 8 is the number of rows in spt table from ini.mat file
%% i represents the row of spt table

for i=1:1:8
%% Sr. number
Table(:,1)= spt(:,1);
%% Depth m
Table(:,2)= spt(:,2);

%% Overburden Pressure
if Dw>=spt(i,2)
Table(i,3)=spt(i,2)*gamma;
elseif Dw<spt(i,2)
Table(i,3)=(Dw*gamma)+((gamma-10)*(spt(i,2)-Dw));
endif


%% correction factor Cn
Table(i,4)=(0.77)*(log10(2000/Table(i,3)));

%% observed N value
Table(i,5)= spt(i,3);

%% N_1 correction
Table(i,6)= (spt(i,3))*(Table(i,4));


endfor

disp( num2str(Table));

