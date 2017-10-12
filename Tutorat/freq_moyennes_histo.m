%Par Robin Cavalieri
%Ressort les fréquence des composantes les plus hautes pour chaque classe d'images
function [C1_freq_coast C2_freq_coast C3_freq_coast C1_freq_forest C2_freq_forest C3_freq_forest C1_freq_street C2_freq_street C3_freq_street] = freq_moyennes_histo(hist_coast_moy, hist_forest_moy, hist_street_moy)
  %On travaille sur des plages de 8
  C1_freq_coast = round(max(hist_coast_moy(:,1))/32);
  printf("max freq C1_coast pour : %d\n",C1_freq_coast);
  C2_freq_coast = round(max(hist_coast_moy(:,2))/32);
  printf("max freq C2_coast pour : %d\n",C2_freq_coast);
  C3_freq_coast = round(max(hist_coast_moy(:,2))/32);
  printf("max freq C3_coast pour : %d\n",C3_freq_coast);
  
  C1_freq_forest = round(max(hist_forest_moy(:,1))/32);
  printf("max freq C1_forest pour : %d\n",C1_freq_forest);
  C2_freq_forest = round(max(hist_forest_moy(:,2))/32);
  printf("max freq C2_forest pour : %d\n",C2_freq_forest);
  C3_freq_forest = round(max(hist_forest_moy(:,3))/32);
  printf("max freq C3_forest pour : %d\n",C3_freq_forest);
  
  C1_freq_street = round(max(hist_street_moy(:,1))/32);
  printf("max freq C1_street pour : %d\n",C1_freq_street);
  C2_freq_street = round(max(hist_street_moy(:,2))/32);
  printf("max freq C2_street pour : %d\n",C2_freq_street);
  C3_freq_street = round(max(hist_street_moy(:,3))/32);
  printf("max freq C3_street pour : %d\n",C3_freq_street);
endfunction