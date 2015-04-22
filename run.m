clear all

addpath('./library_vectorization')


problemset = 'twotriangles';
%problemset = 'l-shape';

path = ['./problem_settings/'  problemset  '/'];
addpath(path);
coordinates = load([path  'coordinates.dat']);
elements = load([path  'elements.dat']);
boundary = load([path 'boundary.dat']);

% print mesh
figure(1); show_mesh(elements,coordinates); title('mesh');

% calculate lookup matrices:
%   elems2edges: i-th row gives the edges of the i-th triangle
%   edges2nodes: i-th row gives the nods belonging to the edge with number i
[elems2edges, edges2nodes] = extract_edges(elements);

% calculate the affine transformation between each triangle and the
% reference triangle
[B_F,b_F,detB_F] = transformations(coordinates,elements);

% signs 
signs = get_signs(elements);

% assemble mass matrix
A = mass_matrix(elems2edges,B_F,detB_F,signs);

% assemble divergence matrix
B = divergence_matrix(elems2edges,edges2nodes,signs);

% define penalization epsilon
epsilon = 10e10;

% assemble Neumann-Boundary Matrix
% ....

% assemble right sides

% Volume force
b_f = f_vector(coordinates, elements, @f);

% Robin boundary
b_R = boundary_vector(coordinates, elements, @u_0, @g, epsilon);

% Clean up afterwards
rmpath(path)

