function y = combine_rician_links(nlos, vlos, K)
%COMBINE_RICIAN_LINKS Rician-weighted NLoS + VLoS correlation.
y = (1 / (K + 1)) .* nlos(:) + (K / (K + 1)) .* vlos(:);
y = normalize_correlation(y);
end
