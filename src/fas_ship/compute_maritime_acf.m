function acf = compute_maritime_acf(cfg, varargin)
%COMPUTE_MARITIME_ACF Compact geometry-aware maritime temporal ACF model.
parser = inputParser;
addParameter(parser, 'D0', cfg.reference_distance);
addParameter(parser, 'K', 10);
addParameter(parser, 'ris_center', cfg.ris_locations(1, :));
parse(parser, varargin{:});

D0 = parser.Results.D0;
K = max(parser.Results.K, 0);
geometry = build_maritime_geometry(cfg, 'D0', D0, ...
    'ris_center', parser.Results.ris_center);

relativeVelocity = cfg.uav_velocity - cfg.ship_velocity;
uavToRis = geometry.ris_center - geometry.uav;
risToShip = geometry.ship - geometry.ris_center;
uavToRis = uavToRis / max(norm(uavToRis), eps);
risToShip = risToShip / max(norm(risToShip), eps);
projectedSpeed = abs(dot(relativeVelocity, uavToRis + risToShip));

distanceScale = min(max((D0 - min(cfg.D0_list)) / ...
    (cfg.reference_distance - min(cfg.D0_list)), 0), 1);
coherenceTime = 0.006 + 0.024 * distanceScale;
coherenceTime = coherenceTime * (1 + 0.22 * log10(1 + 10 * K));

locationRange = norm(geometry.uav - geometry.ris_center) + ...
    norm(geometry.ship - geometry.ris_center);
locationScale = locationRange / max(D0, eps);
effectiveFrequency = 20 + 18 * exp(-0.25 * projectedSpeed) + ...
    5 * min(locationScale, 2);

dt = cfg.delta_t;
risAcf = exp(-dt / coherenceTime) .* ...
    (0.25 + 0.75 * cos(2 * pi * effectiveFrequency * dt) .^ 2);
clusterTime = max(0.55 * coherenceTime / (1 + 0.08 * projectedSpeed), 1e-4);
clusterAcf = exp(-dt / clusterTime);

risPower = abs(compute_ris_path_response(cfg, geometry)) ^ 2;
clusterPower = abs(compute_cluster_path_response(cfg, geometry)) ^ 2;
geometryWeight = risPower / max(risPower + clusterPower, eps);
ricianWeight = K / (K + 1);
risWeight = min(max(0.5 * ricianWeight + 0.5 * geometryWeight, 0), 1);

acf = risWeight * risAcf + (1 - risWeight) * clusterAcf;
acf = real(acf / max(acf(1), eps));
acf = min(max(acf, 0), 1);
assert_numeric_finite(acf, 'Maritime temporal ACF');
end
