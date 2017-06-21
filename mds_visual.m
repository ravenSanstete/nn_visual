function [Y] = mds_visual(X, k, labels)


% which wraps the mds algorithm implemented internally of matlab with some
% visualization routine

% X: the N*d original points to visualize
% k: integer, to determined the lower dimension in which you want to
% visualize the point
% labels: N*1, labels you want to mark on the obtained visualization


if(k>=3)
    k = 3;
end


% first compute the pdist
dist = pdist(X);

% then do the mds

Y = mdscale(dist, k);

% then do the plot

figure;

if(k==2)
    scatter(Y(:,1), Y(:,2));
    if(nargin==3)
        for i=1:size(X,1)
            text(Y(i,1),Y(i,2),num2str(labels(i)));
        end
    end
else
    scatter3(Y(:, 1), Y(:, 2), Y(:, 3));
    if(nargin==3)
        for i=1:size(X,1)
            text(Y(i,1),Y(i,2),Y(i,3),num2str(labels(i)));
        end
    end
    
end
end

