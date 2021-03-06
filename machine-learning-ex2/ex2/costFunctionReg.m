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

for k = 1:m
  currentX = transpose(X(k,:));
  gz = sigmoid(transpose(theta) * currentX);
  gradient = (1 / m) * (gz - y(k)) .* currentX;
  grad(1) = grad(1) + gradient(1);
  for n = 2:size(theta)
      grad(n) = grad(n) + gradient(n);% + (lambda/m) * grad(n);
  end
  J = J + (-y(k) * log(gz) - (1 - y(k)) * log(1 - gz));
end
sumTheta = 0;
for n = 2:size(grad)
   grad(n) = grad(n) + (lambda/m) * theta(n);
   sumTheta = sumTheta + theta(n)^2;
end
J = J * (1/m) + (lambda / (2 * m)) * sumTheta;




% =============================================================

end
