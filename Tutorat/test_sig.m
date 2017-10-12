%Par Robin Cavalieri
%fonction de test des données avec 20 % de la base de données 
%Travail sur les P300 et NP300
function [compteurP300, compteurNP300, total_test] = test_sig(Nlines_app, lines_app, cov_NP300, moy_NP300, p_P300, cov_P300, moy_P300, p_NP300)
%POUR P300 Testes
compteurP300 = 0;
ref_P300 = load("Donnees/ref_P300");
[lines2, columns2] = size(ref_P300);
for i=1:lines2
  p1 = proba_post(1,ref_P300(i,1),cov_P300,moy_P300,p_P300);
  p2 = proba_post(3,ref_P300(i,1),cov_NP300,moy_NP300,p_NP300);
  temp = decision_gauss(p1,p2);
  if(temp==1)
    compteurP300 = compteurP300 + 1;
  endif
endfor
%POUR NP300 Testes
compteurNP300 = 0;
ref_NP300 = load("Donnees/ref_NP300");
[Nlines2, columns2] = size(ref_NP300);
for i=1:Nlines2
  p1 = proba_post(1,ref_NP300(i,1),cov_NP300,moy_NP300,p_P300);
  p2 = proba_post(3,ref_NP300(i,1),cov_P300,moy_P300,p_NP300);
  temp = decision_gauss(p1,p2);
  if(temp==1)
    compteurNP300 = compteurNP300 + 1;
  endif
endfor
total_test = lines2+Nlines2
endfunction