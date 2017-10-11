%Par Robin Cavalieri
%Etape d'étude préliminaire des données avec études des lois de probabilité
%==========================================================================================
  %Création des vecteur de données (P300)
  ref_P300 = load("Donnees/ref_P300");
  ref_NP300 = load("Donnees/ref_NP300");
%==========================================================================================
  %connaitre la taille des matrices de données
  [i,j] = size(ref_P300);
  [k,l] = size(ref_NP300);
  printf("La TAILLE des archives P300 est : %d par %d\n\n",i,j);
  printf("La TAILLE des archives NP300 est : %d par %d\n\n",k,l);
%==========================================================================================
  %calcul de la moyenne 
  moy_ref_P300 = mean(ref_P300);
  printf("Matrice MOYENNE des données brutes P300 : \n");
  disp(moy_ref_P300);
  printf("\n");
  moy_ref_NP300 = mean(ref_NP300);
  printf("Matrice MOYENNE des données brutes NP300 : \n");
  disp(moy_ref_NP300);
%==========================================================================================
  %calcul des matrices de covariance pour C1 et C2
  cov_P300 = cov(ref_P300);
  printf("\nMatrice de COVARIANCE des données P300 : \n");
  disp(cov_P300);
  printf("\n");
  cov_NP300 = cov(ref_NP300);
  printf("Matrice de COVARIANCE des données NP300 : \n");
  disp(cov_NP300);
  printf("\n");
%==========================================================================================
  %calcul des valeurs propres et des vecteurs propres des matrices de covariance
  %1 - valeurs propres et vecteurs propres pour cov_P300
  [vecteurs_pro_cov_P300, valeurs_pro_cov_P300] = eig(cov_P300);
  printf("\nMatrice de COVARIANCE DIAGONALISEE des données P300 : \n");
  disp(valeurs_pro_cov_P300);
  printf("\n");
  %2 - valeurs propres et vecteurs propres pour cov_NP300
  [vecteurs_pro_cov_NP300, valeurs_pro_cov_NP300] = eig(cov_NP300);
  printf("\nMatrice de COVARIANCE DIAGONALISEE des données NP300 : \n");
  disp(valeurs_pro_cov_NP300);
  printf("\n");
  
%==========================================================================================
  %étape de réduction de la matrice. 
  %Pourquoi réduire ? La réduction de la matrice permet de réduire le temps de calcul via matrice diagonale.
  %valeurs_propres_cov_C2 et C1 sont les matrices de covariance réduites via la fonction eig().
  %Rapporter le problème bidimensionnel à une dimension pour faciliter le traitement 
  %Reduction= introduction d'erreurs
  %Il serait pertinent de travailler avec les 2 valeurs propres les plus élevées de la matrice de covariance.
  %dispersion et répartition des points concernent l'écart type à savoir 
  %Les deux dernières colonnes de données sont à l'origine des valleurs propres les plus élevées. On a donc : 
  plot(ref_P300(:,3),ref_P300(:,4),'*',ref_NP300(:,3),ref_NP300(:,4),'+');
  title("Etude des signaux P300 et NP300 en deux dimensions");