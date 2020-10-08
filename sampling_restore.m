% B=1; %�źŴ���
% wc=B;%���ǲ�����ֹƵ��
% Ts=pi/B;%�������
% ws=2*pi/Ts%������Ƶ��
% N=100;%�˲���lʱ���������
% n=-N:N;
% nTs=n.*Ts;%������ӵ�Ĳ���ʱ��
% fs=sinc(nTs/pi);%�����Ĳ�����
% %�ָ��źŵĲ������
% Dt=0.005;
% t=-15:Dt:15;
% %�ָ��źŵķ�Χ
% %�ź��ع�
% fa=fs*Ts*wc/pi*sinc((wc/pi)*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));
% error=abs(fa-sinc(t/pi));%���ع��ź���ԭ�źŵĹ�һ�����

clear ;clc;
clf;         %clear current figure window
N = 200;     %��������
F = 1;       %�������ź�Ƶ��1Hz
Ts = 0.0125;   %������� (second)
Fs = 1/Ts;   %����Ƶ��
T = N*Ts;    %����ʱ�� ��Ϊ���������tao=0 ����Ч��Ϊһ����ֱ��
 

n = 0:N-1;    %ʱ���������(N������) 
NP = floor( (1/F)/(Ts) );    %1�����ڲ�������
% floor ����������ȡ�������������źű���
                             %Ϊ�������ʾ����,ֻ��1������ 
nTs = n*Ts;         %ʱ�����ʱ������
 
%�������źŽ����о�
g = inline( 'sin(t)+2*sin(2*t)');
 
 
%ʱ�����
f = g(2*pi*nTs);
hf=figure(1);
subplot(3,1,1);
stem(nTs(1:NP),f(1:NP));%����ͼ
title(['�����ź�,Ts=' num2str(Ts)]);
 
%������Ϊ�˸��õ���ʾ���������źŵĲ���
Ts1 = 0.001;                    
NP1 = floor( (1/F)/(Ts1) );
hold on;
plot([0:NP1-1]*Ts1,g([0:NP1-1]*2*pi*Ts1),'r-');
hold off;
 
%���濪ʼ���ڲ巨�ؽ��ź�
%�����ź�: x(n)=f
%�������: T=Ts
%ԭ��(�ڲ巨): y(t)=��x(n)sinc((t-nTs)/Ts)
t1 = 0;     %��ʼʱ��
t2 = 1/F;   %����ʱ��(ȡ�źŵ�1������)
Dt = Ts/2;
t=t1:Dt:t2;    
fa = f * sinc( Fs*(ones(length(nTs),1)*t - nTs'*ones(1,length(t))) );
subplot(3,1,2);
plot(t,fa);
title(['�ؽ��ź�(�ڲ巨) Ts=' num2str(Ts)]);

t1 = 0;     %��ʼʱ��
t2 = 1/F;   %����ʱ��(ȡ�źŵ�1������)
Dt = Ts/2;
t=t1:Dt:t2;    
fa = f * sinc( Fs*(ones(length(nTs),1)*t - nTs'*ones(1,length(t))) );
subplot(3,1,3);
stairs(t,fa);
% plot(t,fa);
title(['�ؽ��ź�(��ױ�������) Ts=' num2str(Ts)]);



 

 












