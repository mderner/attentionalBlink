function [ys,x] = convolve_spikes(spikes)
%%function [ys x] = convolve_spikes(spikes)
% takes spikes (milliseconds)

kern_width = 0.1; %s
resolution = 0.001; % time-resolution (binwith for kernel-convolution in seconds)

kern_length = kern_width*5;
kernel = normpdf(-kern_length:resolution:kern_length, 0, kern_width);

mints = -0.5; %x-axis in seconds
maxts = 2;
x = mints:resolution:maxts;

ntrials = length(spikes);

for t =1:ntrials
    % convert to seconds
    y_ = (spikes{t}./1000)';
    % bin spikes in 1 ms bins
    y_ = histc(y_, x);
    % convolve with kernel
    ys(t,:) = conv(y_, kernel, 'same');
end

if ntrials == 0
    ys = zeros(0, length(x));
end