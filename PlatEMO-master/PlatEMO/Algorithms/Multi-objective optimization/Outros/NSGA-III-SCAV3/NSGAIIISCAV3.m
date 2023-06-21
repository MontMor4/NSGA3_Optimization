classdef NSGAIIISCAV3 < ALGORITHM
% <multi/many> <real/integer/label/binary/permutation> <constrained/none>
% Nondominated sorting genetic algorithm III

%------------------------------- Reference --------------------------------
% K. Deb and H. Jain, An evolutionary many-objective optimization algorithm
% using reference-point based non-dominated sorting approach, part I:
% Solving problems with box constraints, IEEE Transactions on Evolutionary
% Computation, 2014, 18(4): 577-601.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2022 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            %% Generate the reference points and random population
            [Z,Problem.N] = UniformPoint(Problem.N,Problem.M);
            Population    = Problem.Initialization();
            Zmin          = min(Population(all(Population.cons<=0,2)).objs,[],1);

            %% Optimization
            while Algorithm.NotTerminated(Population)
                                
                PopObj   = Population.objs;
                FrontNo = inf(1,length(Population));
                [FrontNo,MaxFNo] = NDSort(PopObj,inf);
                firstFront = find(FrontNo==1);                    
                C_Iter=Algorithm.pro.FE/size(Population,2);
                M_Iter=Algorithm.pro.maxFE/size(Population,2);
                r1=2-C_Iter*2/M_Iter;
                                                
                for cp=1:size(PopObj,1)
                    Destination_position=Population(firstFront(randi(size(firstFront,2)))).dec;                    
                    Offspring_aux(cp)  = OperatorSCAV3(Problem,Population(cp),Population,Destination_position,r1,C_Iter,M_Iter);        
                end
                                
                %MatingPool = TournamentSelection(2,Problem.N,sum(max(0,Population.cons),2));
                %Offspring  = OperatorGA(Problem,Population(MatingPool));                
                Offspring  = Offspring_aux;
                Zmin       = min([Zmin;Offspring(all(Offspring.cons<=0,2)).objs],[],1);
                Population = EnvironmentalSelection([Population,Offspring],Problem.N,Z,Zmin);
            end
        end
    end
end