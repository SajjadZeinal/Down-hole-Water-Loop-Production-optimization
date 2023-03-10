global attempt attempt2 NPV_MATRIX  
VariableNumber=5;
Population_number=6;
WATER_LIQUID_rate_Bound=[100,3800];
OIL_WELL_COMPLETION_Bound=[15000,15050];
DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound=[15050,15547];
WATER_DRAINAGE_WELL_COMPLETION_Bound=[15050,15548];
D_I_SPACING_Bound=[15051,15549];
Fitness=zeros(Population_number,VariableNumber+1);
Probability=zeros(Population_number,1);
Obj_cumulative_Probability=zeros(Population_number,1);
random_selection=zeros(Population_number,1);
NewChoromosome=zeros(Population_number,VariableNumber+1);
random_Crossover=zeros(Population_number,1);
%Initialization
attempt=1;
attempt2=1;
%Initial_Population= [2200	            15020	         15050	        15100           15150
%                     1000	            15046.21428	    15111.13367 	15223.45493     15400
%                     2500	            15025.83524   	15064.89962	    15167.78268     15180
%                     500	            15048.1834	    15053.49986     15197.19503     15300
%                     657.6656858	    15019.23805	    15053.49986     15167.78268     15350
%                     2294.816737	    15010.465	    15116.0632	    15223.45493     15420
%];

Initial_Population= [3800           15004.91651	15056.65906	15066.52334	15527.25964
                     3800	        15029.64847	15056.65906	15066.52334	15527.25964
                     3800	        15038.52472	15056.65906	15066.52334	15068.59877
                     2347.936107	15004.91651	15056.65906	15066.52334	15527.25964
                     1636.892884	15004.91651	15056.65906	15066.52334	15527.25964
                     293.8896278	15004.91651	15056.65906	15066.52334	15527.25964
];


for ii =1:Population_number
Fitness(ii,1)=Initial_Population(ii,1);
Fitness(ii,2)=Initial_Population(ii,2);
Fitness(ii,3)=Initial_Population(ii,3);
Fitness(ii,4)=Initial_Population(ii,4);
Fitness(ii,5)=Initial_Population(ii,5);
x=[Initial_Population(ii,1) , Initial_Population(ii,2) , Initial_Population(ii,3) , Initial_Population(ii,4) , Initial_Population(ii,5)   ];
Fitness(ii,6)=NPV_4_var(x);
end
Best_Fitness(attempt,1)=max(Fitness(:,6));
Ave_Fitness(attempt,1)=mean(Fitness(:,6));
generation(Population_number*(attempt-1)+1:Population_number*attempt,:)=Fitness;
plot(attempt,Best_Fitness(attempt,1),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness(attempt,1),'k.','markersize',5);
hold on;
title('NPV_Optimization (LRATW,LRATO)');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');
attempt=attempt+1;
% Stopping Criteria
max_iteration = 60;
Tol_Fitness=100;
while 1
    % Sorting
sorted_NPV=sort(Fitness(:,6),'descend');
for ii = 1:Population_number
    for jj = 1:Population_number
    if sorted_NPV(ii) == Fitness(jj,6)
        sorted_Fitness(ii,:) = Fitness(jj,:); 
    end
    end
end
Fitness=sorted_Fitness;
Fitness(Population_number,:)=Fitness(1,:);
    
% Selection (Roulette Wheel)
total=sum(Fitness(1:Population_number,6));
cumulative_Probability=0;
for ii=1:Population_number
   Probability(ii)=Fitness(ii,6)/total;
   cumulative_Probability=cumulative_Probability+Probability(ii);
   Obj_cumulative_Probability(ii)=cumulative_Probability;
   random_selection(ii)=rand();
end
random_selection(1)=-1;
for ii=1:Population_number
    for jj=1:Population_number-1
    if random_selection(ii) > Obj_cumulative_Probability(jj) && random_selection(ii) <= Obj_cumulative_Probability(jj+1)
        NewChoromosome(ii,:) = Fitness(jj+1,1:VariableNumber+1);
    elseif random_selection(ii) < Obj_cumulative_Probability(1)
         NewChoromosome(ii,:) = Fitness(1,1:VariableNumber+1);
    end
    end
end
Fitness=NewChoromosome;

    % Sorting Selected
sorted_NPV=sort(Fitness(:,6),'descend');
for ii = 1:Population_number
    for jj = 1:Population_number
    if sorted_NPV(ii) == Fitness(jj,6)
        sorted_Fitness(ii,:) = Fitness(jj,:); 
    end
    end
end
Fitness=sorted_Fitness(:,1:VariableNumber);


% Cross Over

Fitness = Crossover(Fitness);


% Mutation

Fitness = Mutation( Fitness );

Eval_Fitness=Fitness;
for ii = 1:Population_number
    x=[Eval_Fitness(ii,1),Eval_Fitness(ii,2),Eval_Fitness(ii,3),Eval_Fitness(ii,4) , Eval_Fitness(ii,5)];
    Eval_Fitness(ii,6) = NPV_4_var(x); 
end
Fitness=Eval_Fitness;
generation(Population_number*(attempt-1)+1:Population_number*attempt,:)=Eval_Fitness;
Best_Fitness(attempt,1)=max(Fitness(:,6));
Ave_Fitness(attempt,1)=mean(Fitness(:,6));
plot(attempt,Best_Fitness(attempt,1),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness(attempt,1),'k.','markersize',5);
hold on;
title('NPV_Optimization (LRATW,LRATO)');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');
if attempt == 50
       stop_criteria = Best_Fitness(attempt,1);
end
    if attempt == max_iteration
    tolerance = abs(stop_criteria - Best_Fitness(length(Best_Fitness)-10:length(Best_Fitness)));
    Tol_Fitness=sum(tolerance);
    if Tol_Fitness < 1E-3
        break;
    else
        max_iteration=max_iteration+5;
        stop_criteria=Best_Fitness(max_iteration-5,1);
    end
    end
attempt=attempt+1;
fclose all;
end