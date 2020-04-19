%***************************************
%Author: Chaoqun Wang
%Date: 2019-10-15
%***************************************
%% �?程�?始化
clear all; close all;
x_I=1; y_I=1;           % 设置�?始点
x_G=700; y_G=700;       % 设置目标点
Thr=50;                 %设置目标点阈值
Delta= 30;              % 设置扩展步长
%% 建树�?始化
T.v(1).x = x_I;         % T是我们�?�?�的树，v是节点，这里先把起始点加入到T里�?��?�
T.v(1).y = y_I; 
T.v(1).xPrev = x_I;     % 起始节点的父节点�?然是其本身
T.v(1).yPrev = y_I;
T.v(1).dist=0;          %从父节点到该节点的�?离，这里�?��?�欧�?�?离
T.v(1).indPrev = 0;     %
%% 开始构建树——作业部分
figure(1);
ImpRgb=imread('newmap.png');
Imp=rgb2gray(ImpRgb);
imshow(Imp)
xL=size(Imp,1);%地图x轴长度
yL=size(Imp,2);%地图y轴长度
hold on
plot(x_I, y_I, 'ro', 'MarkerSize',10, 'MarkerFaceColor','r');
plot(x_G, y_G, 'go', 'MarkerSize',10, 'MarkerFaceColor','g');% 绘制起点和目标点
count=1;
%% Helpers
% getDist: calculate the distance between two points
% inputs: postion (x1,y1), (x2,y2)
% return: euclidean distance 
getDist = @(x1,y1,x2,y2) sqrt((x1-x2)^2+(y1-y2)^2);



for iter = 1:3000
    x_rand=[0 + (xL - 0) * rand(1,1), 0 + (yL - 0) * rand(1,1) ]; 
    %Step 1: 在地图中�?机采样一个点x_rand
    %�??示：用（x_rand(1),x_rand(2)）表示环境中采样点的�??标
    
    %x_near=[];

	% todo: Kd-tree can be applied to increase efficiency. But here to simply it, a naive approach is adopted.
    %Step 2: �??历树，从树中找到最近邻近点x_near 
    %�??示：x_near已�?在树T里
    distArray = arrayfun(@(x) getDist(x_rand(1),x_rand(2),x.x, x.y),T.v);
	[~,idx] = min(distArray);
	x_near = [T.v(idx).x,T.v(idx).y];
	
    %x_new=[];
    %Step 3: 扩展得到x_new节点
    %�??示：注�?使用扩展步长Delta
	theta = atan2(x_rand(2)-x_near(2),x_rand(1)-x_near(1));
	x_new = [x_near(1)+Delta*cos(theta),x_near(2)+Delta*sin(theta)];
	
    %检查节点是�?�是collision-free
    if ~collisionChecking(x_near,x_new,Imp) 
        continue;
    end
    count=count+1;
	   
    %Step 4: 将x_new�?�入树T 
    %�??示：新节点x_new的父节点是x_near
    T.v(count).x = x_new(1);         
	T.v(count).y = x_new(2); 
	T.v(count).xPrev = x_near(1);     
	T.v(count).yPrev = x_near(2);
	T.v(count).dist=Delta;% todo constant distance?          
	T.v(count).indPrev = idx;  
	
    %Step 5:检查是�?�到达目标点附近 
    %�??示：注�?使用目标点阈值Thr，若当�?节点和终点的欧�?�?离�?于Thr，则跳出当�?for循环
    if getDist(x_new(1),x_new(2),x_G,y_G) < Thr
		plot([x_near(1),x_new(1)],[x_near(2),x_new(2)],'r');
		hold on;
		break;
    end
	
   %Step 6:将x_near和x_new之间的路径画出�?�
   %�??示 1：使用plot绘制，因为�?多次在�?�一张图上绘制线段，所以�?次使用plot�?�需�?接上hold on命令
   %�??示 2：在判断终点�?�件弹出for循环�?，记得把x_near和x_new之间的路径画出�?�
   plot([x_near(1),x_new(1)],[x_near(2),x_new(2)],'r');
   hold on;
   pause(0.1); %暂�?�0.1s，使得RRT扩展过程容易观察
   %disp(iter)
end
%% 路径已�?找到，�??�?�查询
if iter < 2000
    path.pos(1).x = x_G; path.pos(1).y = y_G;
    path.pos(2).x = T.v(end).x; path.pos(2).y = T.v(end).y;
    pathIndex = T.v(end).indPrev; % 终点加入路径
    j=0;
    while 1
        path.pos(j+3).x = T.v(pathIndex).x;
        path.pos(j+3).y = T.v(pathIndex).y;
        pathIndex = T.v(pathIndex).indPrev;
        if pathIndex == 1
            break
        end
        j=j+1;
    end  % 沿终点回溯到起点
    path.pos(end+1).x = x_I; path.pos(end).y = y_I; % 起点加入路径
    for j = 2:length(path.pos)
        plot([path.pos(j).x; path.pos(j-1).x;], [path.pos(j).y; path.pos(j-1).y], 'b', 'Linewidth', 3);
    end
else
    disp('Error, no path found!');
end


