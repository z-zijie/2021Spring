clear
A = rand(5)
b = rand(5, 1)
x = A \ b
x = fast_qr(A, b)