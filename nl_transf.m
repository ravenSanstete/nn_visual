is_orth = false;
func = @tanh;  % function to choose: sigmoid, morino_tanh, relu, poly2
N = 100;
total_depth = 10;
x = [-N:0.5:N];
y = zeros(size(x));




% generate a geometric object in R^2. Here we generate several ray on R^2,
% which can construct an dense set of the plane.
z = [x; y]; 
d_theta = 0.05*pi;
z_buffer = zeros(3, size(z,2),20);



% generate a infiniesimal rotation on two degree
R = [cos(d_theta), -sin(d_theta); sin(d_theta), cos(d_theta)];

for i=1:20
    z_buffer(1:2,:,i) = R*z;
    z = R*z;
end






for l=1:total_depth

% new a figure at each layer
figure;
    
    
% the outer loop controls the depth of the neural net 
if(l==1)
W = randn(3, 2);
else
W = randn(3, 3);
end


% if requires orthogonal random weight
if(is_orth)
    W = orth(W);
end
b = randn(3, 1);


    for i=1:20
        if(l==1)
         z_prime = func(-W*z_buffer(1:2,:,i)-b*ones(1, size(z,2)));
        else
         z_prime = func(-W*z_buffer(:,:,i)-b*ones(1, size(z,2)));
        end
        
        z_buffer(:,:,i) = z_prime; % update the z buffer
         
        
        hold on;
        plot3(z_prime(1,:), z_prime(2,:), z_prime(3, :));
    end
end


function [y] = sigmoid(x)
    y = 1./(1+exp(-x));
end


function [y] = morino_tanh(x)
    y = tanh(x);
end


function [y] = relu(x)
    y = zeros(size(x));
    y(x>=0) = x(x>=0);
end

function [y] = poly2(x);
    y = x.^2;
end