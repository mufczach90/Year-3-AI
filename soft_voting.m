function final_predictions = soft_voting(predictions1, predictions2, weights)
% predictions1 and predictions2 are the predictions from the two models
% weights is a vector of weights for the predictions, with the first element
% corresponding to the weight for predictions1 and the second element
% corresponding to the weight for predictions2.

% Check that the number of predictions match
if length(predictions1) ~= length(predictions2)
    error('Number of predictions do not match');
end

% Check that the number of weights match
if length(weights) ~= 2
    error('Number of weights do not match number of predictions');
end

% Initialize final_predictions vector
final_predictions = zeros(length(predictions1), 1);

% Combine predictions using weighted average
for i = 1:length(predictions1)
    final_predictions(i) = weights(1)*predictions1(i) + weights(2)*predictions2(i);
end

% Round final predictions to the nearest integer
final_predictions = round(final_predictions);

end
