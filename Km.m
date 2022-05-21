[idx,cen]=kmeans(e,6);
silhouette(e,idx)
color=['r','g','b','y','c','m'];
figure,
for i=1:6
plot(e(idx==i,1),e(idx==i,2),'color',color(i),'LineStyle','none','Marker','*')
hold on
end

a=cen(:,1);
b=cen(:,2);
plot(a,b,'color','k','LineStyle','none','Marker','x')
hold off
grid on