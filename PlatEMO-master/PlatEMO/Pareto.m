clear all
format long
clc

definicaoVariaveis;

arquivo=['NSGAIII_' Problema '_M' num2str(M) '_D' num2str(D) '.mat'];    
load(arquivo);        

A1=Execucao;
clear Execucao;

arquivo=['NSGAIIIHIB_' Problema '_M' num2str(M) '_D' num2str(D) '.mat'];    
load(arquivo);

A2=Execucao;
clear Execucao;

Juntos=[];
for i=1:NE
  Juntos=[Juntos;A1{i}(:,size(A1{i},2)-M+1:size(A1{i},2));A2{i}(:,size(A2{i},2)-M+1:size(A2{i},2))];
end

[FrontNo,MaxFNo] = NDSort(Juntos,inf);
firstFront = find(FrontNo==1);    
Pareto_Combinado=Juntos(firstFront,:);

save('Juntos.mat','Pareto_Combinado');