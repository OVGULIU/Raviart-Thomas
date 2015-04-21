function [ MASS ] = mass_matrix( elems2edges,B,detB,signs)
%MASS_MATRIX Summary of this function goes here
%   Detailed explanation goes here

numberOfElems = size(elems2edges,1);
detB = abs(detB);

% define integration points and weights for unit triangle
ip = [1.66666666666666e-01  6.66666666666667e-01;
   6.66666666666667e-01     1.66666666666667e-01;
   1.66666666666667e-01     1.66666666666666e-01];

weight = ones(3,1).*1.66666666666667e-01;

% reference basis function curl values on integration points,
% and number of basis functions
[val,~] = basis(ip);

% calculate all local stiffness matrices simultaneously
% (without calculating symmetric entries twice)
MASS = zeros(3,3,numberOfElems);
for i=1:3
    for m=1:3
        for k=m:3
            MASS(m,k,:) = squeeze(MASS(m,k,:))' + ...
                          weight(i) .* detB'.^(-1) .* ...
                          sum( squeeze( astam(signs(:,m), amsv(B, val(i,:,m))) ) ...
                               .* ...
                               squeeze( astam(signs(:,k), amsv(B, val(i,:,k))) ) ...
                             );
        end
    end
end

% copy symmetric entries of the local matrices
MASS = copy_triu(MASS);

Y = reshape(repmat(elems2edges',3,1),3,3,numberOfElems);     % y-indexes
X = permute(Y,[2 1 3]);                                       % x-indexes
MASS = sparse(X(:),Y(:),MASS(:));                             % mass matrix

end

