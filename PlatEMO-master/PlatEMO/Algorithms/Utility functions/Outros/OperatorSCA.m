function Offspring = OperatorSCA(Problem,Parent,Population,Destination_position,r1)

    if isa(Parent(1),'SOLUTION')
        evaluated = true;
        Parent    = Parent.decs;
    else
        evaluated = false;
    end
    
    ordem=randperm(size(Population,2));
    
    Parent1   = Parent(1,:);
    Parent1_aux   = Parent1;
    Parent2   = Population(ordem(1)).decs;
    Parent3   = Population(ordem(2)).decs;
    v=Destination_position+0.5*(Parent2-Parent3);            
    Offspring = zeros(1,size(Parent1,2));
    
    for j=1:size(Parent1,2) % in j-th dimension            
            % Update r2, r3, and r4 for Eq. (3.3)
            r2=(2*pi)*rand();
            r3=2*rand;
            r4=rand();
            
            % Eq. (3.3)
            if r4<0.5
                % Eq. (3.1)
                Parent1(1,j)= Parent1(1,j)+(r1*sin(r2)*abs(r3*Destination_position(j)-Parent1(1,j)));                
            else
                % Eq. (3.2)
                Parent1(1,j)= Parent1(1,j)+(r1*cos(r2)*abs(r3*Destination_position(j)-Parent1(1,j)));                
            end
                                                           
    end    
    
    jh=floor(size(Parent1,2)*rand())+1;
    if rand()<=0.5
        if (rand()<0.5) | (j==jh)
            Offspring(j)=v(j);                    
        else
            Offspring(j)=Parent1(1,j);
        end                
    else
         Offspring(j)=Parent1_aux(1,j);
    end    
    
	Offspring = min(max(Offspring,Problem.lower),Problem.upper);
    
    if evaluated
        Offspring = Problem.Evaluation(Offspring);
    end        
    
end

