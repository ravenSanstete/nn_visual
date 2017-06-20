function [z_buffer] = circle_basis_generate(instance_num, is_random_center)

% generate aeunit circle centered at (0,0)

thetas = [0:0.05*pi:2*pi];
unit_s_1 = [cos(thetas) ; sin(thetas)];


z_buffer = zeros(3, size(unit_s_1, 2), instance_num);

% let us generate random circles with [0.5,1.5] scale
for i=1:instance_num
    z_buffer(1:2, :, i) = unit_s_1*(0.5+rand(1,1));
    
    if(is_random_center)
        z_buffer(1:2, :, i) = z_buffer(1:2, :, i) + 0.5*randn(2,1)*ones(1, size(unit_s_1, 2));
    end
end

end

