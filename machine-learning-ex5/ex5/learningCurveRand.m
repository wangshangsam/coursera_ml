function [error_train, error_val] = ...
    learningCurveRand(X, y, Xval, yval, lambda)

% Limits of iterations.
k = min([length(y), length(yval)]);

% You need to return these values correctly
error_train = zeros(k, 1);
error_val   = zeros(k, 1);

% err function.
err = @(X, y, theta) ( 1/(2*length(y)) * (X*theta - y)' * (X*theta - y) );

% Number of attemtps to randomize and average the train errors and cv errors.
attemtps = 50;

for i = 1:k
    error_train_sum = 0;
    error_val_sum = 0;
    for j = 1:attemtps
        % Generating randomly selected train set and cv set (of size i).
        chosen_indices_train = randperm(length(y), i);
        chosen_indices_val = randperm(length(yval), i);
        X_sub = X(chosen_indices_train, :);
        y_sub = y(chosen_indices_train);
        Xval_sub = Xval(chosen_indices_val, :);
        yval_sub = yval(chosen_indices_val);

        % Train on X_sub and y_sub to obtain theta.
        theta = trainLinearReg(X_sub, y_sub, lambda);
        % Accumulate the error over 50 iterations.
        error_train_sum = error_train_sum + err(X_sub, y_sub, theta);
        error_val_sum = error_val_sum + err(Xval_sub, yval_sub, theta);
    end
    % Average over the attemtps.
    error_train(i) = error_train_sum / attemtps;
    error_val(i) = error_val_sum / attemtps;
end





% -------------------------------------------------------------

% =========================================================================

end
