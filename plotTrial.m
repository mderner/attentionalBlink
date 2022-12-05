function plotTrial(data,time,window,meanPeak,peak,tit)
%% plot trial data (data over time) and mark given time window with peak from ERP data (meanPeak) and peak of trial (maximum amplitude of trial in given time window)

l=meanPeak(1)/1000-window;
r=meanPeak(1)/1000+window;

%[~,a]=min(abs(time-0));
%[~,b]=min(abs(time-0.75));

f=14; %fontsize
%figure('DefaultAxesFontSize',f)
plot(time,data,'LineWidth',3)
title(tit)
yl=ylim;
hold on
h=fill([l l r r],[yl(1) yl(2) yl(2) yl(1)],'black','FaceAlpha',0.1,'EdgeColor', 'none');
plot([meanPeak(1)/1000 meanPeak(1)/1000],[yl(1) yl(2)],':k','LineWidth',1.5)
plot(peak(1),peak(2),'o','MarkerSize',8,'MarkerFaceColor','r')
ylim(yl)
xlim([0,0.75])
xlabel('time(s)')
ylabel('amplitude(\muV)')
end