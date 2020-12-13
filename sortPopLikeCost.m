%**************************************************************************
%   FUNC: sortPopLikeCost(CostVec, Pop, IPop)) 
%   DESC: This new function sorts CostVec in crescent or decrescent order 
%   and rearrange IPop and Pop like in CostVec.
%*****************************************************************************/
function [CostVec_s, Pop_s, IPop_s] = sortPopLikeCost(CostVec, Pop, IPop, Way)
   [CostVec_s, order_index] = sort(CostVec, Way);
   Pop_s = Pop(order_index, :);
   IPop_s = IPop(order_index, :);
end