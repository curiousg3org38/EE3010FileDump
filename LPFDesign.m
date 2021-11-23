clear all;
close all;

%LPF Design, Cutoff 0.2 IIDT
N = 7;
M = 128;
nu = 0.33;
kk = 0:N-1;
alpha = (N-1)/2;
himpres = 0.4*sinc(0.4*(kk-alpha));
HIMP = abs(fftshift(fft(himpres,M)));
nu = -0.5:(1/M):0.5-(1/M);
figure;
plot(nu,HIMP);

% [input,fs] = audioread('TERMINAT.WAV');
% time = 1:length(input);
% sinusoid = cos(2*pi*nu*time);
% sinusoid = sinusoid'
% overall = sinusoid+input;
% figure;
% plot(time,overall);
% grid on;
% axis tight;
% %sound(sinusoid);

% output = filter(1,1,overall);
% sound(output);