function[hist_coast_moy,size_coast_app,hist_forest_moy,size_forest_app,hist_street_moy,size_street_app]=init_matrices_images()
  %==========================================================================================
  %Chargement des fichiers de donnees
  d_coast = dir("/Coasts");
  size_coast = length(find([d_coast.isdir]==0));
  size_coast_app = round(80*size_coast/100);% 80% de la base pour apprentissage 
  
  d_forest = dir("/Forests");
  size_forest = length(find([d_forest.isdir]==0));
  size_forest_app = round(80*size_forest/100);% 80% de la base pour apprentissage 
  
  d_street = dir("/Streets");
  size_street = length(find([d_street.isdir]==0));
  size_street_app = round(80*size_street/100);% 80% de la base pour apprentissage 
  %==========================================================================================
  %Composition des matrices de reference
  filename=strcat("Images/Coasts/coast",num2str(1),".jpg");
  file=imread(filename);
  histo_coast_moy= JR_Hist3Composantes(filename);%hist composantes R/G/B 
  for(i=2:size_coast_app)
    filename=strcat("Images/Coasts/coast",num2str(i),".jpg");
    file=imread(filename);
    histo_coast_moy = histo_coast_moy + JR_Hist3Composantes(file);%hist composantes R/G/B   
  endfor
  print("hello");
  %Calul de la matrice moyenne des histogrammes COAST
  %hist_coast_R_moy = hist_coast_R_moy*(1/size_coast_app);%moyenne hist composante 
  %Affichage des dimensions
  %[lines,columns]=size(hist_coast_R_moy);
  %printf("La matrice HISTO MOYENNE des COAST est de taille : %d par %d\n", lines, columns);
endfunction