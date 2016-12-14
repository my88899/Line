function drawcircle(n,x,y,radius,color)
% 定义画圆函数, n 为 figure 号, x,y 定义圆心, radius 为半径
    angle = linspace(0,2*pi,300);
    xx = x + radius*cos(angle);
    yy = y + radius*sin(angle);
%     figure(n);
    plot(xx,yy,color);
end 