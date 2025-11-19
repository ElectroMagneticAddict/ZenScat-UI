function n = Dispersion(src, coeffs)

    coeffs = abs(coeffs);
    Lam0   = 1e6 * src.Lam0(floor(length(src.Lam0)/2 + 1));
    M      = size(coeffs);
    n      = zeros(M(1), length(Lam0)); % eilute - medziaga % stulpelis - luzis
    for i = 1:M(1)
        A   = coeffs(i,1:M(2)/2);
        B   = coeffs(i,M(2)/2+1:end);
        Sum = 0;
         for m = 1:length(A)
             Sum = Sum + A(m) .* Lam0.^2 ./ (Lam0.^2 - B(m));
         end 
        n(i,:) = sqrt(1 + Sum);   
     end
end