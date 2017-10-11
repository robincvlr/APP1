%travvailler avec la 4eme dimension sur tous les vecteurs d'apprentissage et de test
ref_P300 = load("Donnees/ref_P300");
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_NP300 = load("Donnees/ref_NP300");
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
test_P300 = load("Donnees/test_P300");
test_P300(:,1) = [];
test_P300(:,1) = [];
test_P300(:,1) = [];
test_NP300 = load("Donnees/test_NP300");
test_NP300(:,1) = [];
test_NP300(:,1) = [];
test_NP300(:,1) = [];
%concatenation de test_NP300 et test_P300
test=[test_P300;test_NP300];

%calcul de la distance euclidienne de chaque vecteur de test avec les vecteurs d'apprentissage
%a savoir ref_P300 et ref_NP300

%calcul par test_P300 rapport a ref_P300
[i,j] = size(ref_P300);
nl = i ;
[i1,j1] = size(test_P300);
nl1 = i1 ;
fid = fopen('distance1.txt','w');
for k=1:nl
  for k1=1:nl1
    distance1(k1,:)=sqrt((test_P300(k1,:)^2)-(ref_P300(k,:)^2));
    fprintf(fid,'%f\n',distance1(k1,:));
    
  endfor
endfor  
fclose(fid)
%calcul par test_NP300 rapport a ref_P300
[i11,j1] = size(test_NP300);
nl11 = i11 ;
fid = fopen('distance11.txt','w');
for k=1:nl
  for k1=1:nl11
    distance11(k1,:)=sqrt((test_NP300(k1,:)^2)-(ref_P300(k,:)^2));
    fprintf(fid,'%f\n',distance11(k1,:));
    
  endfor
endfor  
fclose(fid)


%calcul par rapport a ref_NP300
[k2,l] = size(ref_NP300);
nl2 = k2 ;
fid = fopen('les_distances_euclidienne_%_np300.txt','w');
for k2=1:nl2
  for k22=1:nl1
    distance2(k22,:)=sqrt((test(k22,:)^2)-(ref_NP300(k2,:)^2));
    fprintf(fid,'%f\n',distance2(k22,:));
  endfor
endfor  
fclose(fid)

%faire la classification K-PPV 

%avoir les distances test_p300 par rapport a ref_P300






















