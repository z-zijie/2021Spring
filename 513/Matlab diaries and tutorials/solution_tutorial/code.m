%% Problem_1
clear;
x = -1:0.01:1;
plot(x,sin(x));
grid on;
title('sin(x)');

%% Problem_2
clear;
A = eye(20);
A(:, 1)=1;
A(20, :)=1;
A(1, :)=1;
A(1, 20)=0;
b = zeros([20, 1]);
b(1) = 17;
x = A \ b;

%% Problem_3
clear;
