function value = evaluateSpline(cs_x, cs_y, t_val)
    % Evaluasi spline untuk nilai t tertentu
    if isScalar(t_val)
        t_val = [t_val];  % Ubah menjadi array untuk pemrosesan
    end
    value = zeros(length(t_val), 2);
    for i = 1:myNumel(t_val)
        t = t_val(i);
        % Temukan interval yang sesuai
        idx = findInterval(cs_x.breaks, t);
        % Evaluasi nilai x(t) dan y(t)
        x_val = evaluatePolynomial(cs_x.coefs(idx, :), t, cs_x.breaks(idx));
        y_val = evaluatePolynomial(cs_y.coefs(idx, :), t, cs_y.breaks(idx));
        value(i, :) = [x_val, y_val];
    end
end

function tf = isScalar(val)
    % Memeriksa apakah val adalah skalar
    tf = (myNumel(val) == 1);
end

function count = myNumel(val)
    % Menghitung jumlah elemen dalam array secara manual
    count = 0;
    for i = val
        count = count + 1;
    end
end

