%Par Robin Cavalieri
function class_gauss
#==========================================================================================
  %Chargement des fichiers de donnees 
  ref_P300 = load("Donnees/ref_P300");
  ref_NP300 = load("Donnees/ref_NP300"); 
#==========================================================================================
  %Suppression des deux premieres colonnes de donnees : passage a  2D
  ref_P300(:,1) = [];
  ref_P300(:,1) = [];
  [lines,columns] = size(ref_P300);
  printf("La matrice P300 de reference est de taille : %d par %d\n",lines,columns);
  ref_NP300(:,1) = [];
  ref_NP300(:,1) = [];
  [Nlines,Ncolumns] = size(ref_NP300);
  printf("La matrice NP300 de reference est de taille : %d par %d\n",Nlines,Ncolumns);
  printf("Traitement des matrices realise...\n\n");
#========================================================================================== 
  %evaluation des probabilites par loi binomiale: 
  %Les pourcentages sont les probabilités pour un nombre d'échantillons important 
  printf("Nombre d'echantillons : %d\n",lines+Nlines);
  p_P300 = lines/(lines+Nlines);
  p_NP300 = 1-p_P300;
  printf("Les probabilites sont : \n-p(P300) : %d\n-p(NP300) : %d\n\n",p_P300,p_NP300);
#========================================================================================== 
  %Equation du cout 
  %Probabilite gausienne
  log(4*sqrtm(1.5e-5/2.4412e-4))=-1/2*(759.07*x^2+353.37*y^2-714.76*x*y+950.27*x-680.48*y+1043.2);
#========================================================================================== 
  %Calcul de la frontiere
  plot(ref_P300(:,3),ref_P300(:,4),'*',ref_NP300(:,3),ref_NP300(:,4),'+');
  title("Frontiere entre P300 et NP300 par loi gausienne");
endfunction
