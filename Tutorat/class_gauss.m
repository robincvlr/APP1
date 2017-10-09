%Par Robin Cavalieri
function class_gauss
#==========================================================================================
  %Chargement des fichiers de donnees 
  ref_P300 = load("Donnees/ref_P300");
  ref_NP300 = load("Donnees/ref_NP300"); 
#==========================================================================================
  %Suppression des deux premieres colonnes de donnees : passage a� 1D
  ref_P300(:,1) = [];
  ref_P300(:,1) = [];
  ref_P300(:,1) = [];
  [lines,columns] = size(ref_P300);
  printf("La matrice P300 de reference est de taille : %d par %d\n",lines,columns);
  ref_NP300(:,1) = [];
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
#==========================================================================================  
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
  printf("La matrice NP300 de reference est de taille : %d par %d\n",Nlines,Ncolumns);
  printf("Traitement des matrices realise...\n\n");
#========================================================================================== 
  %evaluation des probabilites : 
  %Les pourcentages sont les probabilit�s pour un nombre d'�chantillons important 
  printf("Nombre d'echantillons : %d\n",lines+Nlines);
  p_P300 = lines/(lines+Nlines);
  p_NP300 = 1-p_P300;
  printf("Les probabilites sont : \n-p(P300) : %d\n-p(NP300) : %d\n\n",p_P300,p_NP300);
#========================================================================================== 
  %Equation du cout 
  %Probabilite gausienne
  %Calcul de la frontiere
  moy_P300 = mean(ref_P300);
  moy_NP300 = mean(ref_NP300);
  cov_P300 = cov(ref_P300);
  cov_NP300 = cov(ref_NP300);
  x = meshgrid(-1:0.01:0);
  f = log(4*sqrt(cov_P300/cov_NP300))+1/2*((x-moy_P300)*inv(cov_P300)*(x-moy_P300)-(x-moy_NP300)*inv(cov_NP300)*(x-moy_NP300));
  plot(p_P300(:,1),'^v',p_NP300(:,1))
  title("P300 et NP300 par loi gausienne en 1D avec frontiere");
endfunction
