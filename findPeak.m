function [peaks_seen,peaks_unseen]=findPeak(data,window)
%% finds maximum ampitude of data in given time window

t=find(data.time>data.peak(1,1)/1000-window & data.time<data.peak(1,1)/1000+window); %timewindow around peak

if data.peak(1,2)<0 %find maximum amplitude (according to polarity)
    [amp,idx] = cellfun(@(x) min(x(t)),data.seen.data);
    peaks_seen=[data.time(t(idx))' amp];
    [amp,idx] = cellfun(@(x) min(x(t)),data.unseen.data);
    peaks_unseen=[data.time(t(idx))' amp];
else
    [amp,idx] = cellfun(@(x) max(x(t)),data.seen.data);
    peaks_seen=[data.time(t(idx))' amp];
    [amp,idx] = cellfun(@(x) max(x(t)),data.unseen.data);
    peaks_unseen=[data.time(t(idx))' amp];
end
end