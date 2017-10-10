%Par Robin Cavalieri
%Probabilité à postériori 
function ypp = proba_post (x, cov_P300, moy_P300);
ypp = log(4*sqrt(cov_P300))+1/2*((x-moy_P300)*inv(cov_P300)*(x-moy_P300));
endfunction