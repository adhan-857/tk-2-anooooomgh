function val = evaluatePolynomial(coefs, t, t0)
    % Evaluasi polinomial di titik t dengan koefisien yang diberikan
    % coefs: [d, c, b, a]
    d = coefs(1);
    c = coefs(2);
    b = coefs(3);
    a = coefs(4);
    dt = t - t0;
    val = ((d * dt + c) * dt + b) * dt + a;
end
