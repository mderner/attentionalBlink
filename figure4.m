addpath('./dat');

load amplitudeSeenT2 
load amplitudeUnseenT2
load amplitudeUnseenIntervallT2
load amplitudeSeenIntervallT2

meanSeen=cellfun(@mean,amplitudeSeen);
meanSeenIntervall=cellfun(@mean,amplitudeSeenIntervall);
meanUnseen=cellfun(@mean,amplitudeUnseen);
meanUnseenIntervall=cellfun(@mean,amplitudeUnseenIntervall);
[~,tSingleTrial]=cellfun(@(x,y) ttest2(x,y,'tail','left'),amplitudeSeen,amplitudeUnseen); %singleTrial einseitiger t-Test Amplitude bei Median
[~,tSingleTrialIntervall]=cellfun(@(x,y) ttest2(x,y,'tail','left'),amplitudeSeenIntervall,amplitudeUnseenIntervall); %singleTrial einseitiger t-Test Amplitude über 25%-75%-Intervall

sum(tSingleTrial<0.025)
sum(tSingleTrialIntervall<0.025)
binocdf(40-sum(tSingleTrial<0.025),40,0.95)
binocdf(40-sum(tSingleTrialIntervall<0.025),40,0.95)

[~,p]=ttest(meanSeenIntervall,meanUnseenIntervall,'tail','left')
[~,p]=ttest(meanSeen,meanUnseen,'tail','left')

figure
err = [std(meanSeen)/sqrt(length(meanSeen)),std(meanUnseen)/sqrt(length(meanUnseen))];
bar([mean(meanSeen),mean(meanUnseen)])
alpha(.5)
title('amplitude at 308.2 ms after T2')
set(gca,'xticklabel',{'T2 seen','T2 unseen'})
ylabel('amplitude(\muV)')
hold on
er=errorbar([1,2],[mean(meanSeen),mean(meanUnseen)],err,err,'k');    
er.LineStyle = 'none';  
hold off

figure
err = [std(meanSeenIntervall)/sqrt(length(meanSeenIntervall)),std(meanUnseenIntervall)/sqrt(length(meanUnseenIntervall))];
bar([mean(meanSeenIntervall),mean(meanUnseenIntervall)])
alpha(.5)
title('mean amplitude in 25%-75% Quartile after response to T2')
set(gca,'xticklabel',{'T2 seen','T2 unseen'})
ylabel('mean amplitude(\muV)')
hold on
er=errorbar([1,2],[mean(meanSeenIntervall),mean(meanUnseenIntervall)],err,err,'k');    
er.LineStyle = 'none';  
hold off
ylim([-12,12])

%% figure 4B

load peakLatenciesLags

% [seen,unseen]
[~,p0]=ttest(lags0(:,1),lags0(:,2));
[~,p1]=ttest(lags1(:,1),lags1(:,2),'tail','left');
[~,p2]=ttest(lags2(:,1),lags2(:,2),'tail','left');
[~,p3]=ttest(lags3(:,1),lags3(:,2),'tail','left');

% remove rows with NaN
[row2] = find(~isnan(lags2(:,2)));
[row3] = find(~isnan(lags3(:,2)));
lags2=lags2(row2,:);
lags3=lags3(row3,:);

y=[mean(lags0*1000);mean(lags1*1000);mean(lags2*1000);mean(lags3*1000)];
figure
b=bar(y,'FaceColor','flat');
set(gca,'xticklabel',{'lag 0','lag 1','lag 2','lag 3'})
hold on
err=[std(lags0*1000)/sqrt(length(lags0));std(lags1*1000)/sqrt(length(lags1));std(lags2*1000)/sqrt(length(lags2));std(lags3*1000)/sqrt(length(lags3))];
ngroups = size(y, 1);
nbars = size(y, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for m=1:4
    b(1).CData(m,:)=[0.498 0.722 0.871];
    b(2).CData(m,:)=[0.224 0.353 0.671];
end
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, y(:,i), err(:,i), '.k');
end
hold off
axis([0.5,4.5,420,480])
legend('T2 seen','T2 unseen')
title('T1-related P3 peak-latencies')
ylabel('latency (ms)')
