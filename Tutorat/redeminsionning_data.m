ref_P300 = load("Donnees/test_P300");
ref_NP300 = load("Donnees/test_NP300"); 

ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];

fid=fopen("test_P300.txt","w");
fprintf(fid, '%f\t',ref_P300);
fclose(fid);


fid=fopen("test_NP300.txt","w");
fprintf(fid, '%f\t',ref_NP300);
fclose(fid);