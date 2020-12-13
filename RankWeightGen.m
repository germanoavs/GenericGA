% DESC: Implement the ascending ordered cumulative result of equation 2.11 in section 2.2.5 of
% PRACTICAL GENETIC ALGORITHMS - 2nd - Randy L. Haupt & Sue Ellen Haupt - WILEY & SONS
% - 2004. The weight results are stored in WeightVector (previous mem allocation is assumed).

function WeightVector = RankWeightGen(NKeep)
    n = 1:NKeep;
    Den = sum(n);
    WeightVector(n)= (NKeep-n+1)/Den;       % equation 2.11
    WeightVector = cumsum(WeightVector);    % cumulative sum
end