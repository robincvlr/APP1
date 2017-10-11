%Afaf Taik
%k nombre de barycentres à choisir
%Vecteur : totalité des données 
function init=initialisation(k,vecteur)
  n=size(vecteur);
  r=randperm(n,k);
  init=zeros(k,1);
  for i=1:k
    init(i)=vecteur(r(i));
  endfor
  
endfunction 