%Par Robin Cavalieri
#==========================================================================================
%Chargement des fichiers de donnees 
ref_P300 = load("Donnees/ref_P300");
ref_NP300 = load("Donnees/ref_NP300"); 
#==========================================================================================
%Suppression des trois premieres colonnes de donnees : passage a� 1D
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
printf("vecteurs propres cov P300\n");
disp(vecteurs_pro_cov_P300);
printf("\n");
#2 - valeurs propres et vecteurs propres pour cov_NP300
[vecteurs_pro_cov_NP300, valeurs_pro_cov_NP300] = eig(cov_NP300);
printf("\nMatrice de COVARIANCE REDUITE des données NP300 : \n");
disp(valeurs_pro_cov_NP300);
printf("\n");
printf("vecteurs propres cov NP300:\n");
disp(vecteurs_pro_cov_NP300);
M=corr(ref_P300);
N=corr(ref_NP300);
printf("\nLa matrice NP300 de reference est de taille : %d par %d\n",Nlines,Ncolumns);
printf("Traitement des matrices realise...\n");
#========================================================================================== 
%evaluation des probabilites : 
%Les pourcentages sont les probabilites pour un nombre d'echantillons important 
printf("Nombre d'echantillons : %d\n",lines+Nlines);
p_P300 = lines/(lines+Nlines);
p_NP300 = 1-p_P300;
printf("Les probabilites sont : \n-p(P300) : %d\n-p(NP300) : %d\n\n",p_P300,p_NP300);
#========================================================================================== 
%Probabilite gausienne
%Pas de calcul de la frontiere / utilisation des probabilités
moy_P300 = mean(ref_P300);
moy_NP300 = mean(ref_NP300);
cov_P300 = cov(ref_P300);
cov_NP300 = cov(ref_NP300);
plot(ref_P300(:,1),'^g',ref_NP300(:,1),'+r');
xlabel("n° echantillon");
ylabel("valeur echantillon");
title("P300(V) et NP300(R) par loi gausienne en 1D avec frontiere");
#========================================================================================== 
%Appel de la fonction de décision
test_P300 = load("Donnees/test_P300");
test_P300(:,1) = [];
test_P300(:,1) = [];
test_P300(:,1) = [];
compteurP300 = 0;
[lines, columns] = size(test_P300);
for i=1:lines
  p1 = proba_post(test_P300(i,1),cov_P300,moy_P300);
  p2 = proba_post(test_P300(i,1),cov_NP300,moy_NP300);
  temp = decision_gauss(p1,p2);
  if(temp==1)
    compteurP300 = compteurP300 + 1;
  endif
endfor
test_NP300 = load("Donnees/test_NP300");
test_NP300(:,1) = [];
test_NP300(:,1) = [];
test_NP300(:,1) = [];
compteurNP300 = 0;
[lines, columns] = size(test_NP300);
for i=1:lines
  p1 = proba_post(test_NP300(i,1),cov_NP300,moy_NP300);
  p2 = proba_post(test_NP300(i,1),cov_P300,moy_P300)
  temp = decision_gauss(p1,p2);
  if(temp==1)
    compteurNP300 = compteurNP300 + 1;
  endif
endfor
printf("En TESTANT les P300, nous avons classé correctement %d vecteurs sur %d.\n",compteurP300,lines);
printf("En TESTANT les NP300, nous avons classé correctement %d vecteurs sur %d.\n",compteurNP300,lines);
taux_classification = (compteurP300 + compteurNP300)/(2*lines);
printf("Le TAUX DE CLASSIFICATION est : %d\n",taux_classification);
%Vu le faible taux de classifiation, nous pouvons en conclure que la loi de distribution n'est pas gausienne