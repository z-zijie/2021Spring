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