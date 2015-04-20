load coordinates.dat
load elements.dat

% nodes2coordinates = coordinates
% elems2nodes        = elements

% print mesh
figure(1); show_mesh(elements,coordinates); axis([0 8 0 6]); title('mesh');

% calculate lookup matrices:
%   elems2edges: i-th row gives the edges of the i-th triangle
%   edges2nodes: i-th row gives the nods belonging to the edge with number i
[elems2edges, edges2nodes] = extract_edges(elements);

% calculate the affine transformation between each triangle and the
% reference triangle
[B,b,detB] = transformations(coordinates,elements);

% since 
signs = get_signs(elements);

% assemble mass matrix
M = mass_matrix(elems2edges,B,detB,signs);

