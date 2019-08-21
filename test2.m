clc;
clear;
close all;

%% Problem Definition
tic
load ('stone1.mat')
P=finaldata_impose;
global FV
global x0
global F_flag;
F_flag=0;
FV=struct('vertices',[],'faces',[]);
FV.faces=Crust(finaldata_impose);
FV.vertices=finaldata_impose;
% global A;
% global b;
% [A,b]=plane(FV.faces,P);
Ma=max(P);
Mi=min(P);
shp = alphaShape(P,200);
hold on
%plot(shp,'Facecolor','yellow','FaceAlpha',0.1);
avg=sum(P)./numel(P(:,1));
avg1=repmat(avg,size(P,1),1);
Md1=min(sqrt(diag((P-avg1)*(P-avg1)')))*2;
Md2=max(sqrt(diag((P-avg1)*(P-avg1)')))*2;
x0=zeros(1,7);
x0(2:4)=avg;x0(1)=Md1;
shp = alphaShape(P,200);

%% Initialization
Lb=zeros(1,7);
Lb(1)=Md1;Lb(1,2:4)=Mi;
Ub=zeros(1,7);
Ub(1)=Md2;Ub(1,2:4)=Ma;Ub(1,5:7)=ones(1,3).*360;
options = optimoptions('particleswarm','MaxIter',350,'MaxTime',500)
x=particleswarm(@myfun,7,Lb,Ub,options);
%x = ga(@myfun,7,[],[],[],[],Lb,Ub)
subplot(121);
disp([': Best Cost = ' num2str(x(1)*0.01660)]);
finalDia=createDiamond(x(1),x(1,2:4),x(5),x(6),x(7));
plot(shp,'Facecolor','yellow','FaceAlpha',1);
hold on;
plotDiamond(finalDia);
subplot(122);
plot3(P(:,1),P(:,2),P(:,3),'-','MarkerSize',5,'Color','red');
hold on;
plotDiamond(finalDia);