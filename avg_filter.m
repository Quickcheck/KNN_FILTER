%x是需要滤波的图像,n是模板大小(即n×n)  
function d=avg_filter(x,n)     
a(1:n,1:n)=1;   %a即n×n模板,元素全是1  
[height, width]=size(x);   %输入图像是hightxwidth的,且hight>n,width>n 
if (height<n||width<n)
     error(sprintf('Illegal value [ %s ] for parameter: ''n''\n', ...
		n));                %若模板大小大于图像尺寸，提示错误
else
    x1=double(x);  
    x2=x1;  
    for i=1:height-n+1  
        for j=1:width-n+1  
            c=x1(i:i+(n-1),j:j+(n-1)).*a; %取出x1中从(i,j)开始的n行n列元素与模板相乘  
            s=sum(sum(c));                 %求c矩阵中各元素之和  
            x2(i,j)=s/(n*n); %将与模板运算后的各元素的均值赋给模板左上位置的元素  
        end  
    end 
end
%未被赋值的元素取原值  
d=uint8(x2);