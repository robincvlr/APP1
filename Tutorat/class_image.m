%Par Robin Cavalieri  
%Classification d'images à partir des couleurs (plage, forets, urbain)
%Pour RGB
pkg load image 
%==========================================================================================
%Initialisation des matrices de données (1 matrice moyenne par classe)
[ref_coast size_coast_app ref_forest size_forest_app ref_street size_street_app] = init_matrices_images();
nBins = 256;
%==========================================================================================
%Calcul des composantes moyennes  & decoupage
%On sait que le rouge est sur les 256 premières colonnes 
R_coast = ref_coast(:,1:256);
R_forest = ref_forest(:,1:256);
R_street = ref_street(:,1:256);
%On sait que le vert est sur les 256 suivantes 
G_coast = ref_coast(:,257:512);
G_forest = ref_forest(:,257:512);
G_street = ref_street(:,257:512);
%Idem pour le bleu
B_coast = ref_coast(:,513:768);
B_forest = ref_forest(:,513:768);
B_street = ref_street(:,513:768);
%==========================================================================================
%Le decoupage en couleur est fait, desormais je fais la moyenne des des composantes
%Rouge
R_coast_moy = mean(R_coast);
R_forest_moy = mean(R_forest);
R_street_moy = mean(R_street);
%hist(R_coast_moy);
%Vert
G_coast_moy = mean(G_coast);
G_forest_moy = mean(G_forest);
G_street_moy = mean(G_street);
%Bleu
B_coast_moy = mean(B_coast);
B_forest_moy = mean(B_forest);
B_street_moy = mean(B_street);
%==========================================================================================
%Affichages pertinents des moyennes de chaque couleur par classe 
%% Sortie graphique par M. Jean Rouat
hFig = figure;
hold on
%% A completer le code pour pouvoir le faire fonctionner
h(1) = stem(1:256, R_coast_moy,'r'); % y pour jaune, r pour rouge
h(2) = stem(1:256, R_forest_moy,'g'); % m pour magenta, g pour green
h(3) = stem(1:256, R_street_moy,'b'); % c pour cyan, b pour bleu
title('Superposition des 3 histogrammes. Rouge: 1ere comp., Vert: 2nd comp., Bleu: 3iem comp.');
plot(h);
%==========================================================================================
%Calcul des matrices de covariance 
%Pour le rouge
R_coast_cov = cov(R_coast);
R_forest_cov = cov(R_forest);
R_street_cov = cov(R_street);
%Pour le vert
G_coast_cov = cov(G_coast);
G_forest_cov = cov(G_forest);
G_street_cov = cov(G_street);
%Pour le bleu
B_coast_cov = cov(B_coast);
B_forest_cov = cov(B_forest);
B_street_cov = cov(B_street);
%==========================================================================================
%Calcul des probabilités à posteriori
%Entre COAST et FOREST
yCoast_R = 0;
%Entre FOREST et STREET
yForest_R = 0;
%Entre STREET et COAST
yStreet_R = 0;