problemaMO = @DTLZ4;
Problema = 'DTLZ4';

% M = 5; N = 212;
% M = 8; N = 156;
% M = 10; N = 276;
 M = 15; N = 136;

% DTLZ1 D = (M + K) - 1, com K = 5
% DTLZ2-4 D = (M + K) - 1, com K = 10
K = 10; 
D = M + K - 1;
MaxGen = 3000;
maxFE = N * MaxGen;

NE = 20; % numero de execuções
