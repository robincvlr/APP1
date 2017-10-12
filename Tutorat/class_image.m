%Par Robin Cavalieri  
%Classification d'images à partir des couleurs (plage, forets, urbain)
%Pour RGB
pkg load image 
%==========================================================================================
%Initialisation des matrices de données (1 matrice moyenne par classe)
[hist_coast_moy size_coast_app hist_forest_moy size_forest_app hist_street_moy size_street_app] = init_matrices_images();
%==========================================================================================
%Caclul des probabilité de chaque classe 
[C1_freq_coast C2_freq_coast C3_freq_coast C1_freq_forest C2_freq_forest C3_freq_forest C1_freq_street C2_freq_street C3_freq_street] = freq_moyennes_histo(hist_coast_moy, hist_forest_moy, hist_street_moy);
%COAST
p_Classe_coast = C1_freq_coast/256*C2_freq_coast/256*C3_freq_coast/256*(size_coast_app/(size_coast_app+size_forest_app+size_street_app));
printf("La probabilité à postériori de la COAST : %d\n",p_Classe_coast);
%FOREST
p_Classe_forest = C1_freq_forest/256*C2_freq_forest/256*C3_freq_forest/256*(size_forest_app/(size_coast_app+size_forest_app+size_street_app));
printf("La probabilité à postériori de la FOREST : %d\n",p_Classe_forest);
%STREET
p_Classe_street = C1_freq_street/256*C2_freq_street/256*C3_freq_street/256*(size_street_app/(size_coast_app+size_forest_app+size_street_app));
printf("La probabilité à postériori de la STREET : %d\n",p_Classe_street);