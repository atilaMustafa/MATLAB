function [estInt, intervals] = adapSimpsonsNonRec(f, a, b,tol)
 

% Our goal in the code is to first take the interval intervals given to us, 
% put them in our candidate array, then pass these intervals through the 
% stopping criteria value, then add the passing values to the set of 
% intervals and get our sub-intervals value. After taking the intervals 
% values, we add the est int values for each sub interval value and find our
% main result.

toplam=0; 
%Our variable we created to collect our est int values

candidate_int = [a b]; 
% we add our first interval given to us to our candidate interval array
intervals = []; 
intervals_islem=[]; % i add one more intervals array to calculate est int value 
%our sub interval sequence, our values here will be our sub interval intervals that pass the stopping criteria

tolerance_value = tol*2;
% In the while loop, we first multiply by 2 to get our tol value
while ~isempty(candidate_int) 
   % the while loop will run as long as our candidate array is not empty
tolerance_value =tolerance_value/2; 
%each time our tolerance value is divided by two
[m,n] = size(candidate_int);
%With the size function we get the length of the candidate array to use in the for loop
transaction_basket= []; 
%We empty our process basket every time our for loop ends, if we don't, 
% the while loop will go forever. The other purpose of emptying our array
% is that we are processing for the new candidate_int values in each for loop.

    for i = 1 : m 
        %Our for loop runs from 1 to the length of our candidate array
        first_var= candidate_int(i,1); 
        %Each value of i in the candidate_int array passes the first value of that row to first_var
        second_var = candidate_int(i,2);
        %For each value of i in the candidate_int array, it transfers the second value of that row to second_var
        mid_var = (first_var+second_var)/2; 
        %finds the middle value for each row
        
% ((b-a)/6)*(f(a)+4*f((a+b)/2)+f(b))

%we wrote down our stopping criteria given to us
        islem = ((second_var-first_var)/6)*(f(first_var)+4*f((first_var+second_var)/2)+f(second_var)) - ((mid_var-first_var)/6)*(f(first_var)+4*f((first_var+mid_var)/2)+f(mid_var)) - ((second_var-mid_var)/6)*(f(second_var)+4*f((second_var+mid_var)/2)+f(mid_var));

        if (tolerance_value*15) >= abs(islem) 
            %If the interval given by the stopping criteria exceeds, 
            % the value is written to the intervals so that our old 
            % intervals are not lost, we first write intevals and then enter our values.
            intervals = [intervals ; first_var mid_var ; mid_var second_var];
            intervals_islem= [intervals_islem; first_var second_var];
            % actually we take a mid point in for when we are calculating
            % the estint value so both of the intervals array will be same 
        else 
           
%If the stopping criteria value in the if is not provided, it enters 
% the else state. Here, the interval in the th line of the candidate_int 
% is divided into two and transferred to our transaction_basket, which is 
% our transaction basket, and when the for loop is finished, it will be 
% transferred to our candidate_int array again.


            transaction_basket = [transaction_basket ; first_var mid_var ; mid_var second_var];

        end


    end
candidate_int= transaction_basket;

%When our for loop is finished, we transfer the ranges to our candidate int array.

end
[intervals_length,et]=size(intervals_islem); 
%We get the line length of our interval array to use in the for loop
for r =1 : intervals_length
    %We created a for loop that goes up to the length of our interval
intervals_val_1= intervals_islem(r ,1); 
%We transfer the first value of the line in the r value of the intervals
intervals_val_2= intervals_islem(r ,2);
% We transfer the second value of the line in the r value of the intervals
intervals_val_mid = (intervals_val_1+intervals_val_2)/2; 
%we find the midpoint to use in the process
% ((b-a)/6)*(f(a)+4*f((a+b)/2)+f(b))

 %We collect the est int value given in task 1 for each range and accumulate it in the total variable
toplam =  toplam +intSimpsons(@Atila29,intervals_val_1,intervals_val_mid)+ intSimpsons(@Atila29,intervals_val_mid,intervals_val_2)+ (intSimpsons(@Atila29,intervals_val_1,intervals_val_mid)+ intSimpsons(@Atila29,intervals_val_mid,intervals_val_2)-intSimpsons(@Atila29,intervals_val_1,intervals_val_2))/15 ;
disp(r)
disp(toplam)
%((intervals_val_mid-intervals_val_1)/6)*(f(intervals_val_1)+4*f((intervals_val_1+intervals_val_mid)/2)+f(intervals_val_mid))+((intervals_val_2-intervals_val_mid)/6)*(f(intervals_val_mid)+4*f((intervals_val_mid+intervals_val_2)/2)+f(intervals_val_2))+((intervals_val_mid-intervals_val_1)/6)*(f(intervals_val_1)+4*f((intervals_val_1+intervals_val_mid)/2)+f(intervals_val_mid))+((intervals_val_2-intervals_val_mid)/6)*(f(intervals_val_mid)+4*f((intervals_val_mid+intervals_val_2)/2)+f(intervals_val_2))-((intervals_val_2-intervals_val_1)/6)*(f(intervals_val_1)+4*f((intervals_val_1+intervals_val_2)/2)+f(intervals_val_2));
end
%We equate our est int output to the sum variable
estInt = toplam;
