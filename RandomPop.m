function FPop = RandomPop(npop, nvar, range)
    RandRange = @(a, b, i, j) (a+(b-a).*rand(i,j));                   % i x j rand matrix in the range [a, b]
    randMat = (RandRange(range(1), range(2), npop, nvar));
FPop = cast(randMat, 'single');