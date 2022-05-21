clear; clc;
%% 导入数据
[chosenfile,chosendirectory] = uigetfile({'*.xlsx';'*.csv'} ) ;
filePath = [chosendirectory chosenfile] ;
table = xlsread(filePath) ;
%% 导入标准
[chosenfile,chosendirectory] = uigetfile({'*.xlsx';'*.csv'} ) ;
filePath_1 = [chosendirectory chosenfile] ;
table_baozhun = xlsread(filePath_1) ;

%% 计算AQI
e = zeros(465,6) ;
for m = 1:465
    for n = 1:6
c = table(m,n) ;
d = table_baozhun(2,n) ;
f = table_baozhun(3,n) ;
g = table_baozhun(4,n) ;
h = table_baozhun(5,n) ;
i = table_baozhun(6,n) ;
j = table_baozhun(7,n) ;
k = table_baozhun(8,n) ;
 if c<d
    e(m,n) = (50./d)*c ;
 else
     if c<f
    e(m,n) = (50./(f-d))*(c-d)+50 ;
     else 
         if c<g
             e(m,n) = 50./(g-f)*(c-f)+100 ;
         else
             if c<h
                 e(m,n) = 50./(h-g)*(c-g)+150 ;
             else
                 if c<i
                     e(m,n) = 100./(i-h)*(c-h)+200 ;
                 else
                     if c<j
                         e(m,n) = 100./(j-i)*(c-i)+300 ;
                     else 
                         e(m,n)=100./(k-j)*(c-j)+400 ;
                     end
                 end
             end
         end
     end
 end
    end
end
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


 