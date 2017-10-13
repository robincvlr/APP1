%par zakaria
%la fonction aui fait la classification avec l equation des frontieres en 1D
function c=classifier_frontieres2(x,y,m_p300,covariance_p300,covariance_np300,m_np300,Pr_NP300,Pr_P300) 
  covariance_p300=inv(covariance_p300);
  covariance_np300=inv(covariance_np300);
  a=covariance_p300(1,1);
  b=covariance_p300(2,2);
  a1=covariance_np300(1,1);
  b1=covariance_np300(2,2);
  m1=m_p300(1,1);
  m2=m_p300(2,1);
  m11=m_np300(1,1);
  m22=m_p300(2,1);
  d1=det(covariance_p300);
  d2=det(covariance_np300);
  
  z=(a*(x-m1)^2+b*(y-m2)^2-a1*(x-m11)^2-b1*(y-m22)^2)/log((3*sqrt(d1)*Pr_NP300)/(sqrt(d1)*Pr_P300));
  if z<0 
    c=1;
  else
    c=2;
  end
endfunction 