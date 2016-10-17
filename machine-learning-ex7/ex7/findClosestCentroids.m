function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for i = 1:size(X, 1)
    x = X(i, :);
    Expand_x = ones(K, 1) * x;  % Expand_x is a matrix that has k rows, each
                                % row is the same row vector as x.
    Dif = Expand_x - centroids; % Dif is a matrix that has k rows, each row
                                % is the vector substraction between x and
                                % a centroid.
    [d, idx(i)] = min(diag(Dif * Dif'));
                                % Dif * Dif' gives a matrix that the element
                                % on the i_th row and j_th column is the dot
                                % product between the i_th row vector in Dif
                                % and the j_th row vector in Dif; therefore,
                                % the diagonal of this matrix is the dot product
                                % of each row vector with itself, i.e. the
                                % norm^2 of each row vector. Our job then
                                % becomes finding the minimum in this diagonal.
end


% =============================================================

end

