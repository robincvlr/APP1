%Par Robin Cavalieri  
%Classification d'images à partir des couleurs (plage, forets, urbain)
%Fonctionne pour RGB, YUV et LAB
pkg load image 
%==========================================================================================
%Chargement des fichiers de donnees
%Initialisation des listes d'images
list_coast = ls('Images/Coasts/*');
size_coast = size(list_coast);

list_forest = ls('Images/Forests/*');
size_forest = size(list_forest);

list_street = ls('Images/Streets/*');
size_street = size(list_street);
%==========================================================================================
%Composition des matrices de reference

ref_coast = imread(filename);
for(i=2:size_coast)
  filename=list_coast(i);
  ref_coast = ref_coast + imread(list_coast(i));
endfor
%Calul de la matrice moyenne de composantes COAST
ref_coast = ref_coast/size_coast;
%Affichage des dimensions
[lines, columns] = size(ref_coast);
printf("La matrice moyenne des COAST est de taille : %d par %d\n", lines, columns);

ref_forest = imread(filename);
for(i=2:size_forest)
  filename=list_forest(i);
  ref_forest = ref_forest + imread(filename);
endfor
%Calul de la matrice moyenne de composantes FOREST 
ref_forest = ref_forest/size_forest;
%Affichage des dimensions
[lines, columns] = size(ref_forest);
printf("La matrice moyenne des FOREST est de taille : %d par %d\n", lines, columns);

ref_street = imread(filename);
for(i=2:size_street)
   filename=list_street(i);
   ref_street = ref_street + imread(filename);
endfor
%Calul de la matrice moyenne de composantes STREET
ref_street = ref_street/size_street;
%Affichage des dimensions
[lines, columns] = size(ref_street);
printf("La matrice moyenne des STREET est de taille : %d par %d\n", lines, columns);
%==========================================================================================
%Calcul des matrices de covariance de chaque classe 
%COASTS
%FORESTS
%STREET