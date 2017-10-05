function exercice1()
  N=20;
  #Génère deux scalaires de 20 nombres aléatoires
  x1=rand(1,N);
  x2=rand(1,N);
  #ouvre une fenetre d'affichage
  figure;  
  plot(x1,x2,'+');
  title(sprintf('Série de points générés aléatoirement : %d',N));
  #vecteur moyenne estimée
  m = [(sum(x1)/N);(sum(x2)/N)];
endfunction