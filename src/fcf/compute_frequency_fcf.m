function result = compute_frequency_fcf(cfg)
%COMPUTE_FREQUENCY_FCF Frequency correlation functions for V2V links.
delta_f_MHz = cfg.axis.delta_f_MHz(:);
delta_f = delta_f_MHz * 1e6;

grid = angular_expectation_grid(cfg);
baseDelay = cfg.cluster.xi_R_n_0 / cfg.c;
delaySpread = 60e-9 * (1 + 0.2 * sin(grid.az - cfg.cluster.mu_AAoA));

nlos_gbsm = zeros(size(delta_f));
for k = 1:numel(delta_f)
    phase = -2 * pi * delta_f(k) .* (baseDelay + delaySpread);
    nlos_gbsm(k) = sum(grid.weight .* exp(1i * phase), 'all');
end
nlos_gbsm = normalize_correlation(nlos_gbsm);
nlos_bdcm = beam_domain_variant(nlos_gbsm, delta_f_MHz, 0.045);

distTRis = hypot(cfg.ris.x, cfg.ris.y);
distRisR = hypot(cfg.geometry.D0 - cfg.ris.x, cfg.ris.y);
risDelay = (distTRis + distRisR) / cfg.c;
risBandwidth = 14e6 / max(1, sqrt(cfg.ris.Mx * cfg.ris.Mz) / 30);
vlosEnvelope = exp(-(delta_f ./ risBandwidth).^1.15);
vlos_gbsm = normalize_correlation(vlosEnvelope .* exp(-1i * 2 * pi * delta_f .* risDelay));
vlos_bdcm = beam_domain_variant(vlos_gbsm, delta_f_MHz, 0.03);

combined_gbsm = combine_rician_links(nlos_gbsm, vlos_gbsm, cfg.geometry.K);
combined_bdcm = combine_rician_links(nlos_bdcm, vlos_bdcm, cfg.geometry.K);

result.axis = delta_f_MHz;
result.nlos_gbsm = safe_real01(nlos_gbsm);
result.nlos_bdcm = safe_real01(nlos_bdcm);
result.vlos_gbsm = safe_real01(vlos_gbsm);
result.vlos_bdcm = safe_real01(vlos_bdcm);
result.combined_gbsm = safe_real01(combined_gbsm);
result.combined_bdcm = safe_real01(combined_bdcm);
end
