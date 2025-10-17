function y = blend(y1, y2, x1, x2, x)
%BLEND Summary of this function goes here
%   Detailed explanation goes here
u = (x- x1)./(x2 - x1);
transition = 3*u.^2 - 2*u.^3;



y = zeros(size(x)); % Initialize output array
y(x <= x1) = y1(x <= x1); % Assign y1 where x is less than or equal to x1
y(x >= x2) = y2(x >= x2); % Assign y2 where x is greater than or equal to x2
idx = (x > x1) & (x < x2); % Create a idx for values between x1 and x2
y(idx) = (1 - transition(idx)) .* y1(idx) + transition(idx) .* y2(idx); % Blend for values in the range

end