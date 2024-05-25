function total_length = pathLength(cs_x, cs_y, t)
    % Fungsi untuk menghitung panjang lintasan
    % Menggunakan metode numerik untuk menghitung turunan

    % Generate fine grid for t
    tt = linspace(min(t), max(t), 1000);

    % Evaluate spline and its derivatives numerically
    xx = ppval(cs_x, tt);
    yy = ppval(cs_y, tt);

    dx_dt = diff(xx) ./ diff(tt);
    dy_dt = diff(yy) ./ diff(tt);

    % Calculate the path length
    total_length = sum(sqrt(dx_dt.^2 + dy_dt.^2)) * (tt(2) - tt(1));
end
