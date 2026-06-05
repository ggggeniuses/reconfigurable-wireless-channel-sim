function y = truncated_gaussian_pdf(x, mu, sigma)
%TRUNCATED_GAUSSIAN_PDF Wrapped Gaussian-like angular density on [-pi, pi].
%
% This compact helper replaces the duplicated AAoA/EAoA PDF files in the
% original STF-CF scripts while preserving their role in expectation terms.
dx = angle(exp(1i * (x - mu)));
y = exp(-0.5 * (dx ./ sigma).^2);
area = trapz(x, y);
if area > 0
    y = y ./ area;
end
end
