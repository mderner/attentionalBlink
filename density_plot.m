function density_plot(spikes)
%%function density_plot(spikes)

lbound=floor(min(min(spikes)));  %Lowest point of the figure
ubound=ceil(max(max(spikes)));  %Highest point of the figure
vps=size(spikes,2);   %Values per spike (64 without interpolation)

%Make the 2D histogram
ybins=linspace(lbound,ubound,150);  %Vector of bins in vertical direction
ybinSize=ybins(2)-ybins(1);         %Size of a bin in vertical direction
numXbins=vps;                       %Number of bins in horizontal direction
numYbins=length(ybins);             %Number of bins in vertical direction
n=zeros(numXbins,numYbins);         %Preallocate 2D histogram

%Bin count
for k=1:numXbins
    for j=1:numYbins
        n(k,j)= sum ( spikes(:,k) <= ybins(j)+ybinSize/2 & spikes(:,k) > ybins(j)-ybinSize/2);
    end
end

% remove extreme outliers in order to keep color resolution
cutoff = 5*std(reshape(n,numel(n),1)); %magic cutoff for too high bin values
n(n>cutoff) = cutoff; %replace n with n without too high bin values
% pcolor(n'),shading interp % plot the 2D histogram
xvals = [-19:44]*1000/(2^15); %timestamps for spike
try
    pcolor(xvals, ybins, n');
catch
    pcolor(n')
end

shading interp

xlabel('ms'); 
ylabel('\muV');