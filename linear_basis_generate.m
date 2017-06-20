function [z_buffer] = linear_basis_generate(instance_num, bdd)
% this generates a family of rays on the R^2 space
% this is not the real-world things
x = [-bdd:0.5:bdd];
y = zeros(size(x));

% generate a geometric object in R^2. Here we generate several ray on R^2,
% which can construct an dense set of the plane.
z = [x; y]; 
d_theta = 0.05*pi;
z_buffer = zeros(3, size(z,2),20);

% generate a infiniesimal rotation on two degree
R = [cos(d_theta), -sin(d_theta); sin(d_theta), cos(d_theta)];

for i=1:instance_num
    z_buffer(1:2,:,i) = R*z;
    z = R*z;
end


end

