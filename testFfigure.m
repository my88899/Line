close all
clc
load r_simulink
antennaPoint = {[1,0,0],[-1,0,0],[0,0,1]};
nParts = 16;

color={'r','b','g'};

figure
hold on
grid on
title('X o Y')
xlabel('x');ylabel('y')
axis([-6 6 0 6]);
plot([2,1],[1.5,1],'b-')
% r = r_simulink{1}(1);
for i = 1:3
    for j = 1:nParts
        r = r_simulink{i}(j);
        drawCircle(1,antennaPoint{i}(1),antennaPoint{i}(2),r,color{i});
%         rectangle('Position',[antennaPoint{i}(1)-r,antennaPoint{i}(2)-r,2*r,2*r],'Curvature',[1,1])
%         axis equal
    end
end


x1 = antennaPoint{1}(1);
y1 = antennaPoint{1}(2);
x2 = antennaPoint{2}(1);
y2 = antennaPoint{2}(2);
x3 = antennaPoint{3}(1);
y3 = antennaPoint{3}(2);

syms X Y
%second antennaPoint loop
for i = 1:nParts
    r2 = r_simulink{2}(i);
    r_near=[];
    site_tmp=[];
    %first antennaPoint loop
    for j =1:nParts
        r1 = r_simulink{1}(j);
        if (r1+r2<=r || abs(r1-r2)>=r)
            continue;
        end
        ot=solve(r1^2==(X-x1)^2+(Y-y1)^2,r2^2==(X-x2)^2+(Y-y2)^2);
        ot.Y;
        w=find(ot.Y<-eps);
        if(length(w)>1)continue;end
        ot.X(w)=[];ot.Y(w)=[];
        site_tmp=[site_tmp;[ot.X,ot.Y]];
        r_tmp=sqrt((ot.X(1)-x3)^2+(ot.Y(1)-y3)^2);
        r_near=[r_near,min(abs(r_simulink{3}-r_tmp))];
%         plot(ot.X,ot.Y,'k.','MarkerSize',20)
    end
    [a,b]=min(r_near);
    plot(site_tmp(b,1),site_tmp(b,2),'k.','MarkerSize',20);
end


% r=sqrt((x2-x1)^2+(y2-y1)^2);%圆心距
% 
% r1 = r_simulink{1}(1);
% r2 = r_simulink{2}(1);
% seta=acos((r1^2+r^2-r2^2)/2/r/r1);  %交点以及两圆心的三角形一个内角
% r_seta=atan2(y2-y1,x2-x1);                        %圆心连线的倾角
% alpha=[r_seta-seta,r_seta+seta];  %两个交点
% crossx=x1+r1*cos(alpha);
% crossy=y1+r1*sin(alpha);
% plot(crossx(1),crossy(1),'k.','MarkerSize',20)
% 
% %second antennaPoint loop
% for i = 1:4%nParts
%     r2 = r_simulink{2}(i);
%     r_near=[];
%     site_tmp=[];
%     %first antennaPoint loop
%     for j =1:nParts
%         r1 = r_simulink{1}(j);
% %         if (r1+r2<=r || abs(r1-r2)>=r)
% %             continue;
% %         end
%         seta=acos((r1^2+r^2-r2^2)/2/r/r1);  %交点以及两圆心的三角形一个内角
%         r_seta=atan2(y2-y1,x2-x1);           %圆心连线的倾角
% %         alpha=[r_seta-seta,r_seta+seta];  %两个交点
%         alpha=r_seta-seta;
%         crossx=x1+r1*cos(alpha);
%         crossy=y1+r1*sin(alpha);
%         site_tmp=[site_tmp;[crossx,crossy]];
%         r_tmp=sqrt((crossx-x3)^2+(crossy-y3)^2);
%         r_near=[r_near,min(abs(r_simulink{3}-r_tmp))];
%     end
%     [a,b]=min(r_near);
% %     plot(site_tmp(b,1),site_tmp(b,2),'k.','MarkerSize',20);
%     plot(site_tmp(b,:),'k.','MarkerSize',20);
% % %     pause;
% end
        
        
        









% plot(crossx(1),crossy(1),'k.','MarkerSize',20)

