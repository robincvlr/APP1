%Afaf Taik
function c=classe_estimee(x)
  load Histo_X_P300.txt;
  load Histo_X_NP300.txt;
  load Edges.txt;
  c=0;
  %Probabilites a priori
  P_CP300=135/(540+135);
  P_CNP300=540/(540+135);
  N_appr_CP300=sum(Histo_X_P300);
  N_appr_CNP300=sum(Histo_X_NP300);

  %Calcul des risques
  r1=Risk(3,Vraissemblance(x,Histo_X_NP300,Edges)/N_appr_CNP300,P_CNP300);
  r2=Risk(1,Vraissemblance(x,Histo_X_P300,Edges)/N_appr_CP300,P_CP300);
  if r1<r2
    c=1;
  endif
endfunction