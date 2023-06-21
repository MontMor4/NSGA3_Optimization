%nbr de solution
N=10;
%fct obj pr chaque solution
fp=randi([1,5],[2,N]);
P=1:N;
k=1;
while (length(P) ~=0)
    Q=[]; %vecteur vide
    for i=1:length(P)% pr chak sol
        flag=0;% on sup que la sol p(i) non domin
        for j=1:length(P)% pr chak q
            if dominated(fp(:,P(j)),fp(:,P(i)))==1 % if sol p(j) domin p(i) 
                flag=1; %
                break;
            end
        end
        if flag==0
            Q=[Q P(i)];  % ajouter une sol
        end
       
    end
    P=setdiff(P,Q); % supp men p maojodine fi q 
    F(k)={Q}; % 
    k=k+1;%
end
    