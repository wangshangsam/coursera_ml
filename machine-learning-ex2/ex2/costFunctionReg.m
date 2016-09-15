function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = @(X) sigmoid(X*theta); % h = [h_1; h_2; h_3; ...; h_m]
J = - 1/m * [y; 1 - y]' * [log(h(X)); log(1 - h(X))];
grad(1) = 1/m * X(:, 1)' * (h(X) - y);

if length(theta) > 1
    J = J + lambda/(2*m) * theta(2:end)' * theta(2:end);
    grad(2:end) = 1/m * X(:, 2:end)' * (h(X) - y) ...
                    + lambda/m * theta(2:end);
end


% =============================================================

end
