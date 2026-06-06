function H = generate_correlated_fas_channel(cfg, Qsub, num_realizations)
%GENERATE_CORRELATED_FAS_CHANNEL Generate correlated Rician FAS port gains.
if nargin < 3
    num_realizations = cfg.num_realizations;
end
assert(Qsub >= 1 && Qsub <= cfg.Q_total, 'Qsub must be in [1, Q_total].');

rho = exp(-cfg.port_correlation_scale * cfg.port_spacing / cfg.lambda);
R = toeplitz(rho .^ (0:Qsub - 1));
R = (R + R') / 2 + 1e-12 * eye(Qsub);
L = chol(R, 'lower');

rng(cfg.random_seed);
G = (randn(num_realizations, Qsub) + ...
    1j * randn(num_realizations, Qsub)) / sqrt(2);
scatter = G * L.';
K = 10;
phase = exp(1j * 2 * pi * (0:Qsub - 1) * cfg.port_spacing / cfg.lambda);
H = sqrt(K / (K + 1)) * repmat(phase, num_realizations, 1) + ...
    sqrt(1 / (K + 1)) * scatter;
assert_numeric_finite(H, 'Correlated FAS channel');
end
