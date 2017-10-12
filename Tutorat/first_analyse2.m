%par zakaria belgoum
ref_P300 = load("Donnees/ref_P300");
ref_NP300 = load("Donnees/ref_NP300");
all_data=[ref_P300;ref_NP300];
%disp(all_data);
covariance=cov(all_data);
%disp(covariance);
[vecteurs_pro_all_data, valeurs_pro_all_data] = eig(covariance);
disp(valeurs_pro_all_data);
%reduction en 2D
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
plot(ref_P300(:,1),ref_P300(:,2),'+',ref_NP300(:,1),ref_NP300(:,2),'*');
figure;
all_data=[ref_P300;ref_NP300];
covariance2=cov(all_data);
[vecteurs_pro_all_data2, valeurs_pro_all_data2] = eig(covariance2);
correlation=corr(all_data);
disp(correlation);
%changement de referenciel
all_data=all_data*vecteurs_pro_all_data2;
%disp(all_data);
correlation2=corr(all_data);
disp(correlation2);
disp(valeurs_pro_all_data2);
%plot 
ref_P300=ref_P300*vecteurs_pro_all_data2;
ref_NP300=ref_NP300*vecteurs_pro_all_data2;
fid=fopen('rotationP300.txt','w');
fprintf(fid, '%f\t %f\n',ref_P300);
fclose(fid);
fid=fopen('rotationNP300.txt','w');
fprintf(fid, '%f\t %f\n',ref_NP300);
fclose(fid);
plot(ref_P300(:,1),ref_P300(:,2),'+',ref_NP300(:,1),ref_NP300(:,2),'*');
title("representation des vecteurs dans le nouveau referenciel 2D");
%classifier gaussien sans frontieres
%calcul de la moyenne
m_p300 = mean(ref_P300)';

m_np300 = mean(ref_NP300)';

%calcul des proba des classes :
[i,j] = size(ref_P300);
nl = i ;
[k,l] = size(ref_NP300);
nl1 = k ;
s=nl+nl1;
Pr_P300=nl./s;
Pr_NP300=nl1./s;
%calcul des covariance en nouveau referentiel
covariance_p300=cov(ref_P300);
covariance_np300=cov(ref_NP300);
%faire le test
c=classifier_frontieres2(1,1,m_p300,covariance_p300,covariance_np300,m_np300,Pr_NP300,Pr_P300);
disp(c);



