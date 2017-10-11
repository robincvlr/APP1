%Afaf Taik
load Histo_X_P300.txt;
load Histo_X_NP300.txt;

ref_P300 = load("test_P300.txt");
ref_NP300 = load("test_NP300.txt"); 

ref_P300=ref_P300';
ref_NP300=ref_NP300';


[lines,columns] = size(ref_P300);
[Nlines,Ncolumns] = size(ref_NP300);
Ntotal=lines+Nlines;

%On a divisé les données en 80% pour l apprentissage et 20% pour le test
%ça c est le nombre de lignes pour P300 et NP300 pour l apprentissage 
%X_P300=round(80*135/100);
%X_NP300=round(80*540/100);
%Nombre de lignes de test, les 80% premières sont utilisées pendant l'apprentissage
l=lines;
L=Nlines;

%estimation des classes pour les données de test
Classe_estimee_P300=zeros(l,1);
Classe_estimee_NP300=zeros(L,1);
i=1;
while i<lines
  Classe_estimee_P300(i)=classe_estimee(ref_P300(i,1)); 
  i=i+1;
endwhile

j=1;
while j<Nlines
  Classe_estimee_NP300(j)=classe_estimee(ref_NP300(j,1));
  j=j+1;
endwhile

%disp(Classe_estimee_P300);
%disp(Classe_estimee_NP300);

%Calcul du taux d'apprentissage dans ce cas
T_apprentissage=(L+sum(Classe_estimee_P300)-sum(Classe_estimee_NP300))*100/(l+L);
printf("le taux d'apprentissage est : " );
disp(T_apprentissage);