function response = compute_ris_path_response(cfg, geometry)
%COMPUTE_RIS_PATH_RESPONSE Coherently combined cascaded UAV-RIS-ship path.
ris = geometry.ris_positions;
dTx = vecnorm(ris - geometry.uav, 2, 2);
dRx = vecnorm(ris - geometry.ship, 2, 2);
k0 = 2 * pi / cfg.lambda;
amplitude = 1 ./ sqrt((dTx .^ cfg.pathloss_exponent) .* ...
    (dRx .^ cfg.pathloss_exponent) + eps);
elementResponse = amplitude .* exp(-1j * k0 * (dTx + dRx));
phaseAlignment = exp(-1j * angle(elementResponse));
response = sum(elementResponse .* phaseAlignment);
end
