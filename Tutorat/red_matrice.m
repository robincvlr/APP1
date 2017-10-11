%Par Robin Cavalieri
%fonction utile pour reduire une matrice de i colonnes
function [matrice_reduite] = red_matrice(matrice, i)
   for i=1:i
      matrice(:,1) = [];
   endfor
   matrice_reduite = matrice;
endfunction