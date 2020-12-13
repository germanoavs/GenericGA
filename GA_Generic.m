%{
Author: Germano Sobroza
Date: 08/10/2020
Description: The script GA_Generic implements the processes of a genetic
algorithm, including:
- Initialize a random or InitialGuess based population
- Evaluation (the fitness function should be edited on PopCostVect)
- Selection
- Crossover
- Mutation
%}
clear;clc;close;

% GA PARAMETERS
NPop  = 40;                                     % Number of chomossomes per population
SRate = 0.2;                                    % Selection rate
MRate = 0.01;                                   % Mutation rate 
NumGen = 40;                                    % desired number of generations
NVar  = 1;                                      % number of genes/coeff's per chromossome
%InitialGuess = []                              
InferiorLimit = -10;                            % min gene value for random pop initialization 
SuperiorLimit = 10;                             % max gene value for random pop initialization 

% VARIABLES 
Nbg = 32;                                       % number of bits per gene
Nbits = Nbg*NVar;                               % Number of bits per chromossome
NKeep = round(SRate*NPop);                      % Number of chromosomes that is maintened each generation
NumMutatedBits = round(MRate*(NPop-1)*Nbits);   % total number of bits that will be mutated
CostVector = zeros(1, NPop, 'single');

%**********************************************************
% generate polynomial population Pop with a initial guess with
% Pop = RandomPolPopGen(NPop, NVar ,InitialGuess, InitPopDeviationFactor);
% or generate a random pop with
Pop = RandomPop(NPop, NVar, [InferiorLimit SuperiorLimit]);

% Convert float Pop into unsigned int (32 bits) IPop 
[IPop] = FloatMat2UnsignedMat(Pop);

%  generate the roulette wheel sectors - See Figure 3.2 in section 3.1 of Genetic Algorithms 
%  in Electromagnetics - Randy L. Haupt & Douglas H. Werner - WILEY & SONS - 2007.  
WeightVector = RankWeightGen(NKeep); 


%*************** generation loop starts here ******************************
for GenIndex = 1:NumGen

    % Evaluate the Cost of all chromosomes in Pop and save in CostVect
    CostVect = PopCostVect(Pop);                   % Edit the fitness equation on PopCostVect
    
    % Sort CostVect in ascending/descending order. Re-order the lines on Pop and IPop according to the CostVect sorting 
    [CostVect, Pop, IPop] = sortPopLikeCost(CostVect, Pop, IPop, 'ascend'); % 'ascend' or 'descend'

    % Crossover 
    IPop = PopCrossover (IPop, WeightVector, NKeep, NPop, NVar);
    
    % Mutation
        IPop = PopMutation(IPop, NumMutatedBits, Nbg);

    % Convert unsigned int (32 bits) crossed over & mutated IPop into float Pop. 
    Pop = UMat2FloatMat(IPop);
end

















