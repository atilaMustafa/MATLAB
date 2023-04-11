clear 
clc
disp('1 ve 3 araligi=')                     %it writes that what i write in parantehesis
intsimpsons1= intSimpsons(@Atila29,1,3); % I create a variable which is first_intsimpsons to call intSimpsons function.]
                                            % in this function i choose some parameters first one is @atila29 which is my function, 
                                            % 1 is lowest value of function and 3 is highest value
disp(intsimpsons1)                       % it shows first_intsimpsons on command window 
disp('3 ve 5 araligi=')
intsimpsons2=intSimpsons(@Atila29,3,5);
 disp(intsimpsons2)                   %this step is same with first one but lowest and highest parameters are 3-5  
disp('5 ve 7 araligi=')
intsimpsons3=intSimpsons(@Atila29,5,7);
disp(intsimpsons3)                    %this step is same with first one but lowest and highest parameters are 5-7 
disp('7 ve 9 araligi=')
intsimpsons4=intSimpsons(@Atila29,7,9);
disp(intsimpsons4)                  %this step is same with first one but lowest and highest parameters are 7-9 

integral_1= integral(@Atila29,1,3);
integral_2= integral(@Atila29,3,5);
integral_3= integral(@Atila29,5,7);
integral_4= integral(@Atila29,7,9);


random1= 1+ (3-1)*rand(1);                  %random1 variable choose one random value from 1-3
random2= 7+ (9-7)*rand(1);                  %random2 variable choose one random value from 7-9

[estint_adap1,intervalex1]=adapSimpsons(@Atila29,random1,random2,0.1); % there are 2 variables estint_adap1 and intervalex1 for take the output from adapSimpsons function 
                                                                          % in adapsimpsons there are for parmeters fisrt is our function, random1 is lower and random2 is highest value of the function
                                                                          % 4. parameter is our tolarance value 
fprintf("Fonksiyon'un random1 ve random2 sayi aralığındaki değeri  : %f \n",estint_adap1);    %  it print estint_adap1 in command window 

[estint_adap2,intervalex2]=adapSimpsons(@Atila29,random1,random2,0.001);
fprintf("Fonksiyon'un 1-3 aralığındaki değeri  : %f \n",estint_adap2);

[estint_adap3,intervalex3]=adapSimpsons(@Atila29,random1,random2,0.00001);
fprintf("Fonksiyon'un 1-3 aralığındaki değeri  : %f \n",estint_adap3);

integral_5= integral(@Atila29,random1,random2);   % we get integral value from matlab integral function 

intervals1_sutun1= intervalex1(:,1);  % we take first column from intervalex1 


intervals2_sutun1= intervalex2(:,1);  % we take first column from intervalex2 


intervals3_sutun1= intervalex3(:,1);  % we take first column from intervalex3 
sondeger1=intervalex1(end:end);
sondeger2=intervalex2(end:end);  % i take last subinterval to combine with first column
sondeger3=intervalex3(end:end);
son1=[intervals1_sutun1; sondeger1];
son2=[intervals2_sutun1; sondeger2];  % the sum of the all sub inntervals matrix in 1 column 
son3=[intervals3_sutun1; sondeger3];
% we take first column from intervalex3 
x=1:0.1:9; 
subplot(3,1,1)% to make all plots in one tab
plot(x,Atila29(x),"LineWidth",2,Color='r') % fx function plot
title("first sub intervals for 0.1 tolarance value","Color",'r','BackgroundColor','k',FontSize=14) % to add title on top of the plot 
xline(son1) % my sub intervals 

subplot(3,1,2)
plot(x,Atila29(x),"LineWidth",2,Color='g') 
title("second sub intervals for 0.001 tolarance value","Color",'g','BackgroundColor','k',FontSize=14)
xline(son2)

subplot(3,1,3)
plot(x,Atila29(x),"LineWidth",2,Color='b') 
title("third sub intervals for 0.00001 tolarance value","Color",'b',BackgroundColor='k',FontSize=14)
xline(son3)




