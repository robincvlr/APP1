%Par zakaria et robin
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
  %calcul de la matrice de covariance en 2D
   cov_P300 = cov(ref_P300);
  printf("\nMatrice de COVARIANCE des données P300 en 2D : \n");
  disp(cov_P300);
  printf("\n");
  cov_NP300 = cov(ref_NP300);
  printf("Matrice de COVARIANCE des données NP300 en 2D : \n");
  disp(cov_NP300);
  printf("\n");
  #calcul des valeurs propres et des vecteurs propres des matrices de covariance en 2D
  #1 - valeurs propres et vecteurs propres pour cov_P300
  [vecteurs_pro_cov_P300, valeurs_pro_cov_P300] = eig(cov_P300);
  printf("\nMatrice de COVARIANCE REDUITE des données P300 en 2D : \n");
  disp(valeurs_pro_cov_P300);
  printf("\n");
  printf("les vecteurs propres associes sont : \n");
  disp(vecteurs_pro_cov_P300);
  printf("\n");
  #2 - valeurs propres et vecteurs propres pour cov_NP300
  [vecteurs_pro_cov_NP300, valeurs_pro_cov_NP300] = eig(cov_NP300);
  printf("\nMatrice de COVARIANCE REDUITE des données NP300 en 2D : \n");
  disp(valeurs_pro_cov_NP300);
  printf("\n");
  printf("les vecteurs propres associes sont : \n");
  disp(vecteurs_pro_cov_NP300);
  printf("\n");
  % representation des vecteurs P_300 dans la nouveau referenciel
  %p300 dans un referentiel nv et np300 dans un autre ref nv
  [i,j] = size(ref_P300);
  nl = i ;
  disp(nl);
  printf("\n");
  
  printf("old corr np300\n");
PPP=corr(ref_NP300);

disp(PPP);
  printf("old corr p300\n");
  N=corr(ref_P300);
  disp(N);
  printf("ghfhtrytr\n");
  fid = fopen('new_P300.txt','w');
  k=1;
  while k<nl
    ref_P300(k,:)  = ref_P300(k,:) * vecteurs_pro_cov_P300;
    k=k+1;
    fprintf(fid,'%f\t %f\n',ref_P300(k,:));
    
    
    
  endwhile
fclose(fid)


  % representation des vecteurs NP_300 dans la nouveau referenciel
 [i,j] = size(ref_NP300);
 nl1 = i ;
 disp(nl1);
 printf("\n");
 fid = fopen('new_NP300.txt','w');
 k=1;
 while k<nl
  ref_NP300(k,:)  = ref_NP300(k,:) * vecteurs_pro_cov_NP300;
  k=k+1;
  fprintf(fid,'%f\t %f\n',ref_NP300(k,:));
 endwhile
fclose(fid)
%representation des vecteurs apres decorrelation
load new_P300.txt;
load new_NP300.txt;
plot(new_P300(:,1),new_P300(:,2),'+',new_NP300(:,1),new_NP300(:,2),'*');
title("representation des vecteurs dans le nouveau referenciel 2D");
M=corr(new_P300);
printf("new corr p300\n");
disp(M);
printf("new corr np300\n");
PPPP=corr(new_NP300);
disp(PPPP);
#========================================================================
%on en deduit que meme avec le nouveau referenciel les vecteurs restent correles