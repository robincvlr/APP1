function exercice1()
  N=20;
  param_loop=10;
  #Répétition 10 fois et stockage des valeurs 
  for i=1:param_loop
     #Génère deux scalaires de 20 nombres aléatoires
     x1=rand(1,N);
     x2=rand(1,N);
     #ouvre une fenetre d'affichage
     #figure;  
     #plot(x1,x2,'+');
     #title(sprintf('Série de points générés aléatoirement : %d',N));
     #vecteur moyenne estimée
     m = [(sum(x1)/N);(sum(x2)/N)]; 
     disp(m);
     #construction matrice de covariance
     cov_temp = [(x1-m(1));(x2-m(2))];
     cov = (1/(N-1))*cov_temp*cov_temp';
     #stockage des moyennes
     M(1,i)=(sum(x1)/N);
     M(2,i)=(sum(x2)/N);
     #stockage des covariances 
     cov_moy_11 = 0;
     cov_moy_12 = 0;
     cov_moy_21 = 0;
     cov_moy_22 = 0;
     cov_moy_11 = cov(1,1)+cov_moy_11;
     cov_moy_12 = cov(1,2)+cov_moy_12;
     cov_moy_21 = cov(2,1)+cov_moy_21;
     cov_moy_22 = cov(2,2)+cov_moy_22; 
   endfor
   printf("\n");
   printf("Matrice de stockage des moyennes :\n");
   disp(M);
   printf("\n"); 
   #peuplage de la matrice
   COV(1,1)=cov_moy_11/param_loop;
   COV(1,2)=cov_moy_12/param_loop;
   COV(2,1)=cov_moy_21/param_loop;
   COV(2,2)=cov_moy_22/param_loop;
   printf("\n");
   printf("Matrice de covariance moyenne :\n");
   disp(COV);
   printf("\n");
   n_axis = [10,20,50,100,500];
   [vecteurs_propres_cov, COV_reduite] = eig(COV);
   printf("\n");
   printf("Matrice de covariance réduite :\n");
   disp(COV_reduite);
   printf("\n");
   ###########################
endfunction