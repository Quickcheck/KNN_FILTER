%x����Ҫ�˲���ͼ��,n��ģ���С(��n��n)  
function d=KNN_filter(x,n,k)       
[height, width]=size(x);   %����ͼ����hightxwidth��,��hight>n,width>n 
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
           x3=x2(i:i+n-1,j:j+n-1)-s;            %��ȥ��������ֵ
           x4=zeros(1,n);
           x5=zeros(1,n);
           for m=1:k+1	%�����������ر���
               x4(1,m)=min(min(abs(x3)));             %�����ҳ�������k����Сֵ����������������ӽ�������
               [l1,l2]=find(abs(x3)==min(min(abs(x3))));
               double t;
              % t=x3(l1,l2);
               x5(1,m)=x3(l1,l2);
               l3=max(max(abs(x3)));
               x3(l1,l2)=l3;                    %�����ֵ���串�ǣ������ҳ���һ�ڽ���
               s1=0;
               l1=0;
               l2=0;
               l3=0;                            %����
           end
           ave=sum(sum(x5))/k;                  %�ҳ�k���ڽ������ֵ������ֵ����������
           x2(i+(n-1)/2,j+(n-1)/2)=ave+x2(i+(n-1)/2,j+(n-1)/2);
           x3(:,:)=0;
           s(:,:)=0;                            %����
        end
    end
      
end
%δ����ֵ��Ԫ��ȡԭֵ  
d=uint8(x2);