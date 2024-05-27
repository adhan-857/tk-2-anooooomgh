function tk2(n)
  % Main script to calculate and plot the path
  [t, x, y] = pathcalculator(n);

  % Interpolasi Natural Cubic Spline secara manual dan mendapatkan fungsi parametrik
  [cs_x, cs_y, f] = splineInterpolation(t, x, y);

  % Hitung total panjang lintasan menggunakan spline interpolasi
  total_length = pathLength(cs_x, cs_y, t);

  % Plot hasil interpolasi dan panjang lintasan menggunakan fungsi parametrik
  [t, x_t, y_t] = plotPath(f, t, x, y, total_length);
end
