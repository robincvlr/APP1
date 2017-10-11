%Afaf Taik
%K_moyennes
%Le k est fixé à 2 car nous savons que dans le cadre de cette problématique qu'on a 2 classes
function [m1,m2]=KMoyenne(Vecteur, Nbr_max_iterations)
  Barycentres=initialisation(2,Vecteur);
  %Pour enregistrer le barycentre de la j-1 ème itération 
  Barycentres1=Barycentres;
  %Pour enregistrer les nouveaux barycentres
  Barycentres2=zeros(size(Barycentres,1),size(Barycentres,2));
  iteration=2;
  printf("je calcule les barycentres avec la moyenne\n");
  Classes_estimees=zeros(size(Vecteur,1),size(Vecteur,2));
  while iteration<Nbr_max_iterations+1
    for i=1:size(Vecteur,1)
      Classes_estimees(i,1)=plus_proche_centre(Vecteur(i),Barycentres1);
    endfor
    disp(Classes_estimees);
    Barycentres2(1,:)=barycentre(1,Vecteur,Classes_estimees);
    Barycentres2(2,:)=barycentre(2,Vecteur,Classes_estimees);
    Barycentres1=Barycentres2;
    Classes_estimees=plus_proche_centre(Vecteur,Barycentres1);
    iteration=iteration+1;
   endwhile
   m1=Barycentres2(1);
   m2=Barycentres2(2);
endfunction