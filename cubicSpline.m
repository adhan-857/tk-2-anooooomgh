function cs = cubicSpline(t, y)
    n = length(t) - 1;  % Jumlah interval (n)
    h = diff(t);  % Panjang setiap interval
    a = y(:);  % Mengubah y menjadi vektor kolom

    % Membentuk sistem persamaan linear
    A = zeros(n+1, n+1);
    b = zeros(n+1, 1);

    % Kondisi batas untuk natural spline (turunan kedua di batas adalah nol)
    A(1,1) = 1;  % Kondisi batas di awal
    A(n+1,n+1) = 1;  % Kondisi batas di akhir

    % Mengisi matriks A dan vektor b
    for i = 2:n
        A(i,i-1) = h(i-1);
        A(i,i) = 2 * (h(i-1) + h(i));
        A(i,i+1) = h(i);
        b(i) = 3 * ((a(i+1) - a(i)) / h(i) - (a(i) - a(i-1)) / h(i-1));
    end

    c = A \ b;  % Koefisien spline c

    % Menghitung koefisien b dan d
    b = zeros(n, 1);
    d = zeros(n, 1);
    for i = 1:n
        b(i) = (a(i+1) - a(i)) / h(i) - h(i) * (2 * c(i) + c(i+1)) / 3;
        d(i) = (c(i+1) - c(i)) / (3 * h(i));
    end

    % Menyimpan koefisien dalam format piecewise polynomial
    cs.form = 'pp';  % Format piecewise polynomial
    cs.breaks = t(:).';  % Titik-titik pembagi interval
    cs.coefs = [d c(1:end-1) b a(1:end-1)];  % Koefisien spline
    cs.pieces = n;  % Jumlah potongan (pieces)
    cs.order = 4;  % Orde polinomial (cubic spline)
    cs.dim = 1;  % Dimensi
end
