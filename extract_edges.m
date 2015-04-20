function [ elems2edges, vertices ] = extract_edges( elements )
%EXTRACT_EDGES Summary of this function goes here
%   Detailed explanation goes here

% extact the edges of all triangles
edges1 = elements(:, [2 3]);
edges2 = elements(:, [3 1]);
edges3 = elements(:, [1 2]);

% store edges
vertices = zeros(size(elements,1)*3,2);
% copy the edges into vertex matrix ensure that every group of
% three consecutive rows belongs to the same triangle
vertices(1:3:end,:) = edges1;
vertices(2:3:end,:) = edges2;
vertices(3:3:end,:) = edges3;

% sort each row
tmp_vertices = sort(vertices,2);

% eliminate duplicate rows
[~,J,I] = unique(tmp_vertices,'rows');
vertices = vertices(J,:);

elems2edges = reshape(I,3,size(elements,1))';
end

