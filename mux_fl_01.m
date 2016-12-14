% clc;clear;close all;
% 后部数据处理
% load line_test_01

ts=0.000001;    %采样间隔
sweep=10000/0.1;
c=1e2;

delay_1=r{1}./c;
delay_2=r{2}./c;
delay_3=r{3}./c;

t_start=1;
t_end=1.7;

sim('mix_fl_01.mdl');
% load ScopeData_01

delay = max([delay_1,delay_2,delay_3]);
lenB=floor(delay/ts)+2;
Ts=ScopeData.time;%(lenB:end);

Ds=[];ff={[],[],[]};
for i = 2:4
    Ds = ScopeData.signals(i).values;%(lenB:end);
    ff{i-1} = [ff{i-1},mux_fTr_01(Ts,Ds)];
end
r_percError=[];
for i = 1:3
    r_simulink{i} = (ff{i}./sweep).*c;
    r_compare{i}=[sort(r{i});sort(r_simulink{i})];
    r_percError=[r_percError;abs(r_compare{i}(1,:)-r_compare{i}(2,:))./r_compare{i}(1,:)*100];
end
r_total_percError=mean(mean(r_percError));

figure
hold on
grid on
title('XoY')
xlabel('x');ylabel('y')
axis([0 4 0 4 0 4]);
