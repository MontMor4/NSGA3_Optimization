% Inicialização
clc
%A = -3 + 6*rand(5,2)

% P = [
%     -1.3438 -0.0098 %x1
%     1.0782 2.7585   %x2
%     0.9306 -0.9577  %x3
%     -2.0243 0.5116  %x4
%     -2.2860 -1.6571 %x5
%     ]
% 
% % Gerando filhos por evolução diferencial ED (DE)
% Q = [];
% for i = 1:5
%     x = P(i,:); % Selecionando o pai i
%     r = randperm(5); % Gerando aleatoriamente um vetor r de permutações de 1 a 5
%     r(find(r==i))=[]; % Removendo o índice do pai selecionado de r
%     v = P(r(1),:) + 0.5*(P(r(2),:) - P(r(3),:)); % Gerando um vetor v como combinação linear de pais selecionados em r
%     u = [0,0]; % Inicializando o vetor de filho u
%     
%     for j = 1:2 % Para cada variável
%         if rand() < 0.9 % Com uma probabilidade de 90% de cruzamento
%             u(j) = v(j); % Herdando a variável de v
%         else
%             u(j) = x(j); % Herdando a variável do pai i
%         end
%         
%         % tratando cruzamentos em que as variáveis ultrapassam os limites
%         if u(j) < -3
%             u(j) = -3;
%         else
%             if u(j) > 3
%                 u(j) = 3;
%             end
%         end
%     end
%     Q = [Q; u]; % Adicionando o filho gerado à matriz Q de filhos
% end
% 
% R = [P; Q] % Concatenando a matriz de pais P com a matriz de filhos Q
%
%B = [];
%for i = 1:10
%    B = [B;f_viennet(R(i,:))]; % Calculando o valor da função objetivo para cada indivíduo em R
%end


%clear P;
%P = [R B];


P = [
   -1.3438   -0.0098    1.8754   15.0041    0.1756
   -2.0243    0.5116    1.2414   16.2856    0.1725
   -2.2860   -1.6571    4.9790   15.0311    0.1111
   -2.0981   -1.3465    3.0395   15.0222    0.1364
    0.7379    3.0000    4.6528   15.0647    0.0948
   -0.5301    2.4088    2.8431   15.8640    0.1387
   -2.8213   -1.6571    4.3945   15.1662    0.0854
    1.0782    2.7585    4.9934   15.3859    0.1022
    0.9306   -0.9577    1.8691   24.7859    0.1744
    1.0782    2.7585    4.9934   15.3859    0.1022

]

PR = non_domination_sort_mod(P, 3, 2) % População rankeada -> População, numObjetivos, Dimensão do espaço de buca

popObj = PR(1:7, 3:5)

Z = min(popObj)

popObj - repmat(Z, 7, 1)


% O código até aqui realiza a geração de filhos por evolução diferencial,
% tratando cruzamentos que ultrapassam os limites, e o cálculo da função objetivo
% para cada indivíduo gerado (pais + filhos).

% A partir deste ponto, a implementação do algoritmo NSGA-III não está completa.
% A solução do problema requer a implementação de outras etapas, como a
% atribuição de rank de dominância, seleção por nicho, cálculo de distância
% e ordenação dos indivíduos em diferentes camadas.


        