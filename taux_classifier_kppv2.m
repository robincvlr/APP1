%par zakaria
%je fais different k de 1 jusqua 5 pour deux dimensions
ref_P300 = load("rotationP300.txt");
ref_NP300 = load("rotationNP300.txt");
test_P300 = load("rotationP300_test.txt");
test_NP300 = load("rotationNP300_test.txt");
test=[test_P300;test_NP300];
[t,tt] = size(test);
Ntest = t ;
[i,j] = size(ref_P300);
nl = i ;
[i1,j1] = size(test_P300);
nl1 = i1 ;
[i11,j1] = size(test_NP300);
nl11 = i11 ;
[k2,l] = size(ref_NP300);
nl2 = k2 ;
kk=1
while kk<=5
%calcul des vecteurs reconnus pour test_P300
Nreconnu1=0;
for k=1:nl1
  for k22=1:nl
    distance_p1(k22,:)=sqrt((test_P300(k,1)-ref_P300(k22,1))^2+(test_P300(k,2)-ref_P300(k22,2))^2);
      
  endfor
  for k222=1:nl
    
    distance_np1(k22,:)=sqrt((test_P300(k,1)-ref_NP300(k22,1))^2+(test_P300(k,2)-ref_NP300(k22,2))^2); 
  endfor
  distance_p1=sort(distance_p1);
  distance_np1=sort(distance_np1);
  if distance_p1(kk,:)<distance_np1(kk,:)
    Nreconnu1=Nreconnu1+1;
  endif
 
endfor

%calcul des vecteurs reconnus pour test_NP300


Nreconnu2=0;
for k=1:nl11
  for k22=1:nl
    distance_p2(k22,:)=sqrt((test_NP300(k,1)-ref_P300(k22,1))^2+(test_NP300(k,2)-ref_P300(k22,2))^2); 
      
  endfor
  for k222=1:nl
    
    distance_np2(k222,:)=sqrt((test_NP300(k,1)-ref_NP300(k22,1))^2+(test_NP300(k,2)-ref_NP300(k22,2))^2);  
  endfor
  distance_p2=sort(distance_p2);
  distance_np2=sort(distance_np2);
  if distance_np2(kk,:)<distance_p2(kk,:)
    Nreconnu2=Nreconnu2+1;
  endif
  
  
endfor 

Nreconnu=Nreconnu1+Nreconnu2;
taux=(Nreconnu*100)/Ntest;
printf("le taux est %f pour un k = %d \n", taux, kk);
kk=kk+1;

endwhile