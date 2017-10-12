%Par Afaf Taik - Zakaria Belgoum

function classe= Class_Img(image,h_foret,h_plage,h_rue,P_1,P_2,P_3)


[P1, P2,P3] = freq_moyennes_histo(image,h_foret,h_plage,h_rue);

P1= P1*P_1;
P2=P2*P_2;
P3=P3*P_3;
m=[P1,P2,P3];

[val,classe]=max(m);

endfunction
