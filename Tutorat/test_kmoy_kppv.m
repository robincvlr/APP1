%Afaf Taik
%test de la classification basée sur le plus proche barycentre ( kmoyenne )  
t_P300=load("test_P300.txt");
t_NP300=load("test_NP300.txt");

t_P300=t_P300';
t_NP300=t_NP300';


Class1=zeros(size(t_P300),1);
Class2=zeros(size(t_NP300),1);

for i=1:size(t_P300)
  Class1(i)=kppv_kmoyenne(t_P300(i));
endfor
printf("everything ok 1 \n");
disp(Class1);
printf("everything ok 2\n");
for i=1:size(t_NP300)
  Class2(i)=kppv_kmoyenne(t_NP300(i));
endfor
disp(Class2);

T_classification=(sum(Class1)+size(Class2)-sum(Class2))/(size(Class1)+size(Class2));
printf("taux de classification = ");
disp(T_classification);

