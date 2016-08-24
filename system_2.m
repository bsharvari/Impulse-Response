% HOMEWORK 2 : #2

clc;
clear all;
close all;

display ('The difference equation is  y[n] + 1.6y[n-1] + 2.28y[n-2] + 1.325y[n-3] + 0.68y[n-4] = 0.06x[n] – 0.19x[n-1] + 0.27x[n-2] – 0.26x[n-3] + 0.12x[n-4]');

% Calculate and plot Impulse Response
a = [1 1.6 2.28 1.325 0.68];                                               % Coefficients of y
b = [0.06 -0.19 0.27 -0.26 0.12];                                          % C0eficients of x
h = impz (b,a,20)
 
figure
stem (h);
title ('Impluse Response');
xlabel ('n ----->');
ylabel ('h(n) ----->');

% Cascaded System
display ('The difference equaitons of the cascaded version are:');
display ('y1[n] + 0.9 y1[n-1] + 0.8 y1[n-2]  =  0.3x[n] – 0.2x[n-1] + 0.4x[n-2]');
display ('y2[n] + 0.7 y2[n-1] + 0.85 y2[n-2]  =  0.2 y1[n] – 0.5 y1[n-1] + 0.3 y1[n-2]');

% Impluse Response of the first sub-system
a = [1 0.9 0.8];                                                            % Coefficients of y1
b = [0.3 -0.2 0.4];                                                         % Coefficients of x

h1 = impz (b,a,10)

figure;
subplot (2,1,1);
stem(h1);
title ('Impluse Response of first sub-system');
xlabel ('n ----->');
ylabel ('h1(n) ----->');

% Impluse Response of the second sub-system
a = [1 0.7 0.85];                                                           % Coefficients of y2
b = [0.2 -0.5 0.3];                                                         % Coefficients of y1

h2 = impz (b,a,10)

subplot (2,1,2);
stem(h2);
title ('Impluse Response of second sub-system');
xlabel ('n ----->');
ylabel ('h2(n) ----->');

h_casc = conv(h1,h2)                                                       % Impluse response of two systems cascaded in series

figure;
stem(h_casc);
title ('Impluse Response of cascaded system');
xlabel ('n ----->');
ylabel ('h_casc(n) ----->');