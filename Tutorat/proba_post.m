%Par Robin Cavalieri
%Probabilité à postériori pour une dimension
function ypp = proba_post (x, cov, moy, p, cout);
ypp = cout*(1/((2*pi)^(1/2)*sqrt(det(cov)))*exp(-1/2*transpose(x-moy)*inv(cov)*(x-moy)));
endfunction