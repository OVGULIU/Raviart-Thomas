function [ M ] = mass_matrix( elems2edges,B,detB,signs)
%MASS_MATRIX Summary of this function goes here
%   Detailed explanation goes here

numberOfElems = size(elems2edges,1);
detB = abs(detB);

% define integration points and weights for unit triangle
ip = [1.66666666666666e-01  6.66666666666667e-01;
   6.66666666666667e-01     1.66666666666667e-01;
   1.66666666666667e-01     1.66666666666666e-01];

weight = ones(3,1).*1.66666666666667e-01;


end

