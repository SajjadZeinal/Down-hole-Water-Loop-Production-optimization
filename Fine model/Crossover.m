function [ Crossed_Fitness ] = Crossover( Fitness )
Population_number = 6;
VariableNumber = 5;
Crossover_rate=[1,0.7,0.6,0.5,0.4,0.3];
    temp=1;
    Fitness_Crossed=Fitness;
    Cross_Assistant=Fitness_Crossed;
    Individual = Cross_Assistant(1,:);
    Individual2 = Cross_Assistant(1,:);
    Individual3 = Cross_Assistant(1,:);
    Individual4 = Cross_Assistant(1,:);
    Individual5 = Cross_Assistant(1,:);
for ii=1:Population_number
    random_Crossover(ii)=rand();
    if random_Crossover(ii) < Crossover_rate(ii)
        CrossoverChoromosome(temp) = ii;
        temp=temp+1;
    end
end
cross_count=Population_number;
if temp > 2
    if temp > 3
        temp = 4;
    end
    if temp == 3
       Crossover_Point = round((VariableNumber - 2)*rand()+1);
       Individual = [Fitness_Crossed(CrossoverChoromosome(1),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(2),Crossover_Point+1:VariableNumber)];
       Individual2 = [Fitness_Crossed(CrossoverChoromosome(2),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(1),Crossover_Point+1:VariableNumber)];
       if Individual(1,4) >= Individual(1,3) && Individual(1,5) >= Individual(1,4) && (Individual(1,4) +(Individual(1,4) - Individual(1,3))+(Individual(1,5)-Individual(1,4))) <= 15550
           Cross_Assistant(cross_count,:) = Individual;
           cross_count=cross_count-1;
       end
       if Individual2(1,4) >= Individual2(1,3) && Individual2(1,5) >= Individual2(1,4) && (Individual2(1,4) +(Individual2(1,4) - Individual2(1,3))+(Individual2(1,5)-Individual2(1,4))) <= 15550
           Cross_Assistant(cross_count,:) = Individual2;
           cross_count=cross_count-1;
       end
       elseif temp == 4
        for ii=1:2
       Crossover_Point = round((VariableNumber - 2)*rand()+1);
       Individual3 = [Fitness_Crossed(CrossoverChoromosome(ii),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(ii+1),Crossover_Point+1:VariableNumber)];
       Individual4 = [Fitness_Crossed(CrossoverChoromosome(ii+1),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(ii),Crossover_Point+1:VariableNumber)];
       if Individual3(1,4) >= Individual3(1,3) && Individual3(1,5) >= Individual3(1,4) && (Individual3(1,4) +(Individual3(1,4) - Individual3(1,3))+(Individual3(1,5)-Individual3(1,4))) <= 15550
           Cross_Assistant(cross_count,:) = Individual3;
           cross_count=cross_count-1;
       end
       if Individual4(1,4) >= Individual4(1,3) && Individual4(1,5) >= Individual4(1,4) && (Individual4(1,4) +(Individual4(1,4) - Individual4(1,3))+(Individual4(1,5)-Individual4(1,4))) <= 15550
           Cross_Assistant(cross_count,:) = Individual4;
           cross_count=cross_count-1;
       end
       if ii == 2
           Crossover_Point = round((VariableNumber - 2)*rand()+1);
       Individual5 = [Fitness_Crossed(CrossoverChoromosome(ii+1),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(1),Crossover_Point+1:VariableNumber)];
       if Individual5(1,4) >= Individual5(1,3) && Individual5(1,5) >= Individual5(1,4) && (Individual5(1,4) +(Individual5(1,4) - Individual5(1,3))+(Individual5(1,5)-Individual5(1,4))) <= 15550
           Cross_Assistant(cross_count,:) = Individual5;
           cross_count=cross_count-1;
       end
       end   
       end
    end
           
           
    clear CrossoverChoromosome;
end
Crossed_Fitness = Cross_Assistant;
end

