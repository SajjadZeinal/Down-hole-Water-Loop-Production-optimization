function [ Crossed_Fitness ] = Crossover( Fitness )
% Crossover Function
Population_number = 3;
VariableNumber = 5;
Crossover_rate=[1,0.7,0.6];
    temp=1;
    Fitness_Crossed=Fitness(:,2:5);
    Cross_Assistant=Fitness;
    Individual = Fitness_Crossed(1,:);
    Individual2 = Fitness_Crossed(1,:);
for ii=1:Population_number
    random_Crossover(ii)=rand();
    if random_Crossover(ii) < Crossover_rate(ii)
        CrossoverChoromosome(temp) = ii;
        temp=temp+1;
    end
end
cross_count=Population_number;
        if temp > 3
        temp = 3;
        end
    if temp == 3
       Crossover_Point = round((VariableNumber - 3)*rand()+1);
       Individual = [Fitness_Crossed(CrossoverChoromosome(1),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(2),Crossover_Point+1:VariableNumber-1)];
       Individual2 = [Fitness_Crossed(CrossoverChoromosome(2),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(1),Crossover_Point+1:VariableNumber-1)];
       if Individual(1,3) >= Individual(1,2) && Individual(1,4) >= Individual(1,3) && (Individual(1,3) +(Individual(1,3) - Individual(1,2))+ Individual(1,4) - Individual(1,3)) <= 15550
           Cross_Assistant(cross_count,2:5) = Individual;
           cross_count=cross_count-1;
       end
       if Individual2(1,3) >= Individual2(1,2) && Individual2(1,4) >= Individual2(1,3) && (Individual2(1,3) +(Individual2(1,3) - Individual2(1,2))+ Individual2(1,4) - Individual2(1,3)) <= 15550
           Cross_Assistant(cross_count,2:5) = Individual2;
           cross_count=cross_count-1;
       end
    end
           
           
    clear CrossoverChoromosome;
     
    
    
%{    
    if temp > 3
        temp = 4;
    end
for ii=1:length(CrossoverChoromosome)-1
       Crossover_Point = round((VariableNumber - 3)*rand()+1);
       Individual = [Fitness_Crossed(CrossoverChoromosome(ii),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(ii+1),Crossover_Point+1:VariableNumber-1)];
       if Individual(1,3) >= Individual(1,2) && (Individual(1,3) +(Individual(1,3) - Individual(1,2))+200) <= 15550
           Cross_Assistant(cross_count,2:4) = Individual;
           cross_count=cross_count-1;
       end
end
    clear CrossoverChoromosome;
end
%}
Crossed_Fitness = Cross_Assistant;
end

