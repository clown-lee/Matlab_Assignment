% B=1; %信号带宽
% wc=B;%滤虑波器截止频率
% Ts=pi/B;%采样间隔
% ws=2*pi/Ts%采样角频率
% N=100;%滤波器l时域采样点数
% n=-N:N;
% nTs=n.*Ts;%不样数拥的采样时间
% fs=sinc(nTs/pi);%禹数的采样点
% %恢复信号的采样间隔
% Dt=0.005;
% t=-15:Dt:15;
% %恢复信号的范围
% %信号重构
% fa=fs*Ts*wc/pi*sinc((wc/pi)*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));
% error=abs(fa-sinc(t/pi));%求重构信号与原信号的归一化误差

clear ;clc;
clf;         %clear current figure window
N = 200;     %采样次数
F = 1;       %被采样信号频率1Hz
Ts = 0.0125;   %采样间隔 (second)
Fs = 1/Ts;   %采样频率
T = N*Ts;    %采样时长 视为理想采样，tao=0 采样效果为一条竖直线
 

n = 0:N-1;    %时域采样序列(N个采样) 
NP = floor( (1/F)/(Ts) );    %1个周期采样点数
% floor 函数，向下取整，可以用作信号保持
                             %为了清楚显示波形,只画1个周期 
nTs = n*Ts;         %时域采样时间序列
 
%对下列信号进行研究
g = inline( 'sin(t)+2*sin(2*t)');
 
 
%时域采样
f = g(2*pi*nTs);
hf=figure(1);
subplot(3,1,1);
stem(nTs(1:NP),f(1:NP));%火柴棍图
title(['采样信号,Ts=' num2str(Ts)]);
 
%下面是为了更好地显示出待采样信号的波形
Ts1 = 0.001;                    
NP1 = floor( (1/F)/(Ts1) );
hold on;
plot([0:NP1-1]*Ts1,g([0:NP1-1]*2*pi*Ts1),'r-');
hold off;
 
%下面开始用内插法重建信号
%采样信号: x(n)=f
%采样间隔: T=Ts
%原理(内插法): y(t)=Σx(n)sinc((t-nTs)/Ts)
t1 = 0;     %开始时间
t2 = 1/F;   %结束时间(取信号的1个周期)
Dt = Ts/2;
t=t1:Dt:t2;    
fa = f * sinc( Fs*(ones(length(nTs),1)*t - nTs'*ones(1,length(t))) );
subplot(3,1,2);
plot(t,fa);
title(['重建信号(内插法) Ts=' num2str(Ts)]);

t1 = 0;     %开始时间
t2 = 1/F;   %结束时间(取信号的1个周期)
Dt = Ts/2;
t=t1:Dt:t2;    
fa = f * sinc( Fs*(ones(length(nTs),1)*t - nTs'*ones(1,length(t))) );
subplot(3,1,3);
stairs(t,fa);
% plot(t,fa);
title(['重建信号(零阶保持器法) Ts=' num2str(Ts)]);



 

 












