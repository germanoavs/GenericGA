function IPop = PopMutation(IPop, NumMutateBits, Nbg)
    % THE BEST CHROMOSSOME CAN'T BE MUTATED
    ChromossomesIndex = randi([2 size(IPop, 1)], 1, NumMutateBits);         % generate NumMutateBits chromossome indexes 
    GenesIndex = randi([1 size(IPop, 2)], 1, NumMutateBits);                % generate NumMutateBits genes indexes
    BitsIndex = randi([1 Nbg], 1, NumMutateBits);                           % generate NumMutateBits bits indexes
    BitsIndex = cast(BitsIndex, 'uint32');                                  % class of IPop and BitsIndex must be the same
    
    % inline function to flip a bit
    bitflip = @(val, n) bitxor(val, 2.^(n-1));

    % invert the NumMutatedBits selected
    for i = 1:NumMutateBits
        IPop(ChromossomesIndex(i), GenesIndex(i)) = bitflip(IPop(ChromossomesIndex(i), GenesIndex(i)), BitsIndex(i));
    end
end