function grid = angular_expectation_grid(cfg)
%ANGULAR_EXPECTATION_GRID Deterministic angular quadrature for NLoS terms.
%
% The paper uses von-Mises / truncated Gaussian angular spreads. For this
% reproducible project we use deterministic quadrature instead of Monte Carlo
% sampling so the generated figures are stable across MATLAB runs.
nAz = 121;
nEl = 81;
az = linspace(-pi, pi, nAz);
el = linspace(-pi/2, pi/2, nEl);
[AZ, EL] = meshgrid(az, el);

wAz = truncated_gaussian_pdf(az, cfg.cluster.mu_AAoA, cfg.cluster.sigma_AAoA);
wEl = truncated_gaussian_pdf(el, cfg.cluster.mu_EAoA, cfg.cluster.sigma_EAoA);
W = wEl(:) * wAz(:).';
W = W ./ sum(W, 'all');

grid.az = AZ;
grid.el = EL;
grid.weight = W;
end
