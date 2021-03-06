function[hist_coast_moy size_coast_app hist_forest_moy size_forest_app hist_street_moy size_street_app]=init_matrices_images()
  pkg load image
  %==========================================================================================
  %Chargement des fichiers de donnees
  d_coast = dir("Coasts");
  size_coast = length(find([d_coast.isdir]==0));
  size_coast_app = round(80*size_coast/100);% 80% de la base pour apprentissage 
  
  d_forest = dir("Forests");
  size_forest = length(find([d_forest.isdir]==0));
  size_forest_app = round(80*size_forest/100);% 80% de la base pour apprentissage 
  
  d_street = dir("Streets");
  size_street = length(find([d_street.isdir]==0));
  size_street_app = round(80*size_street/100);% 80% de la base pour apprentissage 
  %==========================================================================================
  %Composition des histogrammes moyens
  %Pour les COAST
  filename=strcat("Coasts/coast",num2str(1),".jpg");
  file = imread(filename);
  hist_coast_moy= JR_Hist3Composantes(file);%hist composantes R/G/B 
  for(i=2:size_coast_app)
    filename=strcat("Coasts/coast",num2str(i),".jpg");
    file = imread(filename);
    hist_coast_moy = hist_coast_moy + JR_Hist3Composantes(file);%hist composantes R/G/B   
  endfor
  %Calul de la matrice moyenne des histogrammes COAST
  hist_coast_moy = hist_coast_moy*(1/size_coast_app);%moyenne hist composante 
  %Affichage des dimensions
  [lines,columns,dim]=size(hist_coast_moy);
  printf("La matrice HISTO MOYENNE des COAST est de taille : %d par %d par %d\n", lines, columns, dim);
  
   %% Sortie graphique COAST
  %hFig = figure;
  %hold on
  %% A completer le code pour pouvoir le faire fonctionner
  %h(1) = stem(1:256, hist_coast_moy(1),'r'); % y pour jaune, r pour rouge
  %h(2) = stem(1:256, hist_coast_moy(2),'g'); % m pour magenta, g pour green
  %h(3) = stem(1:256, hist_coast_moy(3),'b'); % c pour cyan, b pour bleu
  %title('Histogrammes moyenne des composantes COAST. Rouge: R., Vert: G., Bleu: B.');
  %==========================================================================================
  
endfunction