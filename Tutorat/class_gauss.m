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
  % Nouvelles matrices covariances
   #calcul des matrices de covariance pour C1 et C2
  cov_P300 = cov(ref_P300);
  printf("\nMatrice de COVARIANCE des données P300 : \n");
  disp(cov_P300);
  printf("\n");
  cov_NP300 = cov(ref_NP300);
  printf("Matrice de COVARIANCE des données NP300 : \n");
  disp(cov_NP300);
  printf("\n");
  
  
   #calcul des valeurs propres et des vecteurs propres des matrices de covariance
  #1 - valeurs propres et vecteurs propres pour cov_P300
  [vecteurs_pro_cov_P300, valeurs_pro_cov_P300] = eig(cov_P300);
  printf("\nMatrice de COVARIANCE REDUITE des données P300 : \n");
  disp(valeurs_pro_cov_P300);
  printf("\n");
  printf("vecteurs propres \n");
  disp(vecteurs_pro_cov_P300);
   printf("\n");
  #2 - valeurs propres et vecteurs propres pour cov_NP300
  [vecteurs_pro_cov_NP300, valeurs_pro_cov_NP300] = eig(cov_NP300);
  printf("\nMatrice de COVARIANCE REDUITE des données NP300 : \n");
  disp(valeurs_pro_cov_NP300);
  printf("\n");
  
  printf("vecteurs propres \n");
  disp(vecteurs_pro_cov_NP300);
  
  
  M=corr(ref_P300);
  disp(M);
  printf("\n");
  N=corr(ref_NP300);
  disp(N);
#========================================================================================== 
  %
endfunction
