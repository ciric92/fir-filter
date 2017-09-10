clear all
close all
clc

% generate input signal

A = 2^15/2;
fs = 5000;
f1 = 800;
f2 = 2400;

t = 0:1/fs:1-1/fs;

sig = A * sin(2*pi*f1*t) + A * sin(2*pi*f2*t);

f = fs * (-length(sig)/2:length(sig)/2-1)/length(sig);
H = fftshift(abs(fft(sig)));
phase = unwrap(angle(fft(sig)));

figure(1);
subplot(3, 1, 1);
plot(t, sig); 
xlabel('t[s]');
title('Time domain');

subplot(3, 1, 2);
plot(f, H); 
xlabel('f [Hz]');
title('Magnitude plot');

subplot(3, 1, 3);
plot(f, phase); 
xlabel('f[Hz]');
title('Phase plot');

fid = fopen('input.pcm', 'w');
fwrite(fid, sig, 'int16');
fclose(fid);

disp('Stored generated signal in input.pcm')