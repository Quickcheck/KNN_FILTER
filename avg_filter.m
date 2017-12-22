%x����Ҫ�˲���ͼ��,n��ģ���С(��n��n)  
function d=avg_filter(x,n)     
a(1:n,1:n)=1;   %a��n��nģ��,Ԫ��ȫ��1  
[height, width]=size(x);   %����ͼ����hightxwidth��,��hight>n,width>n 
if (height<n||width<n)
     error(sprintf('Illegal value [ %s ] for parameter: ''n''\n', ...
		n));                %��ģ���С����ͼ��ߴ磬��ʾ����
else
    x1=double(x);  
    x2=x1;  
    for i=1:height-n+1  
        for j=1:width-n+1  
            c=x1(i:i+(n-1),j:j+(n-1)).*a; %ȡ��x1�д�(i,j)��ʼ��n��n��Ԫ����ģ�����  
            s=sum(sum(c));                 %��c�����и�Ԫ��֮��  
            x2(i,j)=s/(n*n); %����ģ�������ĸ�Ԫ�صľ�ֵ����ģ������λ�õ�Ԫ��  
        end  
    end 
end
%δ����ֵ��Ԫ��ȡԭֵ  
d=uint8(x2);