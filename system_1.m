% HOMEWORK 2 : #1

clc;
clear all;
close all;

% (1) Compute y[n]
display ('Input x[n] = cos(2*pi*f*n)');
display ('The difference equation is y1(n) - 0.4*y1(n-1) + 0.75*y1(n-2) = 2.2403*x1(n) + 2.4908*x1(n-1) + 2.2403*x1(n-2)');
f1 = input('Enter the value of f1: ');
f2 = input('Enter the value of f2: ');

for n = 1:50
    x1(n) = cos(2*pi*f1*n);
end

for n = 1:50
    x2(n) = cos(2*pi*f2*n);
end

y1(1) = 0;
y1(2) = 0;
y2(1) = 0;
y2(2) = 0;

for n = 3 : 50
    y1(n) = 0.4*y1(n-1) - 0.75*y1(n-2) + 2.2403*x1(n) + 2.4908*x1(n-1) + 2.2403*x1(n-2);
end
for n = 3 : 50
    y2(n) = 0.4*y2(n-1) - 0.75*y2(n-2) + 2.2403*x2(n) + 2.4908*x2(n-1) + 2.2403*x2(n-2);
end

figure;
subplot (2,1,1)
stem(x1);
xlim([0 100])
title ('Input x1');
xlabel ('n ----->');
ylabel ('x1(n) ----->');
subplot (2,1,2)
stem(y1);
xlim([0 100])
title ('Output y1');
xlabel ('n ----->');
ylabel ('y1(n) ----->');
 
figure;
subplot (2,1,1)
stem(x2);
xlim([0 100])
title ('Input x2');
xlabel ('n ----->');
ylabel ('x2(n) ----->');
subplot (2,1,2)
stem(y2);
xlim([0 100])
title ('Output y2');
xlabel ('n ----->');
ylabel ('y2(n) ----->');

% (2) Check for Linearity
a = input('Enter the value of a: ');
b = input('Enter the value of b: ');

for n = 1:50
    x(n) = a*x1(n) + b*x2(n);
end

y(1) = 0;
y(2) = 0;

for n = 3:50
    y(n) = 0.4*y(n-1) - 0.75*y(n-2) + 2.2403*x(n) + 2.4908*x(n-1) + 2.2403*x(n-2);
end

for n = 1:50
    if y(n) == a.*y1(n) + b.*y2(n)
        flag = 1;
    else
        flag = 0;
    end 
end

if flag == 1
    display('The system is linear');
else
    display('The system is non-linear');
end
 
figure;
subplot (2,1,1)
title('Linearity');
stem(x);
xlim([0 100])
title ('Input x');
xlabel ('n ----->');
ylabel ('x(n) ----->');
subplot (2,1,2)
stem(y);
xlim([0 100])
title ('Output y');
xlabel ('n ----->');
ylabel ('y(n) ----->');
 
% (3) Check for Periodicity
N = input('Enter the value of N: ');
a = input('Enter the value of a: ');
b = input('Enter the value of b: ');
 
for n = 1:100
    x(n) = a*x1(n) + b*x2(n);
end
 
y(1) = 0;
y(2) = 0;

for n = 3:100
    y(n) = 0.4*y(n-1) - 0.75*y(n-2) + 2.2403*x(n) + 2.4908*x(n-1) + 2.2403*x(n-2);
end
 
for n = 1:100 - N
    d(n) = y(n)-y(n+N);
    if d(n) < (10^-4)
        flag = 1;
    else
        flag = 0;
    end
end
 
if flag == 1
    display('The signal is periodic');
else
    display('The signal is non-periodic');
end
 
% Calculate and plot Impluse Response
 
a = [1 -0.4 0.75];                                                          % Coefficients of y
b = [2.2403 2.4908 2.2403];                                                 % Coefficients of x
 
h = impz(b,a)
 
figure;
stem(h);
title ('Impluse Response');
xlabel ('n ----->');
ylabel ('h(n) ----->');
