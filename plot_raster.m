function h = plot_raster(spikes, x, plot_colors)
%% function h = plot_raster(spikes, x, plot_colors)
% does a raster plot of spike-times
% spikes is expected to be a cell array of vectors of spike-times
% per trial (e.g. spikes{trialnr} = [-199, 20, 25, 46...]
% x denotes the x-axis in time (same unit as spikes, most of the
% time : milliseconds)
%
% optional arguments for different colors
% plot_colors: n by 3 array of rgb-color values, n=number of
% conditions

ntrials = length(spikes);

if ~exist('plot_colors', 'var') || isempty(plot_colors)
    plot_colors = [0 0 0];
end

linewidth = 1.2;

disp_between = 1/ntrials;
line_height = (3/5)*disp_between;
hold on
a = 1;
for t=1:ntrials
    if ~isempty(spikes{t})
        %% plot the spikes
        for j=1:length(spikes{t})
            line([spikes{t}(j) spikes{t}(j)],[a a-line_height], 'color', ...
                 plot_colors, 'LineWidth',linewidth);
        end
        
    end
    a = a - disp_between;
end

xlim([x(1) x(end)]);
plot([0 0], [0 1], ':k');

box off
axis off

h = gca;
hold on;
