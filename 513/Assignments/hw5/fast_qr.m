function [x] = fast_qr(A,b)
    [n m] = size(A);
    e = eye(m);
    E = eye(n);
    for i=1:m
        x = A * e(:, i);
        y = zeros(n,1);
        for j=1:i-1
            y = y + x(j) * E(:, j);
        end
        y = y + norm(x(i:n),2) * E(:, i);
        w = (x-y) / norm(x-y, 2);
        A = A - 2*w*(w'*A);
        b = b - 2*w*(w'*b);
    end
    x = zeros(m,1);
    for i=m:-1:1
        t = b(i);
        for j=i+1:m
            t = t - x(j)*A(i,j);
        end
        x(i) = t / A(i,i);
    end
end