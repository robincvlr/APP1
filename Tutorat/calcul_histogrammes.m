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
Min_X=min(min(ref_P300(:,1)),min(ref_NP300(:,1)));
Max_X=max(max(ref_P300(:,1)),max(ref_NP300(:,1)));

#Edges
Edges_x=linspace(Min_X,Max_X,100);

X_P300=round(80*135/100);
X_NP300=round(80*540/100);
#=========================================================
#Histogrammes
Histo_X_P300=histc(ref_P300(1:X_P300,1),Edges_x);
Histo_X_NP300=histc(ref_NP300(1:X_NP300,1),Edges_x);


%enregistrement des histogrammes
fid=fopen('Histo_X_P300.txt','w');
fprintf(fid, '%f\t',Histo_X_P300);
fclose(fid);

fid=fopen('Histo_X_NP300.txt','w');
fprintf(fid, '%f\t',Histo_X_NP300);
fclose(fid);


fid=fopen('Edges.txt','w');
fprintf(fid, '%f\t',Edges_x);
fclose(fid);

















