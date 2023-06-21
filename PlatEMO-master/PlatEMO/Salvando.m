clear all
format long
clc

definicaoVariaveis;

cd Data
cd NSGAIII
for r = 1 : NE    
	arquivo=['NSGAIII_' Problema '_M' num2str(M) '_D' num2str(D) '_' num2str(r) '.mat'];    
    load(arquivo);        
    Execucao{r}=[];
    for i=1:size(result{2},2)
        Execucao{r}=[Execucao{r};result{2}(i).dec result{2}(i).obj];          
    end         
end
cd ..
cd ..
nome=['NSGAIII_' Problema '_M' num2str(M) '_D' num2str(D) '.mat'];
save(nome,'Execucao');


cd Data
cd NSGAIIIHIB
for r = 1 : NE    
    arquivo=['NSGAIIIHIB_' Problema '_M' num2str(M) '_D' num2str(D) '_' num2str(r) '.mat'];    	
    load(arquivo);        
    Execucao{r}=[];
    for i=1:size(result{2},2)
        Execucao{r}=[Execucao{r};result{2}(i).dec result{2}(i).obj];          
    end         
end
cd ..
cd ..
nome=['NSGAIIIHIB_' Problema '_M' num2str(M) '_D' num2str(D) '.mat'];
save(nome,'Execucao');


