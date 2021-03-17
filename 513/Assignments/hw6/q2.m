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