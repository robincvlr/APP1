function[ref_coast size_coast_app ref_forest size_forest_app ref_street size_street_app]=init_matrices_images()
  %==========================================================================================
  %Chargement des fichiers de donnees
  d_coast = dir("Images/Coasts");
  size_coast = length(find([d_coast.isdir]==0));
  size_coast_app = round(80*size_coast/100);% 80% de la base pour apprentissage 
  
  d_forest = dir("Images/Forests");
  size_forest = length(find([d_forest.isdir]==0));
  size_forest_app = round(80*size_forest/100);% 80% de la base pour apprentissage 
  
  d_street = dir("Images/Streets");
  size_street = length(find([d_street.isdir]==0));
  size_street_app = round(80*size_street/100);% 80% de la base pour apprentissage 
  %==========================================================================================
  %Composition des matrices de reference
  ref_coast = uint16(imread("Images/Coasts/coast1.jpg"));
  ref_coast = uint16(ref_coast);
  hist_coat_R_moy = imhist("Images/Coasts/coast1.jpg"(:,:,1),256);
  hist_coat_G_moy = imhist("Images/Coasts/coast1.jpg"(:,:,2),256);
  hist_coat_B_moy = imhist("Images/Coasts/coast1.jpg"(:,:,3),256);
  for(i=2:size_coast_app)
    filename=strcat("Images/Coasts/coast",num2str(i),".jpg");
    hist_coast_R_moy = imhist(filename(:,:,1),256);%hist composante 1
    hist_coast_G_moy = imhist(filename(:,:,2),256);%hist composante 2
    hist_coast_B_moy = imhist(filename(:,:,3),256);%hist composante 3
  endfor
  %Calul de la matrice moyenne des histogrammes COAST
  hist_coast_R_moy = hist_coast_R_moy*(1/size_coast_app);%moyenne hist composante 1
  hist_coast_G_moy = hist_coast_G_moy*(1/size_coast_app);%moyenne hist composante 2
  hist_coast_B_moy = hist_coast_B_moy*(1/size_coast_app);%moyenne hist composante 3
  %Affichage des dimensions
  [lines, columns] = size(hist_coast_R_moy);
  printf("La matrice HISTO MOYENNE des COAST est de taille : %d par %d\n", lines, columns);
endfunction