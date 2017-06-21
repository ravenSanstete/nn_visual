function [X,Y,F] = complex_surf_generator(freq, bdd, scale, to_draw, to_flat)
% this generats a multi-peak complicated loss surface over R^2, with a configurable freq 
% with the expression scale*(sin(freq*X)+sin(freq*Y));

x = [-bdd:0.1:bdd];

[X, Y] = meshgrid(x);
F = scale*(sin(freq*X)+sin(freq*Y));


if(to_draw)
    figure;
    surf(X,Y,F);
end

if(to_flat)
    X = X(:);
    Y = Y(:);
    F = F(:);
end

end

