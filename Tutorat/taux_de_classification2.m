%par zakaria
ref_P300 = load("rotationP300.txt");

ref_NP300 = load("rotationNP300.txt");

all_data=[ref_P300;ref_NP300];


[i,j] = size(ref_P300);
nl = i ;
[k,l] = size(ref_NP300);
nl1 = k ;
covariance_p300=cov(ref_P300);
covariance_np300=cov(ref_NP300);
m_p300 = mean(ref_P300)';
m_np300 = mean(ref_NP300)';
N_test_p300=nl-round((nl*80)/100) ;
N_test_np300=nl1-round((nl1*80)/100) ;
s=nl+nl1;
Pr_P300=nl/s;
Pr_NP300=nl1/s;
N_reconnus_np300=0;
N_reconnus_p300=0;
m=round((nl*80)/100)+1;
l=round((nl1*80)/100)+1 ;
while m <= nl
  x=ref_P300(m,1);
  y=ref_P300(m,2);
  c=classifier_frontieres2(x,y,m_p300,covariance_p300,covariance_np300,m_np300,Pr_NP300,Pr_P300);
  m=m+1;
  if c==1
    N_reconnus_p300=N_reconnus_p300+1;
  endif
endwhile  
while l <= nl1
  x=ref_NP300(l,1);
  x=ref_NP300(l,2);
  c=classifier_frontieres2(x,y,m_p300,covariance_p300,covariance_np300,m_np300,Pr_NP300,Pr_P300);
  l=l+1;
  if c==2
    N_reconnus_np300=N_reconnus_np300+1;
  endif
endwhile
N_reconnus=N_reconnus_p300+N_reconnus_np300 ;
N_test=N_test_p300+N_test_np300;
R=(N_reconnus*100)/N_test ;
printf("le taux de classification est: %f", R);