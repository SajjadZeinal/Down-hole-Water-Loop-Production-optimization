function [ BLOCK_WATER , N_WATER   ] = DZ_EDIT( x4 , x3 )
%DZ edit
% Distance between WOC and top water drainage Completion
 WATER_LENGTH = x4-x3; 
if WATER_LENGTH <=5  
    BLOCK_WATER=WATER_LENGTH;
    N_WATER=1;

elseif WATER_LENGTH <= 10 && WATER_LENGTH > 5
     BLOCK_WATER=WATER_LENGTH/2;
     N_WATER=2;

elseif WATER_LENGTH <= 15 && WATER_LENGTH > 10
     BLOCK_WATER=WATER_LENGTH/3;
     N_WATER=3;

elseif WATER_LENGTH <= 20 && WATER_LENGTH > 15
     BLOCK_WATER=WATER_LENGTH/4;
     N_WATER=4;
     
elseif WATER_LENGTH <= 25 && WATER_LENGTH > 20
     BLOCK_WATER=WATER_LENGTH/5;
     N_WATER=5;
     
     elseif WATER_LENGTH <= 30 && WATER_LENGTH > 25
     BLOCK_WATER=WATER_LENGTH/6;
     N_WATER=6;
     
     elseif WATER_LENGTH <= 35 && WATER_LENGTH > 30
     BLOCK_WATER=WATER_LENGTH/7;
     N_WATER=7;
     
     elseif WATER_LENGTH <= 40 && WATER_LENGTH > 35
     BLOCK_WATER=WATER_LENGTH/8;
     N_WATER=8;
     
     elseif WATER_LENGTH <= 45 && WATER_LENGTH > 40
     BLOCK_WATER=WATER_LENGTH/9;
     N_WATER=9;
     
     elseif WATER_LENGTH <= 50 && WATER_LENGTH > 45
     BLOCK_WATER=WATER_LENGTH/10;
     N_WATER=10;
     
     elseif WATER_LENGTH <= 55 && WATER_LENGTH > 50
     BLOCK_WATER=WATER_LENGTH/11;
     N_WATER=11;
     
     elseif WATER_LENGTH <= 60 && WATER_LENGTH > 55
     BLOCK_WATER=WATER_LENGTH/12;
     N_WATER=12;
     
     elseif WATER_LENGTH <= 65 && WATER_LENGTH > 60
     BLOCK_WATER=WATER_LENGTH/13;
     N_WATER=13;
     
     elseif WATER_LENGTH <= 70 && WATER_LENGTH > 65
     BLOCK_WATER=WATER_LENGTH/14;
     N_WATER=14;
     
     elseif WATER_LENGTH <= 75 && WATER_LENGTH > 70
     BLOCK_WATER=WATER_LENGTH/15;
     N_WATER=15;
     
     elseif WATER_LENGTH <= 80 && WATER_LENGTH > 75
     BLOCK_WATER=WATER_LENGTH/16;
     N_WATER=16;
     
     elseif WATER_LENGTH <= 85 && WATER_LENGTH > 80
     BLOCK_WATER=WATER_LENGTH/17;
     N_WATER=17;
     
     elseif WATER_LENGTH <= 90 && WATER_LENGTH > 85
     BLOCK_WATER=WATER_LENGTH/18;
     N_WATER=18;
     
     elseif WATER_LENGTH <= 95 && WATER_LENGTH > 90
     BLOCK_WATER=WATER_LENGTH/19;
     N_WATER=19;
     
     elseif WATER_LENGTH <= 100 && WATER_LENGTH > 95
     BLOCK_WATER=WATER_LENGTH/20;
     N_WATER=20;
     
     elseif WATER_LENGTH <= 105 && WATER_LENGTH > 100
     BLOCK_WATER=WATER_LENGTH/21;
     N_WATER=21;
     
     elseif WATER_LENGTH <= 110 && WATER_LENGTH > 105
     BLOCK_WATER=WATER_LENGTH/22;
     N_WATER=22;
     
     elseif WATER_LENGTH <= 115 && WATER_LENGTH > 110
     BLOCK_WATER=WATER_LENGTH/23;
     N_WATER=23;
     
     elseif WATER_LENGTH <= 120 && WATER_LENGTH > 115
     BLOCK_WATER=WATER_LENGTH/24;
     N_WATER=24;
     
     elseif WATER_LENGTH <= 125 && WATER_LENGTH > 120
     BLOCK_WATER=WATER_LENGTH/25;
     N_WATER=25;
     
     elseif WATER_LENGTH <= 130 && WATER_LENGTH > 125
     BLOCK_WATER=WATER_LENGTH/26;
     N_WATER=26;
     
     elseif WATER_LENGTH <= 135 && WATER_LENGTH > 130
     BLOCK_WATER=WATER_LENGTH/27;
     N_WATER=27;
     
     elseif WATER_LENGTH <= 140 && WATER_LENGTH > 135
     BLOCK_WATER=WATER_LENGTH/28;
     N_WATER=28;
     
     elseif WATER_LENGTH <= 145 && WATER_LENGTH > 140
     BLOCK_WATER=WATER_LENGTH/29;
     N_WATER=29;
     
     
end

end

