function [ signs ] = get_signs( elements )
% calculate signs representing the direction of the edges normal vector
% signs(i,j) is the sign of the j-th edge of the i-th triangle
tmp = elements(:,[2 3 1]) -  elements(:,[3 1 2]);
signs = tmp ./ abs(tmp);

end

