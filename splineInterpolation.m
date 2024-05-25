function [cs_x, cs_y, f] = splineInterpolation(t, x, y)
    % Interpolasi Natural Cubic Spline untuk x dan y
    cs_x = cubicSpline(t, x);
    cs_y = cubicSpline(t, y);

    % Membuat fungsi parametrik f(t)
    f = @(t_val) evaluateSpline(cs_x, cs_y, t_val)
end
