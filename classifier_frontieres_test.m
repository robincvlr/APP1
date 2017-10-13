%par zakaria
%on va envisager une réduction a une seule dimension 
%reduction a une seule dimension
ref_P300 = load("Donnees/ref_P300");
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_NP300 = load("Donnees/ref_P300");
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
%calcul de la covariance
cov1DP=cov(ref_P300);
printf("\ COVARIANCE des données P300 en 1D : \n");
disp(cov1DP);
cov1DNP=cov(ref_NP300);
printf("\ COVARIANCE des données P300 en 1D : \n");
disp(cov1DNP);
%calcul de la moyenne
m_p300 = mean(ref_P300);
printf("\ moyenne des données P300 en 1D : %f\n",m_p300);
m_np300 = mean(ref_NP300);
printf("\ moyenne des données NP300 en 1D : %f\n",m_np300);
%calcul des proba des classes :
[i,j] = size(ref_P300);
nl = i ;
[k,l] = size(ref_NP300);
nl1 = k ;
s=nl+nl1;
Pr_P300=nl./s;
Pr_NP300=nl1./s;
%tester le classifier
c=classifier_frontieres(-3.8377035e-01,m_p300,cov1DP,m_np300,cov1DNP,Pr_NP300,Pr_P300);
disp(c);
