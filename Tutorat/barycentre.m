%Afaf Taik
function B=barycentre(k,V,C)
  %k : num de la classe
  %V : ensemble de tt les vecteurs
  %C : classes estimees pr tt les vecteurs
  B=0;
  total=0;
  for i=1:size(V)
    printf("je calcule les barycentres\n");
    if C(i,1)==k
      B=B+V(i);
      total=total+1;
    endif
   endfor
   B=B/total;
 endfunction
 