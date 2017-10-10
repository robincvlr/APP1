%Par Robin Cavalieri 
%Juge si le vecteur à classer est dans une classe ou non
function decision_gauss=decision_gauss(p1, p2)
  if(p1 > p2)
    decision_gauss = 1;
  else
    decision_gauss = 0;
  endif
endfunction