%Afaf Taik
function D=Distance(x,y)
  m=size(x,2);
  D=0;
  for i=1:m
    D=D+(x(1,i)-y(1,i))^2;
  endfor
  D=sqrt(D);
endfunction