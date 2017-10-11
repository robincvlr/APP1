%Afaf Taik  
%classification basée sur le calcul des distance par rapport aux moyennes 
function ckk=kppv_kmoyenne(x)
  load all_data.txt;
  all_data=all_data';
  ckk=0;
  [m1,m2]=KMoyenne(all_data,12);
  printf("I got stuck here\n");
  printf("I couldnt reach here\n");
  Diff=Distance(x,m1)-Distance(x,m2);
  if Diff>0
    ckk=1;
  endif
endfunction