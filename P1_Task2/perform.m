clear;
clc;

% ı run my code in this file

random1= 1+ (3-1)*rand(1);                  %random1 variable choose one random value from 1-3
random2= 7+ (9-7)*rand(1);                  %random2 variable choose one random value from 7-9




[estint_adapnonrec1,intervalexnonrec1]=adapSimpsonsNonRec(@Atila29,random1,random2,0.1); % we call the adaptSimpsonsNonRec function
[estint_adap1,intervalex1]=adapSimpsons(@Atila29,random1,random2,0.1);% we call our adapsimpsons function 

[estint_adapnonrec2,intervalexnonrec2]=adapSimpsonsNonRec(@Atila29,random1,random2,0.001); % we call the adaptSimpsonsNonRec function
[estint_adap2,intervalex2]=adapSimpsons(@Atila29,random1,random2,0.001);% we call our adapsimpsons function 

[estint_adapnonrec3,intervalexnonrec3]=adapSimpsonsNonRec(@Atila29,random1,random2,0.00001); % we call the adaptSimpsonsNonRec function
[estint_adap3,intervalex3]=adapSimpsons(@Atila29,random1,random2,0.00001);% we call our adapsimpsons function 