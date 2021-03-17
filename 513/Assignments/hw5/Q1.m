clear

% Declare Matrix Z

Z = [1     2     3;
     4     5     6;
     7     8     7;
     4     2     3;
     4     2     2]
e = eye(3);
E = eye(5);

% First Step
A0 = Z;
x = A0 * e(:, 1)
y = norm(x,2) * E(:, 1)
w = (x-y) / norm(x-y, 2)
H1 = E - 2 * w * w'
A1 = H1 * A0

% Second Step
x = A1 * e(:, 2)
y = x(1) * E(:, 1) + norm(x(2:5),2) * E(:, 2)
w = (x-y) / norm(x-y, 2)
H2 = E - 2 * w * w'
A2 = H2 * A1

% Third Step
x = A2 * e(:, 3);
y = x(1) * E(:, 1) + x(2) * E(:, 2) + norm(x(3:5),2) * E(:, 3)
w = (x-y) / norm(x-y, 2)
H3 = E - 2 * w * w'
A3 = H3 * A2

% Calc q and r
q = H1 * H2 * H3
r = H3 * H2 * H1 * Z

% Use qr routine
[Q R] = qr(Z)

