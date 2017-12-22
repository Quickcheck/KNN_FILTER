%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%初始化%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
close all;
%%%%%%%%%%%%原始图像及原始图像加噪%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plain=imread('D:\matlab maybework\dip_project_2\lena.jpg'); 
subplot(3,2,1),imshow(plain),title('原始图象'); %显示原始图象  
g=imnoise(plain,'gaussian',0.1,0.002); %加入高斯噪声  
subplot(3,2,2),imshow(g),title('加入高斯噪声之后的图象'); %显示加入高斯噪声之后的图象  

%%%%%%%%%%%%%%%%%%%对比系统自带函数和自定义函数滤波效果%%%%%%%%%%%%%%%%
%实验步骤一：用系统预定义滤波器进行均值滤波  
n=input('请输入均值滤波器模板大小\n');  
A=fspecial('average',n); %生成系统预定义的3X3滤波器  
Y=filter2(A,g)/255;           %用生成的滤波器进行滤波,并归一化  
subplot(3,2,3),imshow(Y),title('系统均值滤波结果'); %显示滤波后的图象  
  
%实验步骤二:用自己的编写的函数进行均值滤波  
Y2=avg_filter(g,n);     %调用自编函数进行均值滤波，n为模板大小  
subplot(3,2,4),imshow(Y2),title('自定义均值滤波结果'); %显示滤波后的图象

%实验步骤三：用系统预定义滤波器进行最相近k邻近滤波


%实验步骤四：用自定义定义滤波器进行最相近k邻近滤波
k=input('请输入灰度相近像素个数k的大小\n'); 
Y4=KNN_filter(g,n,k);     %调用自编函数进行均值滤波，n为模板大小
str=['自定义KNN滤波,k为',num2str(k)];
subplot(3,2,6),imshow(Y4),title(str); %显示滤波后的图象