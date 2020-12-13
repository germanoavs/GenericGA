%**************************************************************************
%   FUNC: FloatMat2UnsignedMat(Pop) 
%   OUTPUT: IPop_uint32
%   Description: this function converts the data type of Pop to 'uint32' without
%   changing the binary, the new representation allows us to make crossover
%   and mutation without binary to decimal convertions (computationally
%   expensive).
%**************************************************************************

function [IPop_uint32] = FloatMat2UnsignedMat(Pop)
    IPop_uint32 = zeros(size(Pop,1), size(Pop,2), 'uint32');
    
    for i = 1:size(Pop,1)
        % typecast Convert datatypes without changing underlying data.
        IPop_uint32(i,:) = typecast(Pop(i,:), 'uint32');
    end
end
