addpath('./library_vectorization')

%problemset = 'twotriangles';
problemset = 'l-shape';

path = ['./problem_settings/'  problemset  '/'];
coordinates = load([path  'coordinates.dat']);
elements = load([path  'elements.dat']);


% nodes2coordinates = coordinates
% elems2nodes        = elements

% print mesh
figure(1); show_mesh(elements,coordinates); title('mesh');

% calculate lookup matrices:
%   elems2edges: i-th row gives the edges of the i-th triangle
%   edges2nodes: i-th row gives the nods belonging to the edge with number i
[elems2edges, edges2nodes] = extract_edges(elements);

% calculate the affine transformation between each triangle and the
% reference triangle
[B_F,b_F,detB_F] = transformations(coordinates,elements);

% since 
signs = get_signs(elements);

% assemble mass matrix
A = mass_matrix(elems2edges,B_F,detB_F,signs);

% assemble stiffness matrix


