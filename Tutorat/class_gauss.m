%Par Robin Cavalieri
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
  %évaluation des probabilités : 
  p_P300 = lines/(lines+Nlines);
  p_NP300 = Nlines/(lines+Nlines);
  printf("Les probabilités sont : \n-p(P300) : %d\n-p(NP300) : %d\n\n",p_P300,p_NP300);
#========================================================================================== 
  %Equation du cout 
  X=[x;y];
  R_P300 = 3*p_P300*(1/(2*pi*sqrt(det(cov(ref_P300)))))*exp(-0,5*(transpose(X-mean(ref_P300)))*inv(cov(ref_P300))*(X-mean(ref_P300)));
#========================================================================================== 
  %Calcul de la frontière
  
  
endfunction
