% Jean Rouat, 22 septembre 2014, Universite de Sherbrooke
% Fonction permettant de convertir une image RGB en image Lab selon la 
% convention exposee a l'adresse:
% http://en.wikipedia.org/wiki/Lab_color_space
% L: luminosite
% a et b : codent les couleurs
% Ceci permet de mieux separer les composantes couleurs des composantes de
% luminosite TOUT en etant plus proche de la perception visuelle
function imageLab=JR_Rgb2Lab(imageRGB)
% VARIABLES d'entree:
%       - image RGB, matrice a 3 dimensions
%       (nbPixelsHauteur,nbPixelsLargeur,nbComposantes) d'entiers codes sur
%       8 bits
% VARIABLES de sortie:
%       - image Lab, matrice a 3 dimensions
%       (nbPixelsHauteur,nbPixelsLargeur,nbComposantes) d'entiers codes sur
%       8 bits
%%%%%%%%%%%
% testee sur matlab version R2012a et sur octave 3.8.0

%% On fait savoir qu'on veut realiser une conversion de RGB a Lab avec les fonctions d'octave
cform = makecform('srgb2lab'); % creation de la transformation de RGB a Lab

%% On realise la transformation
imageLab = applycform(imageRGB,cform) %% A completer le code pour pouvoir le faire fonctionner