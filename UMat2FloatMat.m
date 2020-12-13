%**************************************************************************
%   FUNC: UMat2FloatMat(IPop) 
%   OUTPUT: IPop_uint32
%   Description: this function converts IPop back to 'single' type, this way 
%   the fitness can be evaluated in the next generation.
%**************************************************************************
function PopFloat = UMat2FloatMat(IPop)
    PopFloat = zeros(size(IPop,1), size(IPop,2), 'single');
    
    for i = 1:size(IPop, 1)
        % typecast Convert datatypes without changing underlying data
        PopFloat(i,:) = typecast(IPop(i,:), 'single');
    end
end