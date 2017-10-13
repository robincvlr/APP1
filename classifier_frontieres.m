%par zakaria
%la fonction aui fait la classification avec l equation des frontieres en 1D
function c=classifier_frontieres(x,m_p300,cov1DP,m_np300,cov1DNP,Pr_NP300,Pr_P300) ;
  y = (((x-m_p300)^2/cov1DP)-((x-m_np300)^2/cov1DNP))/log((2*Pr_NP300*cov1DNP)/(3*Pr_P300*cov1DNP));
  if y>0 
    c=1;
  else
    c=2;
  end
endfunction 