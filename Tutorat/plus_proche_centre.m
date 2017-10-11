%Afaf Taik
function ppc=plus_proche_centre(x,barycentres)
  sizeD=size(barycentres);
  D=zeros(sizeD,1);
  for i=1:sizeD
    D(i)=Distance(x,barycentres(i));
    printf("je calcule les plus proches centres\n");
  endfor
  ppc=min(D,2);
  D=[];
endfunction 
    
      
  