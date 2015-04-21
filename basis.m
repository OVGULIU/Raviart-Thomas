function [ val,dval ] = basis( ip )
%BASIS Summary of this function goes here
%   Detailed explanation goes here
%
%   phi_1(x,y) = ( x ) phi_2(x,y) = ( x-1 ) phi_3(x,y) = (  x  )
%                ( y )              (  y  )              ( y-1 )

% input: points to evaluate the basis at

M    = size(ip,1);
val  = zeros(M, 2, 3);
dval = zeros(M, 1, 3);

% evaluate the basis functions
val(:,:,1) = [ ip(:,1)      ip(:,2)  ];
val(:,:,2) = [ ip(:,1)-1    ip(:,2)  ];
val(:,:,3) = [ ip(:,1)      ip(:,2)-1];

% calculate divergence; easy always 2
dval = dval + 2;
end

