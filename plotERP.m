function plotERP(time,data,label)
figure
plot(time,data) %plot ERP
y1=ylim;
hold on
plot([0,0],y1,':k'); %plot stimulus onset
title(label{1}(1:end-1))
xlabel('time(s)')
ylabel('amplitude(\muV)')
end