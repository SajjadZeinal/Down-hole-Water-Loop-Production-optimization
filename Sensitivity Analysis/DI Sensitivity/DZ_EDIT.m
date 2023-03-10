function [ BLOCK_WOC_DIS , N_WOC_DIS  ] = DZ_EDIT( x4 , x3 )
%DZ edit
% Distance between WOC and top water drainage Completion
 WOC_DIS = x4-x3;
if  WOC_DIS == 0  
   BLOCK_WOC_DIS=0;
   N_WOC_DIS=0; 
elseif WOC_DIS <=20  && WOC_DIS ~= 0
    BLOCK_WOC_DIS=WOC_DIS/4;
    N_WOC_DIS=4;

elseif WOC_DIS <= 40 && WOC_DIS > 20
     BLOCK_WOC_DIS=WOC_DIS/8;
     N_WOC_DIS=8;

elseif WOC_DIS <= 60 && WOC_DIS > 40
    BLOCK_WOC_DIS=WOC_DIS/12;
    N_WOC_DIS=12;

elseif WOC_DIS <= 80 && WOC_DIS > 60 
    BLOCK_WOC_DIS=WOC_DIS/16;
    N_WOC_DIS=16;

elseif WOC_DIS <= 100 && WOC_DIS > 80
    BLOCK_WOC_DIS=WOC_DIS/20;
    N_WOC_DIS=20;

elseif WOC_DIS <= 120 && WOC_DIS > 100
    BLOCK_WOC_DIS=WOC_DIS/24;
    N_WOC_DIS=24;
    
elseif WOC_DIS <= 140 && WOC_DIS > 120
    BLOCK_WOC_DIS=WOC_DIS/28;
    N_WOC_DIS=28;

elseif WOC_DIS <= 160 && WOC_DIS > 140
    BLOCK_WOC_DIS=WOC_DIS/32;
    N_WOC_DIS=32;
    
elseif WOC_DIS <= 180 && WOC_DIS > 160
    BLOCK_WOC_DIS=WOC_DIS/36;
    N_WOC_DIS=36;
    
elseif WOC_DIS <= 200 && WOC_DIS > 180
    BLOCK_WOC_DIS=WOC_DIS/40;
    N_WOC_DIS=40;
    
elseif WOC_DIS <= 220 && WOC_DIS > 200
    BLOCK_WOC_DIS=WOC_DIS/44;
    N_WOC_DIS=44;
    
elseif WOC_DIS <= 240 && WOC_DIS > 220
    BLOCK_WOC_DIS=WOC_DIS/48;
    N_WOC_DIS=48;    
    
elseif WOC_DIS <= 260 && WOC_DIS > 240
    BLOCK_WOC_DIS=WOC_DIS/52;
    N_WOC_DIS=52;    

elseif WOC_DIS <= 280 && WOC_DIS > 260
    BLOCK_WOC_DIS=WOC_DIS/56;
    N_WOC_DIS=56;    
    
end

end

