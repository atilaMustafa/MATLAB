function [estInt, intervals] = adapTrap(f, a, b, tol)
c=(a+b)/2; % we define c to create sub intervals 

stopping_criteria= intTrap(@Atila29,a,b) - intTrap(@Atila29,a,c) - intTrap(@Atila29,c,b);
% i define tolereance value as we given 
if (7*tol) >= abs (stopping_criteria) % i write the if sitiaution, abs function take the absoulate of stopping criteria variable 

 estInt = intTrap(@Atila29,a,c)+ intTrap(@Atila29,c,b)+ (intTrap(@Atila29,a,c)+ intTrap(@Atila29,c,b)-intTrap(@Atila29,a,b))/7 ;
intervals= [a c; c b ];
% i define estInt and intervals matrix 

else  
% If the value will not enter if stiuation it will enter else 
% in else condition est in devided in two parts 
[estIntac,intervalsac]=adapTrap(@Atila29,a,c,tol/2); % we take left side of the adapsimpsons with tol/2
[estIntcb,intervalscb]=adapTrap(@Atila29,c,b,tol/2); % we take right side of the adapsimpsons with tol/2
intervals=[intervalsac;intervalscb]; % we create matrix with subintervals 
estInt=estIntcb+estIntac; % it takes sum of the estInts
end

