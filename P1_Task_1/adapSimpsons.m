

function [estInt, intervals] = adapSimpsons(f, a, b, tol)  % we create function which has 2 outputs estInt and intervals and also there are 4 parameters 

c=(a+b)/2; % we define c to create sub intervals 

axax= intSimpsons(@Atila29,a,b) - intSimpsons(@Atila29,a,c) - intSimpsons(@Atila29,c,b);
% i define tolereance value as we given 
if (15*tol) >= abs (axax) % i write the if sitiaution, abs function take the absoulate of axax variable 

 estInt = intSimpsons(@Atila29,a,c)+ intSimpsons(@Atila29,c,b)+ (intSimpsons(@Atila29,a,c)+ intSimpsons(@Atila29,c,b)-intSimpsons(@Atila29,a,b))/15 ;
intervals= [a c; c b ];
% i define estInt and intervals matrix 

else  
% If the value will not enter if stiuation it will enter else 
% in else condition est in devided in two parts 
[estIntac,intervalsac]=adapSimpsons(@Atila29,a,c,tol/2); % we take left side of the adapsimpsons with tol/2
[estIntcb,intervalscb]=adapSimpsons(@Atila29,c,b,tol/2); % we take right side of the adapsimpsons with tol/2
intervals=[intervalsac;intervalscb]; % we create matrix with subintervals 
estInt=estIntcb+estIntac; % it takes sum of the estInts
end

