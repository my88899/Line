function drawcircle(n,x,y,radius,color)
% ���廭Բ����, n Ϊ figure ��, x,y ����Բ��, radius Ϊ�뾶
    angle = linspace(0,2*pi,300);
    xx = x + radius*cos(angle);
    yy = y + radius*sin(angle);
%     figure(n);
    plot(xx,yy,color);
end 