function [x] = fast_qr(A,b)
    n = length(A);
    e = eye(n);
    for i=1:n
        x = A * e(:, i);
        y = zeros(n,1);
        for j=1:i-1
            y = y + x(j) * e(:, j);
        end
        y = y + norm(x(i:n),2) * e(:, i);
        w = (x-y) / norm(x-y, 2);
        A = A - 2*w*(w'*A);
        b = b - 2*w*(w'*b);
    end
    x = zeros(n,1);
    for i=n:-1:1
        t = b(i);
        for j=i+1:n
            t = t - x(j)*A(i,j);
        end
        x(i) = t / A(i,i);
    end
end