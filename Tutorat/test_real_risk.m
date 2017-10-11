%Afaf Taik
load Histo_X_P300.txt;
load Histo_X_NP300.txt;

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


X_P300=round(80*135/100);
X_NP300=round(80*540/100);
%Nombre de lignes de test, les 80 premières sont utilisées pendant l'apprentissage
l=lines-X_P300;
L=Nlines-X_NP300;

%estimation des classes pour les données de test
Classe_estimee_P300=zeros(1,l);
Classe_estimee_NP300=zeros(1,L);

i=X_P300;
while i<lines
  Classe_estimee_P300(1,i)=classe_estimee(ref_P300(i,1)); 
  i=i+1;
endwhile

j=X_NP300;
while j<Nlines
  Classe_estimee_NP300(1,j)=classe_estimee(ref_NP300(j,1));
  j=j+1;
endwhile


T_apprentissage=(L+sum(Classe_estimee_P300)-sum(Classe_estimee_NP300))*100/(l+L);
printf("le taux d'apprentissage est : " );
disp(T_apprentissage);