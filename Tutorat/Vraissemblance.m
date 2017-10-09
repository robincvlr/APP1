%Afaf Taik
function P_X_Classe=Vraissemblance(r,Histogramme,Edges)
 
  x=1;
  while(r>Edges(x+1) && x<100)
     x=x+1;
  endwhile
  if(x<=99)
    P_X_Classe=Histogramme(x);
  else
    P_X_Classe=Histogramme(100);
  endif
endfunction