function [ Muted_Fitness ] = Mutation( Fitness )
% Mutation
WATER_LIQUID_rate_Bound=[100,3800];
OIL_WELL_COMPLETION_Bound=[15000,15050];
DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound=[15050,15547];
WATER_DRAINAGE_WELL_COMPLETION_Bound=[15050,15548];
D_I_SPACING_Bound=[15051,15549];
VariableNumber = 5;
Population_number = 3;
Gen_Numbers=(Population_number-1)*(VariableNumber-1);
Mutationrate=0.4;
count=1;
Mutationrandom=zeros(1,(Population_number-1)*(VariableNumber-1));
for ii = 1:(Population_number-1)*(VariableNumber-1)
    Mutationrandom(ii) = rand();
    if Mutationrandom(ii) < Mutationrate 
        Muted_Choromosome(count) = ii;
        count = count + 1;
    end
end
    Fitness_Muted=Fitness(2:Population_number,2:5)';
for ii=1:count-1
    Variable_Selection = rem(Muted_Choromosome(ii),4);
    %if Variable_Selection == 1
     %   Fitness_Muted(Muted_Choromosome(ii)) = (WATER_LIQUID_rate_Bound(2)-WATER_LIQUID_rate_Bound(1))*rand()+WATER_LIQUID_rate_Bound(1);
    if Variable_Selection == 1
        Fitness_Muted(Muted_Choromosome(ii)) = (OIL_WELL_COMPLETION_Bound(2)-OIL_WELL_COMPLETION_Bound(1))*rand()+OIL_WELL_COMPLETION_Bound(1);
    elseif Variable_Selection == 2
        Fitness_Muted(Muted_Choromosome(ii)) = (DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound(2)-DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound(1))*rand()+DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound(1);
    elseif Variable_Selection == 3
        Fitness_Muted(Muted_Choromosome(ii)) = (WATER_DRAINAGE_WELL_COMPLETION_Bound(2)-WATER_DRAINAGE_WELL_COMPLETION_Bound(1))*rand()+WATER_DRAINAGE_WELL_COMPLETION_Bound(1);
    elseif Variable_Selection == 0
        Fitness_Muted(Muted_Choromosome(ii)) = (D_I_SPACING_Bound(2)-D_I_SPACING_Bound(1))*rand()+D_I_SPACING_Bound(1);
    end
end
Fitness_Muted_2 = Fitness_Muted';
Muted_Fit=Fitness(2:Population_number,2:5);
for ii = 1:Population_number-1
    if Fitness_Muted_2(ii,3) >= Fitness_Muted_2(ii,2) && Fitness_Muted_2(ii,4) >= Fitness_Muted_2(ii,3) && (Fitness_Muted_2(ii,3) +(Fitness_Muted_2(ii,3) - Fitness_Muted_2(ii,2))+ Fitness_Muted_2(ii,4) - Fitness_Muted_2(ii,3)) <= 15550 
       Muted_Fit(ii,:) = Fitness_Muted_2(ii,:);
    else
       Muted_Fit(ii,1) = Fitness_Muted_2(ii,1);
    end
end
Fitness(2:Population_number,2:5) = Muted_Fit; 
Muted_Fitness = Fitness; 
clear Fitness_Muted Muted_Choromosome

end

