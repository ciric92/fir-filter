function Hd = generateFilter
%GENERATEFILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.5 and the DSP System Toolbox 9.0.
% Generated on: 10-Sep-2017 21:48:28

% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 5000;  % Sampling Frequency

Fpass = 1200;           % Passband Frequency
Fstop = 2200;           % Stopband Frequency
Dpass = 0.11462326752;  % Passband Ripple
Dstop = 0.00177827941;  % Stopband Attenuation
flag  = 'scale';        % Sampling Flag

% Calculate the order from the parameters using KAISERORD.
[N,Wn,BETA,TYPE] = kaiserord([Fpass Fstop]/(Fs/2), [1 0], [Dstop Dpass]);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
Hd = dfilt.dffir(b);
% Set the arithmetic property.
set(Hd, 'Arithmetic', 'fixed', ...
    'CoeffWordLength', 16, ...
    'CoeffAutoScale', true, ...
    'Signed',         true, ...
    'InputWordLength', 16, ...
    'inputFracLength', 15, ...
    'FilterInternals',  'FullPrecision');
denormalize(Hd);


% [EOF]
