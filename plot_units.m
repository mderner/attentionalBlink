addpath('./InstantaneousFiringRates/');
med=307.2428; % median response latencies to T2 in our dataset (just plots line for orientation)

load unit1 %chose unit to plot (unit1,...unit26)

%plot instantaneous firing rate
subplot(2,1,1)
plot_instantaneousFR(x,m,SEM,med)

%density plot
subplot(2,2,3)
pcolor(xvals, ybins, n');
shading interp
xlabel('ms'); 
ylabel('\muV');