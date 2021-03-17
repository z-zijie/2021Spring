% Question 1
function [sol] = func(m, n, s)
    [j, k] = meshgrid(1:m, 1:n);
    jk = [j(:), k(:)]';
    po = inv(s)*jk;
    PO = round(po);
    res = (po == PO);
    res1 = find(res(1,:)==1);
    res2 = find(res(2,:)==1);
    index = intersect(res1, res2);
    sol = jk(:, index);
end

% [OUTPUT]
>> m = 4; n = 6; s = [2 0; 0 2];
>> func(m, n, s)

ans =

     2     2     2     4     4     4
     2     4     6     2     4     6

>> m = 5; n = 6; s = [1 1; 1 -1];
>> func(m, n, s)

ans =

     1     1     1     2     2     2     3     3     3     4     4     4     5     5     5
     1     3     5     2     4     6     1     3     5     2     4     6     1     3     5







% Question 2
clear
f = inline('x.^2 .* exp(-3.*x.^2) + (x/40).^2', 'x');
h = 1e-7;
x = -10:1e-4:10;
y_f = f(x);
y_df = (f(x+h)-f(x-h))/(2*h);
y_ddf = (f(x+h)+f(x-h)-2*f(x))/(h^2);

figure
plot(x,y_f, x,y_df, x,y_ddf)
legend("f(x)", "f'(x)", "f''(x)")

disp(["f_max" max(y_f); "f'_max" max(y_df);"f''_max" max(y_ddf)])

    "f_max"      "0.12283"
    "f'_max"     "0.33936"
    "f''_max"    "2.0012" 
