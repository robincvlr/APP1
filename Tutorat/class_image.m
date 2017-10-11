%Par Robin Cavalieri  
%Classification d'images à partir des couleurs (plage, forets, urbain)
%Fonctionne pour RGB, YUV et LAB
pkg load image 
%==========================================================================================
%Chargement des fichiers de donnees
d_coast = dir("Images/Coasts");
size_coast = length(find([d_coast.isdir]==0));

d_forest = dir("Images/Forests");
size_forest = length(find([d_forest.isdir]==0));

d_street = dir("Images/Streets");
size_street = length(find([d_street.isdir]==0));

%==========================================================================================
%Composition des matrices de reference
for(i=1:size_coast)
  filename=strcat("Images/Coasts/coast",num2str(i),".jpg");
  ref_coast = ref_coast + imread(filename);
endfor
%Calul de la matrice moyenne de composantes COAST
ref_coast = ref_coast/size_coast;
%Affichage des dimensions
[lines, columns] = size(ref_coast);
printf("La matrice moyenne des COAST est de taille : %d par %d\n", lines, columns);

%==========================================================================================
%Calcul des matrices de covariance de chaque classe 
%COASTS
%FORESTS
%STREET