%par zakaria
%2 dimensions
function C=Classifier_kppv2(x,y)
  ref_P300 = load("rotationP300.txt");

  ref_NP300 = load("rotationNP300.txt");

  [i,j] = size(ref_P300);
  nl = i ;
  [k2,l] = size(ref_NP300);
  nl2 = k2 ;
  for kk=1:nl
  distance_p1(kk,:)=sqrt((x-ref_P300(kk,1))^2+(y-ref_P300(kk,1))^2);  
      
  endfor
  for kk=1:nl2
    
  distance_np1(kk,:)=sqrt((x-ref_NP300(kk,1))^2+(y-ref_NP300(kk,1))^2);  
  endfor
  distance_p1=sort(distance_p1);
  distance_np1=sort(distance_np1);  
  if distance_p1(5,:)<distance_np1(5,:)
    C="P300";
  elseif
    C="NP300";   
  endif
endfunction

