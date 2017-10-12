%Par 
%Ressort les fréquence des composantes les plus hautes pour chaque classe d'images
function [P1, P2,P3] = freq_moyennes_histo(image,h_foret,h_plage,h_rue)
   histo_image=JR_Hist3Composantes(image);
   %extraction de l'indice de la valeur la plus présente pour les 3 composantes 
  [max_R,idx_R]=max(histo_image(:,1));
  [max_G,idx_G]=max(histo_image(:,2));
  [max_B,idx_B]=max(histo_image(:,3));
  
  P1=h_foret(idx_R,1)*h_foret(idx_G,2)*h_foret(idx_B,3);
  P2=h_plage(idx_R,1)*h_plage(idx_G,2)*h_plage(idx_B,3);
  P3=h_rue(idx_R,1)*h_rue(idx_G,2)*h_rue(idx_B,3);
    
endfunction