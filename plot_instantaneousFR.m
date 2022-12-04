function plot_instantaneousFR(x,m,SEM,med)
 %% plot instantaneous firing rate 
 % m=mean of data 
 % SEM=standard error of the mean of data
 % x= timeline in ms 
 % med= median response latencies to T2

 %plot mean instantaneous firing rate +- s.e.m.
curve1 = m + SEM;
curve2 = m - SEM;
x2 = [x, fliplr(x)];
inBetween = [curve1, fliplr(curve2)];
fill(x2, inBetween, [0 0.4470 0.7410], 'LineStyle','none');
alpha(.5)
hold on;
plot(x, m, 'Color', [0 0.4470 0.7410], 'LineWidth', 2);
box off

% add median response latency to plot
y1=ylim;
plot([med,med],[-0.1,y1(2)+0.1],'--','Color',[0.4660 0.6740 0.1880]);
ylim(y1);
xlabel('ms')
ylabel('Hz (mean +/- s.e.m.')
end