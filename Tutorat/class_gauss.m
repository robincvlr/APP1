%Par 
function class_gauss
#==========================================================================================
  %Chargement des fichiers de données 
  ref_P300 = load("Donnees/ref_P300");
  ref_NP300 = load("Donnees/ref_NP300"); 
#==========================================================================================
  %Suppression des deux premières colonnes de données : passage à 2D
  ref_P300(:,1) = [];
  ref_P300(:,1) = [];
  [lines,columns] = size(ref_P300);
  printf("La matrice P300 de référence est de taille : %d par %d\n",lines,columns);
  ref_NP300(:,1) = [];
  ref_NP300(:,1) = [];
  [Nlines,Ncolumns] = size(ref_NP300);
  printf("La matrice NP300 de référence est de taille : %d par %d\n",Nlines,Ncolumns);
  printf("Traitement des matrices réalisé...\n\n");
#========================================================================================== 
  %
endfunction
