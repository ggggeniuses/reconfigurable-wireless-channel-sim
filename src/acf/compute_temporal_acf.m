function result = compute_temporal_acf(cfg)
%COMPUTE_TEMPORAL_ACF Temporal ACFs for RIS-empowered V2V GBSM/BDCM links.
delta_t = cfg.axis.delta_t(:);
grid = angular_expectation_grid(cfg);

vT = cfg.motion.vT;
vR = cfg.motion.vR;
lambda = cfg.lambda;

txProjection = cos(grid.el) .* cos(grid.az - cfg.motion.eta_azi_T) .* cos(cfg.motion.eta_ver_T) ...
             + sin(grid.el) .* sin(cfg.motion.eta_ver_T);
rxProjection = cos(grid.el) .* cos(grid.az - cfg.motion.eta_azi_R);
relativeDoppler = (vT .* txProjection - vR .* rxProjection) ./ lambda;

nlos_gbsm = zeros(size(delta_t));
for k = 1:numel(delta_t)
    phase = 2 * pi * relativeDoppler .* delta_t(k);
    nlos_gbsm(k) = sum(grid.weight .* exp(1i * phase), 'all');
end
nlos_gbsm = normalize_correlation(nlos_gbsm);
nlos_bdcm = beam_domain_variant(nlos_gbsm, delta_t, 0.04);

risAz = atan2(cfg.ris.y, cfg.ris.x);
risEl = atan2(cfg.ris.z - cfg.geometry.H0, hypot(cfg.ris.x, cfg.ris.y));
vlosDoppler = (vT * (cos(risEl) * cos(risAz - cfg.motion.eta_azi_T) * cos(cfg.motion.eta_ver_T) ...
                  + sin(risEl) * sin(cfg.motion.eta_ver_T)) ...
             - vR * cos(risAz - cfg.motion.eta_azi_R)) / lambda;
risSize = sqrt(max(cfg.ris.Mx * cfg.ris.Mz, 1));
decorrelationRate = 18 + 0.11 * risSize + 80 * (cfg.ris.dmx / lambda);
vlos_gbsm = normalize_correlation(exp(-decorrelationRate .* delta_t) .* exp(1i * 2 * pi * vlosDoppler .* delta_t));
vlos_bdcm = beam_domain_variant(vlos_gbsm, delta_t, 0.025);

combined_gbsm = combine_rician_links(nlos_gbsm, vlos_gbsm, cfg.geometry.K);
combined_bdcm = combine_rician_links(nlos_bdcm, vlos_bdcm, cfg.geometry.K);

result.axis = delta_t;
result.nlos_gbsm = safe_real01(nlos_gbsm);
result.nlos_bdcm = safe_real01(nlos_bdcm);
result.vlos_gbsm = safe_real01(vlos_gbsm);
result.vlos_bdcm = safe_real01(vlos_bdcm);
result.combined_gbsm = safe_real01(combined_gbsm);
result.combined_bdcm = safe_real01(combined_bdcm);
end
