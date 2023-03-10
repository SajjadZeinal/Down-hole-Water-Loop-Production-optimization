function [N_DI_SPACING,BLOCK_DI_SPACING_LENGTH]=DZ_DI(WATER_DRAINAGE_WELL_COMPLETION_int,Top_Water_Injection_Depth)

D_I_LENGTH = Top_Water_Injection_Depth - WATER_DRAINAGE_WELL_COMPLETION_int ;
if  D_I_LENGTH == 0 
   Top_Water_Injection_Depth=WATER_DRAINAGE_WELL_COMPLETION_int+1; 
   BLOCK_DI_SPACING_LENGTH=1;
   N_DI_SPACING=1;
elseif D_I_LENGTH <= 5 && D_I_LENGTH ~= 0
   BLOCK_DI_SPACING_LENGTH=D_I_LENGTH;
   N_DI_SPACING=1; 
else
    for ii = 1:99
        temp = 5*ii;
    if D_I_LENGTH <= temp+5 && D_I_LENGTH > temp
       BLOCK_DI_SPACING_LENGTH = D_I_LENGTH/(ii+1);
       N_DI_SPACING = ii+1; 
    end
    end
end
end
