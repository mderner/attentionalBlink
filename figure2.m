%% figure 2
addpath('./func');
addpath('./dat');
load medianLatencies
med=nanmedian(medlat)/1000;

%% load exampleN (n=1,2,3)
for n=1:3
load(['example' num2str(n)])

 % plots
 figure
 subplot(2,1,1)
 plot_raster(spikes(),-500:2000,[0 0.4470 0.7410]);
 title(channel)
 
[ys,x]=convolve_spikes(spikes);
subplot(4,1,3)
y=mean(ys);
SEM = std(ys)/sqrt(size(ys,1));
plot_instantaneousFR(x,m,SEM,med)

subplot(4,2,7)
density_plot(spk);

end

%% firing latencies
%mean latency and 25%-75% quartil
load medianLatencies
med=median(medlat,'omitnan');
p25=prctile(medlat,25);
p75=prctile(medlat,75);

% boxplot latency
figure
boxplot(medlat,'labels',{'HC/EC'})
title('T2 seen')
ylabel('latency (ms)')
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
set(a(3), 'Color', 'k'); % set frame color to black
h = findobj(gca,'Tag','Box');
patch(get(h(1),'XData'),get(h(1),'YData'),[0.4660 0.6740 0.1880],'FaceAlpha',.5); %fill box with green
set(a(2), 'Color', 'b');   % Set the color of median to blue
hold on
plot(ones(26,1),medlat,'o','MarkerSize',4,'MarkerFaceColor','#0072BD') %add single latency datapoints