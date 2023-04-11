% The purpose of the code here is to run the adapsimpsons, adapsimpsonsNonrec and adapTrap functions 100 times in 20 equal logarithmic values with certain random numbers.
% WRTITTEN BY MUSTAFA ATILA
% 11.17.2022
clc
clear 

tol= logspace(-4,-1,20); % IT DIVIDES EQUAL LOGARITMIC VALUES BETWEEN 10^-4 AND 10^-1

% I DEFINE THE MATRIX HERE TO WRITE VALUES IN THE LOOPS
random_degerleri=[];
adapSimpsons_estInt_values=[];
NonRec_estint_values=[];
trap_estint_values=[];
intervals_adap_size=[];
intervals_nonrec_size=[];
intervals_trap_size=[];
integraldeger=[];
adap_time=[];
nonrec_time=[];
trap_time=[];
adap_error_last=[];
nonrec_error_last=[];
trap_error_last=[];

for y=1:20 % DUE TO THE TOLERANCE VALUE OF 20, I CREATED A LOOP FROM 1 TO 20. EACH TIME I TURN THE LOOP, MY VARIABLE WILL TAKE A TOLERANCE VALUE.
    tol_deger=tol(y);
    disp(tol_deger)
 for i=1:100 %IT WILL WORK LOOP ONE HUNDRED TIMES FOR EACH TOLERANCE VALUE, SO IT WILL ENABLE US TO WORK ALL OF OUR FUNCTIONS IN 100x20 SHAPE
     rng(i*5) %IT ALLOWS US TO GET SPECIFIC RANDOM VALUES
     random1= 1+ (5-1)*rand(1);%SELECTs 1 RANDOM NUMBER FROM 1-5
     random2= 5+(9-5)*rand(1);%SELECTs 1 RANDOM NUMBER FROM 5-9
     matlab_integral= integral(@Atila29,random1,random2); %RUNS MATLAB'S INTEGRAL FUNCTION AT 100 RANDOM VALUE RANGE
 if y==1 %I USED THE IF CONDITION TO STORAGE 100 VALUE ONLY ONCE, BECAUSE THE INTEGRAL COMMAND AND RANDOM VALUES WILL RECEIVE THE SAME FACIAL VALUE EVERY TIME THE LOOP TURNS
     random_degerleri=[random_degerleri;random1 random2]; 
     integraldeger(y,i)= matlab_integral;
 end 
 %VHERE I CALL FUNCTIONS AND ALSO WRITE HOW LONG THE FUNCTIONS DO EACH OPERATION INTO THE MATRIX
    tic
    [adapSimpsons_1,intervals_1]= adapSimpsons(@Atila29,random1,random2,tol_deger);
    adap_time(i,y)=toc;
    tic
    [adapSimpsonsNonRec_1,intervalsNonRec_1]= adapSimpsonsNonRec(@Atila29,random1,random2,tol_deger);
    nonrec_time(i,y)=toc;
    tic
    [adapTrap_1,intervalsTrap]=adapTrap(@Atila29,random1,random2,tol_deger);
    trap_time(i,y)=toc;

    %I ASSIGN THE ESTINT VALUES RETURNED BY FUNCTIONS TO THE MATRIX. DUE TO OPERATING 100 TIMES FOR EACH TOLERANCE VALUE, I GET A 100x20 MATRIX
    adapSimpsons_estInt_values(i,y)=adapSimpsons_1;
    NonRec_estint_values(i,y)=adapSimpsonsNonRec_1;
    trap_estint_values(i,y)=adapTrap_1;
    %TO GET THE NUMBER OF INTERVALS THAT THE FUNCTION TURNS, I GET THE INTERVAL OF EACH FUNCTION BY COMMANDING YOU. THEN I ASSIGN THESE VALUES TO A MATRIX.
    [m,n]=size(intervalsTrap);
    [p,q]=size(intervalsNonRec_1);
    [r,s]=size(intervals_1);
    intervals_adap_size(i,y)=r;
    intervals_nonrec_size(i,y)=p;
    intervals_trap_size(i,y)=m;
 end
end
%I TAKE THE AVERAGE OF THE ESTINT VALUES I TAKE FOR EACH TOLERANCE VALUE.
% I MAKE A NEW 1x20 MATRIX USING THE SIZE 100x20 MATRIX. 
% THEN I APPLY THE SAME PROCESS FOR THE NUMBER OF INTERVALS AND THE WORKING TIMES OF THE FUNCTIONS.
adapsimpsons_estint_avarage=mean(adapSimpsons_estInt_values);
NonRec_estint_avarage=mean(NonRec_estint_values);
trap_esint_avarage=mean(trap_estint_values);
integral_avarage=mean(integraldeger);

adap_interval_avarage=mean(intervals_adap_size);
nonrec_interval_avarage=mean(intervals_nonrec_size);
trap_interval_avarage=mean(intervals_trap_size);

adap_time_avarage=mean(adap_time);
nonrec_time_avarage=mean(nonrec_time);
trap_time_avarage=mean(trap_time);
for e=1:20 %THE FOR LOOP WE USE TO CALCULATE THE PERCENTAGE ERROR BETWEEN ESTINT VALUES AND MATLAB INTEGRAL FUNCTION
%FOR EACH TOLERANCE VALUE, WE CALCULATE THE PERCENTAGE OF ERROR AND TAKE THE ABSOLUTE VALUE AND WRITE IT TO THE MATRIX
adap_error=((adapsimpsons_estint_avarage(e)-integral_avarage(1))/adapsimpsons_estint_avarage(e))*100;
adap_error_last(e)=abs(adap_error);
nonrec_error=((NonRec_estint_avarage(e)-integral_avarage(1))/NonRec_estint_avarage(e))*100;
nonrec_error_last(e)=abs(nonrec_error);
trap_error=((trap_esint_avarage(e)-integral_avarage(1))/trap_esint_avarage(e))*100;
trap_error_last(e)=abs(trap_error);
end 
%FIRST FIGURE COMPARES AVERAGE OF INTERVALS FOR EACH TOLERANCE VALUE
figure(1)
grid on 
hold on 
plot(tol,adap_interval_avarage,Color='r',LineWidth=2)
hold on 
plot(tol,trap_interval_avarage,Color='b',LineWidth=1.5);
xlabel('Tolerance Value')
legend('adaptive simpsons interval','trapezoid interval')
%THE SECOND FIGURE CALCULATES THE AVERAGE TIME IT SPENDS FOR EACH TOLERANCE VALUE AND COMPARIES THE 3 METHODS.
figure(2)
grid on 
hold on 
plot(tol,adap_time_avarage,Color='r',LineWidth=2)
hold on 
plot(tol,trap_time_avarage,Color='b',LineWidth=1.5);
hold on
plot(tol,nonrec_time_avarage,Color='g',LineWidth=3);
xlabel('Tolerance Value')
legend('adap time','trapezoid time','adap non recursive time')
%FINALLY, IT SHOWS THE PERCENTAGES OF ERROR OF THE INTEGRAL VALUE FOR EACH TOLERANCE VALUE.
figure(3)
grid on 
hold on 
plot(tol,adap_error_last,Color='r',LineWidth=2)
hold on 
plot(tol,trap_error_last,Color='b',LineWidth=1.5)
xlabel('Tolerance Value')
legend('adap error','trapezoid error')
save ("results")
