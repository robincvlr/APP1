%Par Robin Cavalieri
function class_gauss
#==========================================================================================
  %Chargement des fichiers de donnees 
  ref_P300 = load("Donnees/ref_P300");
  ref_NP300 = load("Donnees/ref_NP300"); 
#==========================================================================================
  %Suppression des deux premieres colonnes de donnees : passage a  1D
  ref_P300(:,1) = [];
  ref_P300(:,1) = [];
  ref_P300(:,1) = [];
  [lines,columns] = size(ref_P300);
  printf("La matrice P300 de reference est de taille : %d par %d\n",lines,columns);
  ref_NP300(:,1) = [];
  ref_NP300(:,1) = [];
  ref_NP300(:,1) = [];
  [Nlines,Ncolumns] = size(ref_NP300);
  printf("La matrice NP300 de reference est de taille : %d par %d\n",Nlines,Ncolumns);
  printf("Traitement des matrices realise...\n\n");
#========================================================================================== 
  %evaluation des probabilites : 
  %Les pourcentages sont les probabilités pour un nombre d'échantillons important 
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
  plotyy(ref_P300(:,1),'+g',ref_NP300(:,1),'or',x, f, '-b');
  title("P300 et NP300 par loi gausienne en 1D avec frontiere");
endfunction
