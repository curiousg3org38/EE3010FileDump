clear all;
close all;
%Read the sound file
[input,fs] = wavread('TERMINAT.WAV'); %reads sound file and places data as input and fs

%Check the length of the data
inputLength = length(input); %fnds the length of the input 

%Plot the waveform
figure; %allocates a figure for the next plot
plot(input); %plots the input (sound)
grid on; %adds a grid on the plot

%Generating a sinusoid with normalised frequency nu
nu = 0.345 ; %sets the normalised frequency
time = 1:inputLength; %sets the range of the time between 1 and the length of the sound                   
sinusoid = cos(2*pi*nu*time); %defines the sinusoid as a cosine wave
overall = sinusoid' + input; %adds the sinusoid and the sound wave (transpose of the sinusoid taken as variable lengths differ)

% Plot the ovall signal
figure; %allocates a figure for the next plot
plot(time,overall) %plots the time against the addition of the sinusoid and the input

N = 101; %number of multipliers in the filter
kk = 0:N-1;
alpha = (N-1)/2;
himpres1 = 0.13*sinc(0.13*(kk-alpha));
cosine = 2*cos(2*pi*0.295*time)
himpres2 = cosine .* himpres1
M=128;
HIMP = abs(fftshift(fft(himpres2,M)));
nu = -0.5:(1/M):0.5-(1/M);
figure;
plot(nu,HIMP);
hold on;
target = ones(1,128);
target(nu<-0.2) = 0;
target(nu>0.2) = 0;
plot(nu, target, 'r');
hold on;
target = ones(1,128);
target(nu<-0.2) = 0;
target(nu>0.2) = 0;
plot(nu, target, 'r');





