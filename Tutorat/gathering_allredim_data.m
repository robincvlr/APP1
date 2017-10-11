load ref_P300.txt;
load ref_NP300.txt;

ref_P300=ref_P300';
ref_NP300=ref_NP300';

all_data=[ ref_P300;ref_NP300];


disp(all_data);

fid=fopen("all_data.txt","w");
fprintf(fid, '%f\t',all_data);
fclose(fid);

