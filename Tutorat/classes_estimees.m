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


%estimation des classes pour les ref
Classe_estimee_P300=zeros(1,lines);
Classe_estimee_NP300=zeros(1,Nlines);

i=1;
while i<lines
  Classe_estimee_P300(1,i)=classe_estimee(ref_P300(i,1)); 
  i=i+1;
endwhile

j=1;
while j<Nlines
  Classe_estimee_NP300(1,j)=classe_estimee(ref_NP300(j,1));
  j=j+1;
endwhile
printf("yooooooooooooooooooooo\n");
disp(Classe_estimee_P300);
disp(Classe_estimee_NP300);


T_res_adequats=(540+sum(Classe_estimee_P300)-sum(Classe_estimee_NP300))/(135+540);
printf("le taux des resultats adequats est : " );
disp(T_res_adequats);