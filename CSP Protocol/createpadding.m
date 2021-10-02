function y=createpadding(paddingsize)
% paddingsize=8;
x=paddingsize*8;


y=zeros(1,x);
% y=conv2dec(y)

[m,n]=size(y);
 y=reshape(y,n/8,[]);
 de = bi2de(y);
 y=de';
end