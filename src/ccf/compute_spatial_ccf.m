function result = compute_spatial_ccf(cfg)
%COMPUTE_SPATIAL_CCF Spatial CCFs for RIS-empowered V2V GBSM/BDCM links.
delta_q = cfg.axis.delta_q(:);
grid = angular_expectation_grid(cfg);

spacing = cfg.antenna.delta_R / cfg.lambda;
rxProjection = cos(grid.el) .* cos(grid.az - cfg.antenna.psi_azi_R) .* cos(cfg.antenna.psi_ver_R) ...
             + sin(grid.el) .* sin(cfg.antenna.psi_ver_R);

nlos_gbsm = zeros(size(delta_q));
for k = 1:numel(delta_q)
    phase = 2 * pi * spacing * delta_q(k) .* rxProjection;
    nlos_gbsm(k) = sum(grid.weight .* exp(1i * phase), 'all');
end
nlos_gbsm = normalize_correlation(nlos_gbsm);
nlos_bdcm = beam_domain_variant(nlos_gbsm, delta_q, 0.03);

risAz = atan2(cfg.ris.y, cfg.ris.x);
risEl = atan2(cfg.ris.z - cfg.geometry.H0, hypot(cfg.ris.x, cfg.ris.y));
risProjection = cos(risEl) * cos(risAz - cfg.antenna.psi_azi_R) * cos(cfg.antenna.psi_ver_R) ...
              + sin(risEl) * sin(cfg.antenna.psi_ver_R);
aperture = sqrt(max(cfg.ris.Mx * cfg.ris.Mz, 1)) / 30;
vlosEnvelope = exp(-delta_q ./ (50 + 18 * aperture));
vlos_gbsm = normalize_correlation(vlosEnvelope .* exp(1i * 2 * pi * spacing * delta_q .* risProjection));
vlos_bdcm = beam_domain_variant(vlos_gbsm, delta_q, 0.018);

combined_gbsm = combine_rician_links(nlos_gbsm, vlos_gbsm, cfg.geometry.K);
combined_bdcm = combine_rician_links(nlos_bdcm, vlos_bdcm, cfg.geometry.K);

result.axis = delta_q;
result.nlos_gbsm = safe_real01(nlos_gbsm);
result.nlos_bdcm = safe_real01(nlos_bdcm);
result.vlos_gbsm = safe_real01(vlos_gbsm);
result.vlos_bdcm = safe_real01(vlos_bdcm);
result.combined_gbsm = safe_real01(combined_gbsm);
result.combined_bdcm = safe_real01(combined_bdcm);
end
