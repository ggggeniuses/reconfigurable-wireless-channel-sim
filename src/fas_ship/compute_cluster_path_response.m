function response = compute_cluster_path_response(cfg, geometry)
%COMPUTE_CLUSTER_PATH_RESPONSE Aggregate sea-surface-inspired NLoS paths.
scatterers = geometry.scatterers;
dTx = vecnorm(scatterers - geometry.uav, 2, 2);
dRx = vecnorm(scatterers - geometry.ship, 2, 2);
k0 = 2 * pi / cfg.lambda;
amplitude = 1 ./ sqrt((dTx .^ cfg.pathloss_exponent) .* ...
    (dRx .^ cfg.pathloss_exponent) + eps);
rng(cfg.random_seed + 1);
randomPhase = exp(1j * 2 * pi * rand(size(dTx)));
response = sum(amplitude .* exp(-1j * k0 * (dTx + dRx)) .* randomPhase);
response = response / sqrt(max(numel(dTx), 1));
end
