is_orth = true;
is_sym = false;
maintain_figure = true;
func = @sigmoid;  % function to choose: sigmoid, morino_tanh, relu, poly2
bdd = 100;
instance_num = 3;
total_depth = 30;
observation_time = 1.0; % how long each figure will be reserved on the desktop



% generate a family of rays on the R^2 plane
% z_buffer = linear_basis_generate(instance_num, bdd);


z_buffer = circle_basis_generate(instance_num, true);





figure;
% draw the dim-2 object on R^2 plane
for i=1:instance_num
    hold on;
    plot(z_buffer(1,:,i), z_buffer(2,:,i));
end



pause(observation_time);


for l=1:total_depth

% new a figure at each layer
figure;


    
    
W = randn(3, 3);



% if requires orthogonal random weight
if(is_orth)
    W = orth(W);
end



% whether the weight matrix is symmetric, which should not be set at the
% same time with is_orth
if(is_sym)
    P = randn(3,3);
    W = 0.5*(P+P');
end
b = randn(3, 1);


    for i=1:instance_num
        z_prime = func(-W*z_buffer(:,:,i)-b*ones(1, size(z_buffer,2)));

        
        z_buffer(:,:,i) = z_prime; % update the z buffer
         
        
        hold on;
        plot3(z_prime(1,:), z_prime(2,:), z_prime(3, :));
    end
    
    
    pause(observation_time);
    
    
end



if(~maintain_figure)
    close all;
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