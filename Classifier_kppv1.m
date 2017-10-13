%par zakaria 
%pour k=5
function C=Classifier_kppv(x)
  ref_P300 = load("Donnees/ref_P300");
  ref_P300=red_matrice(ref_P300, 3);
  ref_NP300 = load("Donnees/ref_NP300");
  ref_NP300=red_matrice(ref_NP300, 3);
  [i,j] = size(ref_P300);
  nl = i ;
  [k2,l] = size(ref_NP300);
  nl2 = k2 ;
  for kk=1:nl
    distance_p1(kk,:)=abs(x-ref_P300(kk,:));
      
  endfor
  for kk=1:nl2
    
    distance_np1(kk,:)=abs(x-ref_NP300(kk,:));  
  endfor
  distance_p1=sort(distance_p1);
  distance_np1=sort(distance_np1);  
  if distance_p1(5,:)<distance_np1(5,:)
    C="P300";
  elseif
    C="NP300";   
  endif
endfunction
