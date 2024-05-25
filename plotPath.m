function plotPath(f, t, x, y, total_length)
    % Pastikan rentang tt tidak melebihi batas t asli
    t_min = min(t);
    t_max = max(t);

    % Gunakan linspace untuk menghasilkan titik tt dalam batas yang aman
    tt = linspace(t_min, t_max, 1000);
    xy = zeros(length(tt), 2);  % Inisialisasi array untuk menyimpan hasil

    % Manual loop untuk menghitung nilai x dan y dari fungsi parametrik
    for i = 1:length(tt)
        if tt(i) >= t_min && tt(i) <= t_max
            xy(i, :) = f(tt(i));  % Menghitung x dan y menggunakan fungsi parametrik
        else
            error('Nilai t berada di luar rentang yang ditentukan.');
        end
    end

    figure;
    plot(xy(:,1), xy(:,2), 'b-', 'LineWidth', 2); % Plot kurva interpolasi
    hold on;
    scatter(x, y, 50, 'r', 'filled'); % Plot titik asli
    title(sprintf('Interpolated Path with Total Length: %.4f', total_length));
    xlabel('X coordinate');
    ylabel('Y coordinate');
    axis equal;
    grid on;

    % Tambahkan teks untuk fungsi parametrik
    xt = x(1); % Misalnya, ambil koordinat x dari titik pertama
    yt = y(1); % Misalnya, ambil koordinat y dari titik pertama
    f_text = sprintf('f(t) = (%.2f, %.2f)', xt, yt);
    text(xt, yt, f_text, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');
end

