clear;
clc;
intTrap1= intTrap(@Atila29,1,3); %i call intTrap function which i create, for 1-3
intTrap2= intTrap(@Atila29,3,5);%i call intTrap function which i create, for 3-5
intTrap3= intTrap(@Atila29,5,7);%i call intTrap function which i create, for 5-7
intTrap4= intTrap(@Atila29,7,9);%i call intTrap function which i create, for 7-9

integral1_3= integral(@Atila29,1,3);% i call matlab's integral function for 1-3
integral3_5= integral(@Atila29,3,5);% i call matlab's integral function for 3-5
integral5_7= integral(@Atila29,5,7);% i call matlab's integral function for 5-7
integral7_9= integral(@Atila29,7,9);% i call matlab's integral function for 7-9



% ı run my code in this file


 rng(1); % i write the rng command to stable random number 
 random1= 1+ (3-1)*rand(1);
 random2= 7+ (9-7)*rand(1);
 %random1 variable choose one random value from 1-3
 %random2 variable choose one random value from 7-9

[estint_trap1,intervalextrap1]=adapTrap(@Atila29,random1,random2,0.001);
% i call my adapTrap function that i create

inegralval1 = integral(@Atila29,random1,random2);% i call matlab's integral function
errorval= ((estint_trap1-inegralval1)/estint_trap1)*100;% i wrote a calculation to define the error value  
disp(errorval)

sondeger1=intervalextrap1(end:end);
intervalssutun1=intervalextrap1(:,1);
sonsub=[intervalssutun1; sondeger1];
% in these last 3 line i bring all sub intervals to fone row 

x=1:0.1:9; 
plot(x,Atila29(x),"LineWidth",2,Color='g') % fx function plot
title("sub intervals","Color",'b','BackgroundColor','k',FontSize=14) % to add title on top of the plot 
xline(sonsub,Color='b') % my sub intervals




