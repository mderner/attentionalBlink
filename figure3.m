%% figure 3
addpath('./func');
addpath('./dat');

figure
%% example for dataset 12_1 LAH (figure 3 1st example)
load('.\ERP\data12_1.mat')
subplot(2,3,1)
plotERP(time,data{1},label{1})
yl = ylim;

time400=find(time==0.4); %timestamp 400ms
time500=find(time==0.5); %timestamp 500ms
[m,idx]=min(data{1}(:,time400:time500),[],2); %minimal amplitude of each wires
[m,id]=min(m); %overall minimal amplitdue of wire m (= wire 1)
ts=time(idx(id)+time400-1); %timestamp of minimal amplitude
hold on %mark datapoint
plot(ts,m,'*')
text(ts+0.05,m,[num2str(ts) 'ms, ' num2str(round(m*100)/100) '\muV'],'fontsize',10);

subplot(2,3,4)
plotERP(time,data{2},label{2})
ylim(yl);

%% peaks depending on lag
load('.\trialData\data12_1_LAH1.mat') %load example data
short=1; %chose lag
window=0.1; %chose window for amplitude peak around mean

shortData=data; %select trials with chosen lag
shortData.seen=shortData.seen(shortData.seen.lag==short,:);
shortData.unseen=shortData.unseen(shortData.unseen.lag==short,:);

[peaks_seen,peaks_unseen]=findPeak(shortData,window);

%plot
subplot(2,3,2)
plotTrial(shortData.seen.data{4,1},data.time,window,data.peak,peaks_seen(4,:),'seen trial 4')
text(peaks_seen(4,1)+0.015,peaks_seen(4,2),[num2str(round(peaks_seen(4,1)*1000)) 'ms'],'fontsize',10);
subplot(2,3,3)
plotTrial(shortData.seen.data{15,1},data.time,window,data.peak,peaks_seen(15,:),'seen trial 15')
text(peaks_seen(15,1)+0.015,peaks_seen(15,2),[num2str(round(peaks_seen(15,1)*1000)) 'ms'],'fontsize',10);
subplot(2,3,5)
plotTrial(shortData.unseen.data{8,1},data.time,window,data.peak,peaks_unseen(8,:),'unseen trial 8')
text(peaks_unseen(8,1)+0.015,peaks_unseen(8,2),[num2str(round(peaks_unseen(8,1)*1000)) 'ms'],'fontsize',10);
subplot(2,3,6)
plotTrial(shortData.unseen.data{19,1},data.time,window,data.peak,peaks_unseen(19,:),'unseen trial 19')
text(peaks_unseen(19,1)+0.015,peaks_unseen(19,2),[num2str(round(peaks_unseen(19,1)*1000)) 'ms'],'fontsize',10);

%% example for dataset 10_3 LAH (figure 3 2nd example)
figure

load('.\ERP\data10_3.mat')
subplot(2,3,1)
plotERP(time,data{4},label{4})
yl = ylim;

time400=find(time==0.4); %timestamp 400ms
time500=find(time==0.5); %timestamp 500ms
[m,idx]=max(data{4}(:,time400:time500),[],2); %minimal amplitude of each wires
[m,id]=max(m); %overall minimal amplitdue of wire m (= wire 1)
ts=time(idx(id)+time400-1); %timestamp of minimal amplitude
hold on %mark datapoint
plot(ts,m,'*')
text(ts+0.05,m,[num2str(ts) 'ms, ' num2str(round(m*100)/100) '\muV'],'fontsize',10);

subplot(2,3,4)
plotERP(time,data{5},label{5})
ylim(yl);

%% peaks depending on lag
load('.\trialData\data10_3_RAH8.mat') %load example data
short=1; %chose lag
window=0.1; %chose window for amplitude peak around mean

shortData=data; %select trials with chosen lag
shortData.seen=shortData.seen(shortData.seen.lag==short,:);
shortData.unseen=shortData.unseen(shortData.unseen.lag==short,:);

[peaks_seen,peaks_unseen]=findPeak(shortData,window);

%plot
subplot(2,3,2)
plotTrial(shortData.seen.data{32,1},data.time,window,data.peak,peaks_seen(32,:),'seen trial 32')
text(peaks_seen(32,1)+0.015,peaks_seen(32,2),[num2str(round(peaks_seen(32,1)*1000)) 'ms'],'fontsize',10);
subplot(2,3,3)
plotTrial(shortData.seen.data{33,1},data.time,window,data.peak,peaks_seen(33,:),'seen trial 33')
text(peaks_seen(33,1)+0.015,peaks_seen(33,2),[num2str(round(peaks_seen(33,1)*1000)) 'ms'],'fontsize',10);
subplot(2,3,5)
plotTrial(shortData.unseen.data{10,1},data.time,window,data.peak,peaks_unseen(10,:),'unseen trial 10')
text(peaks_unseen(10,1)+0.015,peaks_unseen(10,2),[num2str(round(peaks_unseen(10,1)*1000)) 'ms'],'fontsize',10);
subplot(2,3,6)
plotTrial(shortData.unseen.data{13,1},data.time,window,data.peak,peaks_unseen(13,:),'unseen trial 13')
text(peaks_unseen(13,1)+0.015,peaks_unseen(13,2),[num2str(round(peaks_unseen(13,1)*1000)) 'ms'],'fontsize',10);