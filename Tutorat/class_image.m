%Par Robin Cavalieri  
%Classification d'images à partir des couleurs (plage, forets, urbain)
%Fonctionne pour RGB, YUV et LAB
pkg load image 
#==========================================================================================
%Chargement des fichiers de donnees
   
   Hist3Composantes = JR_Hist3Composantes(image);
   ref_coast = ;
   ref_forest = ;
   ref_urban = ;