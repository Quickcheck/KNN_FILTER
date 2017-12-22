%x是需要滤波的图像,n是模板大小(即n×n)  
function d=KNN_filter(x,n,k)       
[height, width]=size(x);   %输入图像是hightxwidth的,且hight>n,width>n 
if (height<n||width<n||k>n*n)
     error(sprintf('Illegal value [ %s ] for parameter: ''n''\n', ...
		n)); 
else
    x1=double(x);  
    x2=x1;  
    for i=1:height-n+1  
        for j=1:width-n+1
           s1=x2(i+(n-1)/2,j+(n-1)/2);
           s(1:n,1:n)=s1;
           x3=x2(i:i+n-1,j:j+n-1)-s;            %减去中心像素值
           x4=zeros(1,n);
           x5=zeros(1,n);
           for m=1:k+1	%考虑中心像素本身
               x4(1,m)=min(min(abs(x3)));             %依次找出矩阵中k个最小值，即与中心像素最接近的像素
               [l1,l2]=find(abs(x3)==min(min(abs(x3))));
               double t;
              % t=x3(l1,l2);
               x5(1,m)=x3(l1,l2);
               l3=max(max(abs(x3)));
               x3(l1,l2)=l3;                    %用最大值将其覆盖，方便找出下一邻近点
               s1=0;
               l1=0;
               l2=0;
               l3=0;                            %清零
           end
           ave=sum(sum(x5))/k;                  %找出k个邻近后，求均值，并赋值至中心像素
           x2(i+(n-1)/2,j+(n-1)/2)=ave+x2(i+(n-1)/2,j+(n-1)/2);
           x3(:,:)=0;
           s(:,:)=0;                            %清零
        end
    end
      
end
%未被赋值的元素取原值  
d=uint8(x2);