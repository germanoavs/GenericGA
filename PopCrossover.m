%**************************************************************************
%DESC: PopCrossover generate NPop-Nkeep new chromossomes throught random
%mask crossover and replace the worst ones. 
%
%**************************************************************************
function IPop = PopCrossover(IPop, WeightVector, NKeep, NPop, NVar)
    for ChromosomeIndex = NKeep+1:2:NPop-1 
										
        while (1)                                                          % get mother & father distinct random indexes according to the roulette wheel  
            MotherIndex = RouletteWheel(rand, WeightVector, NKeep);        % roulette wheel randomly selects the mother chromossome  
            FatherIndex = RouletteWheel(rand, WeightVector, NKeep);        % roulette wheel randomly selects the father chromossome 
            if MotherIndex~=FatherIndex
                break;
            end
        end
              
      % random mask crossover
      Mask = randi(intmax('uint32'), 'uint32');
      Mask_= bitcmp(Mask);                                               % bitwise not -> 1?s complement of Mask        

		for GeneIndex = 1:NVar											
            IPop(ChromosomeIndex, GeneIndex)  =  bitor(bitand(IPop(MotherIndex,GeneIndex) , Mask_) , ...
                                                    bitand(IPop(FatherIndex,GeneIndex) , Mask ));
            IPop(ChromosomeIndex+1,GeneIndex) =  bitor(bitand(IPop(MotherIndex,GeneIndex) , Mask ) , ...
                                                   bitand(IPop(FatherIndex, GeneIndex) , Mask_)); 
        end
   
    end

end