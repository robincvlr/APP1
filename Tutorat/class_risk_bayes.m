%By Afaf Taik
%Methode de classification utilisant le risque tel que defini par Bayes
ref_P300 = load("Donnees/ref_P300");
ref_NP300 = load("Donnees/ref_NP300"); 
[lines,columns] = size(ref_P300);
[Nlines,Ncolumns] = size(ref_NP300);
Ntotal=lines+Nlines;

ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];

%Probabilites a priori
%P_CP300=lines/Ntotal;
%P_CNP300=Nlines/Ntotal;
#======================================================
#Dans cette partie, nous essayons de faire le calcul de la Vraisemblance en nous basant
#sur les historgrammes 

%definition des extremums des plages de valeurs pour les histogrammes 
Min_X=min(ref_P300(:,1));
%Min_Y=min(min(ref_P300(:,1),min(ref_NP300(:,1))));
Max_X=max(ref_P300(:,1));
%Max_Y=max(max(ref_P300(:,2),max(ref_NP300(:,2))));

#Edges
Edges_x=linspace(Min_X,Max_X,50);
%Edges_y=linspace(Min_Y,Max_Y,50);
#=========================================================
#Histogrammes
Histo_X_P300=histc(ref_P300(:,1),Edges_x);
%Histo_Y_P300=histc(ref_P300(:,2),Edges_y);
Histo_X_NP300=histc(ref_NP300(:,1),Edges_x);
%Histo_Y_NP300=histc(ref_NP300(:,2),Edges_y);


%enregistrement des histogrammes
fid=fopen('Histo_X_P300.txt','w');
fprintf(fid, '%f\t',Histo_X_P300);
fclose(fid);

fid=fopen('Histo_X_NP300.txt','w');
fprintf(fid, '%f\t',Histo_X_NP300);
fclose(fid);




















