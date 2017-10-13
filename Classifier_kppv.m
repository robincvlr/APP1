%par zakaria
function C=Classifier_kppv(k,x)
ref_P300 = load("Donnees/ref_P300");
ref_P300=red_matrice(ref_NP300, 3);
ref_NP300 = load("Donnees/ref_NP300");
ref_NP300=red_matrice(ref_NP300, 3);
for kk=1:nl
  distance_p1(kk,:)=sqrt(x-(ref_P300(kk,:)^2));
      
endfor
for kk=1:nl2
    
  distance_np1(kk,:)=sqrt(x-(ref_NP300(kk,:)^2));  
endfor
distance_p1=sort(distance_p1);
distance_np1=sort(distance_np1);
if distance_p1(k,:)<distance_np1(k,:)
  C="P300";
elseif
  C="NP300";   
endif
