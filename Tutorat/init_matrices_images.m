%Par Robin Cavalieri - Afaf Taik - Zakaria Belgoum
 %Basé sur les algos vus en lab fait Par M. Jean Rouat, Université de Sherbrooke
%Initialisation des histogrammes moyens pour chaque classe d'images
function[hist_coast_moy size_coast_app hist_forest_moy size_forest_app hist_street_moy size_street_app]=init_matrices_images()
  pkg load image
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
  %Composition des histogrammes moyens
  %Pour les COAST
  filename=strcat("Images/Coasts/coast",num2str(1),".jpg");
  file = imread(filename);
  hist_coast_moy= JR_Hist3Composantes(file);%hist composantes R/G/B 
  for(i=2:size_coast_app)
    filename=strcat("Images/Coasts/coast",num2str(i),".jpg");
    file = imread(filename);
    hist_coast_moy = hist_coast_moy + JR_Hist3Composantes(file);%hist composantes R/G/B   
  endfor
  %Calul de la matrice moyenne des histogrammes COAST
  hist_coast_moy = hist_coast_moy*(1/size_coast_app);%moyenne hist composante 
  %Affichage des dimensions
  [lines,columns,dim]=size(hist_coast_moy);
  printf("La matrice HISTO MOYENNE des COAST est de taille : %d par %d par %d\n", lines, columns, dim);
  %enregistrement des histogrammes
  fid=fopen('h_plage.txt','w');
  for i=1:size(hist_coast_moy)
    fprintf(fid, '%f\t%f\t%f\n',hist_coast_moy(i,:));
  endfor
  fclose(fid)
  
  
 
  %% Sortie graphique COAST
  %hFig = figure;
  %hold on
  %% A completer le code pour pouvoir le faire fonctionner
  %h(1) = stem(1:256, hist_coast_moy(1),'r'); % y pour jaune, r pour rouge
  %h(2) = stem(1:256, hist_coast_moy(2),'g'); % m pour magenta, g pour green
  %h(3) = stem(1:256, hist_coast_moy(3),'b'); % c pour cyan, b pour bleu
  %title('Histogrammes moyens des composantes COAST. Rouge: R., Vert: G., Bleu: B.');
  %==========================================================================================
  %Pour les FORESTS
  filename=strcat("Images/Forests/forest",num2str(1),".jpg");
  file = imread(filename);
  hist_forest_moy= JR_Hist3Composantes(file);%hist composantes R/G/B 
  for(i=2:size_forest_app)
    filename=strcat("Images/Forests/forest",num2str(i),".jpg");
    file = imread(filename);
    hist_forest_moy = hist_forest_moy + JR_Hist3Composantes(file);%hist composantes R/G/B   
  endfor
 
  %Calul de la matrice moyenne des histogrammes FOREST
  hist_forest_moy = hist_forest_moy*(1/size_forest_app);%moyenne hist composante 
  %Affichage des dimensions
  [lines,columns,dim]=size(hist_forest_moy);
  printf("La matrice HISTO MOYENNE des FOREST est de taille : %d par %d par %d\n", lines, columns, dim);
  fid=fopen('h_foret.txt','w');

  for i=1:size(hist_forest_moy)
    fprintf(fid, '%f\t%f\t%f\n',hist_forest_moy(i,:));
  endfor
  fclose(fid) 
 
  %Pour les STREETS
  filename=strcat("Images/Streets/street",num2str(1),".jpg");
  file = imread(filename);
  hist_street_moy= JR_Hist3Composantes(file);%hist composantes R/G/B 
  for(i=2:size_street_app)
    filename=strcat("Images/Streets/street",num2str(i),".jpg");
    file = imread(filename);
    hist_street_moy = hist_street_moy + JR_Hist3Composantes(file);%hist composantes R/G/B   
  endfor
  %Calul de la matrice moyenne des histogrammes STREETS
  hist_street_moy = hist_street_moy*(1/size_street_app);%moyenne hist composante 
  fid=fopen('h_rue.txt','w');
  for i=1:size(hist_forest_moy)
    fprintf(fid, '%f\t%f\t%f\n',hist_street_moy(i,:));
  endfor
 
  fclose(fid);

  %Affichage des dimensions
  [lines,columns,dim]=size(hist_street_moy);
  printf("La matrice HISTO MOYENNE des STREET est de taille : %d par %d par %d\n", lines, columns, dim);
  
endfunction