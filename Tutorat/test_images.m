%Par AFaf Taik - Zakaria Belgoum
pkg load image
  d_coast = dir("Images/Coasts");
  size_coast = length(find([d_coast.isdir]==0));
  size_coast_app = round(80*size_coast/100);% 80% de la base pour apprentissage 
  
  d_forest = dir("Images/Forests");
  size_forest = length(find([d_forest.isdir]==0));
  size_forest_app = round(80*size_forest/100);% 80% de la base pour apprentissage 
  
  d_street = dir("Images/Streets");
  size_street = length(find([d_street.isdir]==0));
  size_street_app = round(80*size_street/100);

  
  total=size_street+size_coast+size_forest;
  Ntest=total - size_forest_app-size_coast_app-size_street_app;

%Probabilités à priori
P_1=size_forest/total;
P_2=size_coast/total;
P_3=size_street/total;

 %chargement des histogrammes moyens
load h_foret.txt;
load h_plage.txt;
load h_rue.txt;


compteur1=0;
compteur2=0;
compteur3=0;

%test des images
for i=size_forest_app+1:size_forest
  filename=strcat("Images/Forests/forest",num2str(i),".jpg");
  file = imread(filename);
  classe= Class_Img(file,h_foret,h_plage,h_rue,P_1,P_2,P_3);
  if classe==1
    compteur1=compteur1+1;
  endif
endfor

for i=size_coast_app+1:size_coast
  filename=strcat("Images/Coasts/coast",num2str(i),".jpg");
  file = imread(filename);
  classe= Class_Img(file,h_foret,h_plage,h_rue,P_1,P_2,P_3);
  if classe==2
    compteur2=compteur2+1;
  endif
  
endfor

for i=size_street_app+1:size_street
  filename=strcat("Images/Streets/street",num2str(i),".jpg");
  file = imread(filename);
  classe= Class_Img(file,h_foret,h_plage,h_rue,P_1,P_2,P_3);
  if classe==3
    compteur3=compteur3+1;
  endif
endfor

T=(compteur1+compteur2+compteur3)*100/Ntest;

printf("taux d'apprentissage est : %f\n",T);

