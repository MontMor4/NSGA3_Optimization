clear all
format long
clc

definicaoVariaveis;

for r = 1 : NE
	platemo('algorithm',@NSGAIII,'problem',problemaMO,'D',D,'M',M,'N',N,'maxFE',maxFE,'save',1);    
    platemo('algorithm',@NSGAIIIHIB,'problem',problemaMO,'D',D,'M',M,'N',N,'maxFE',maxFE,'save',1);
end

% antigo
% for r = 1 : 20
% 	platemo('algorithm',@NSGAIII,'problem',@DTLZ1,'D',9,'M',5,'N',212,'maxFE',80000,'save',1);    
%     platemo('algorithm',@NSGAIIIHIB,'problem',@DTLZ1,'D',9,'M',5,'N',212,'maxFE',80000,'save',1);
% end

% for r = 1 : 20
% 	platemo('algorithm',@NSGAIII,'problem',@DTLZ1,'D',12,'M',8,'N',156,'maxFE',80000,'save',1);    
%     platemo('algorithm',@NSGAIIIHIB,'problem',@DTLZ1,'D',12,'M',8,'N',156,'maxFE',80000,'save',1);
% end