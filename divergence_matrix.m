function [ DIV_MATRIX ] = divergence_matrix( elems2edges,edges2nodes,signs )
%DIVERGENCE_MATRIX Summary of this function goes here
%   Detailed explanation goes here
numberOfElements = size(elems2edges,1);
numberOfEdges    = size(edges2nodes,1);
 
DIV_MATRIX = sparse(numberOfElements,numberOfEdges);

for l=1:numberOfElements
    edges = elems2edges(l,:);
    DIV_MATRIX(l,edges) = signs(l,:);
end

end

