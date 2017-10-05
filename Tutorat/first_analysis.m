#Par Robin Cavalieri
function first_analysis 
#==========================================================================================
  #Création des vecteur de données (P300)
  p_300_C1_temp = load("Points/C1.txt");
  p_300_C2_temp = load("Points/C2.txt");
#==========================================================================================
  #affichage des données recueuillies 
  plot(p_300_C1_temp(:,1),p_300_C1_temp(:,2),'+',p_300_C2_temp(:,1),p_300_C2_temp(:,2),'^');
#==========================================================================================
  #connaitre la taille des matrices de données
  [i,j] = size(p_300_C1_temp);
  printf("La taille temporaire de P300 et P300/ est : %d par %d\n",i,j);
#==========================================================================================
  #transformation en tableau de 1000 vecteurs de données
  #Matrices Transposées 
  p_300_C1 = p_300_C1_temp';
  p_300_C2 = p_300_C2_temp';
  [k,N]=size(p_300_C1);
  printf("La taille finale de P300 et P300/ est : %d par %d\n",k,N);
  printf("Les matrices de données ont été traitées...\n\n");
#==========================================================================================
  #calcul de la moyenne 
  moy_p_300_C1 = [sum(p_300_C1(1,i))/N;sum(p_300_C1(2,i))/N];
  printf("vecteur moyen de C1 : \n");
  disp(moy_p_300_C1);
  printf("\n");
  moy_p_300_C2 = [sum(p_300_C2(1,i))/N;sum(p_300_C2(2,i))/N];
  printf("vecteur moyen de C2 : \n");
  disp(moy_p_300_C2);
  printf("\n");
#==========================================================================================
  #calcul des matrices de covariance pour C1 et C2
  cov_C1=zeros(k,k);
  cov_C2=zeros(k,k);
  cov_C1_temp = p_300_C1 - moy_p_300_C1;
  cov_C2_temp = p_300_C2 - moy_p_300_C2;
  #[i,j] = size(cov_C1_temp);
  #printf("La taille de la matrice temp est : %d par %d\n\n",i,j);
  for i=1:N
    cov_C1 = [(1/(N-1))*(cov_C1_temp*(cov_C1_temp)')]+cov_C1;
    cov_C2 = [(1/(N-1))*(cov_C2_temp*(cov_C2_temp)')]+cov_C2;
  endfor
  [i,j] = size(cov_C1);
  printf("La taille de la matrice de covariance C1 est : %d par %d\n\n",i,j);
  disp(cov_C1);
  printf("\n");
  [i,j] = size(cov_C2);
  printf("La taille de la matrice de covariance C2 est : %d par %d\n\n",i,j);
  disp(cov_C2);
  printf("\n");
#==========================================================================================
  #calcul des valeurs propres et des vecteurs propres des matrices de covariance
  
  #1 - valeurs propres et vecteurs propres pour cov_C1
  [vecteurs_propres_cov_C1, valeurs_propres_cov_C1] = eig(cov_C1);
  
  printf("Les VALEURS propres de la matrice de covariance de C1 sont :\n");
  disp(valeurs_propres_cov_C1);
  printf("\n");
  
  printf("Les VECTEURS propres de la matrice de covariance de C1 sont :\n");
  disp(vecteurs_propres_cov_C1);
  printf("\n");
  
  #2 - valeurs propres et vecteurs propres pour cov_C2
  [vecteurs_propres_cov_C2, valeurs_propres_cov_C2] = eig(cov_C2);
  
  printf("Les VALEURS propres de la matrice de covariance de C2 sont :\n");
  disp(valeurs_propres_cov_C2);
  printf("\n");
  
  printf("Les VECTEURS propres de la matrice de covariance de C2 sont :\n");
  disp(vecteurs_propres_cov_C2);
  printf("\n");
#==========================================================================================
  #étape de réduction de la matrice. 
  #Pourquoi réduire ? La réductionde la matrice permet de réduire le temps de calcul via matrice diagonale.
  #valeurs_propres_cov_C2 et C1 sont les matrices de covariance réduites via la fonction eig().
  #Rapporter le problème bidimensionnel à une dimension pour faciliter le traitement 
  #Reduction= introduction d'erreurs
endfunction