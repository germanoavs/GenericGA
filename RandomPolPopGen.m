%**************************************************************************
%  FUNC: RandomFloatPolPopGen(NPop, NVar, InitPol, DeviationFactor)
%  OUTPUT: Randomic float population FPop around InitPol 
%**************************************************************************

function FPop = RandomPolPopGen(npop, nvar, InitPol, DeviationFactor)
    FPop = zeros(npop, nvar, 'single');
    RandRange = @(a, b, i, j) (a+(b-a).*rand(i,j));                   % i x j rand matrix in the range [a, b]
    
    InitPol_m = repmat(InitPol, npop, 1);                             % replicate InitPol npop times
    
    randMat = (1+RandRange(-DeviationFactor, DeviationFactor, npop, nvar-1));
    % first coefficient is always zero
    FPop(:,2:end) = InitPol_m(:, 2:end) .* randMat;
end