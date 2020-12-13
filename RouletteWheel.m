function n = RouletteWheel(Guess, WeigthVector, NKeep)
    for n = 1:NKeep
        if Guess < WeigthVector(n)
            return 
        end
    end
    
    n = NKeep-1;
end