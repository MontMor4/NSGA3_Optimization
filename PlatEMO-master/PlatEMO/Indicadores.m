clear all
clc
format short

definicaoVariaveis;

arquivo=['NSGAIII_' Problema '_M' num2str(M) '_D' num2str(D) '.mat'];    
load(arquivo);        

A1=Execucao;
clear Execucao;

arquivo=['NSGAIIIHIB_' Problema '_M' num2str(M) '_D' num2str(D) '.mat'];    
load(arquivo);

A2=Execucao;
clear Execucao;

load('Juntos.mat');

IGDp_A1=[];
for i = 1 : NE        
    IGDp_A1=[IGDp_A1;IGDp2(A1{i}(:,size(A1{i},2)-M+1:size(A1{i},2)),Pareto_Combinado)];    
end
Min_IGDp_A1=min(IGDp_A1)
Media_IGDp_A1=mean(IGDp_A1)
Max_IGDp_A1=max(IGDp_A1)
%DP_IGDp_A1=std(IGDp_A1)


IGDp_A2=[];
for i = 1 : NE        
    IGDp_A2=[IGDp_A2;IGDp2(A2{i}(:,size(A2{i},2)-M+1:size(A2{i},2)),Pareto_Combinado)];    
end
Min_IGDp_A2=min(IGDp_A2)
Media_IGDp_A2=mean(IGDp_A2)
Max_IGDp_A2=max(IGDp_A2)
%DP_IGDp_A2=std(IGDp_A2)

ranksum(IGDp_A1,IGDp_A2) % Wilcoxon
