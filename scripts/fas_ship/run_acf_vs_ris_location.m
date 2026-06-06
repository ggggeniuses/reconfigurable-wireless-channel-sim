projectRoot = fileparts(fileparts(fileparts(mfilename('fullpath'))));
addpath(genpath(fullfile(projectRoot, 'src')));

cfg = default_fas_ship_config();
numLocations = size(cfg.ris_locations, 1);
acf = zeros(numLocations, numel(cfg.delta_t));
for k = 1:numLocations
    acf(k, :) = compute_maritime_acf(cfg, 'D0', cfg.reference_distance, ...
        'K', 10, 'ris_center', cfg.ris_locations(k, :));
end

fig = create_paper_figure();
hold on;
markerIdx = paper_marker_indices(cfg.delta_t);
for k = 1:numLocations
    location = cfg.ris_locations(k, :);
    plot_paper_curve(cfg.delta_t, acf(k, :), k, markerIdx, ...
        'DisplayName', sprintf('$(%g,%g,%g)$ m', location));
end
xlabel('Time difference, $\Delta t$ [s]', 'Interpreter', 'latex');
ylabel('Temporal ACF', 'Interpreter', 'latex');
title('Temporal ACF under Different Aerial RIS Locations');
ylim([0, 1]);
lgd = legend('Location', 'northeast', 'Interpreter', 'latex');
format_paper_legend(lgd);
apply_plot_style(gca);

data = struct('cfg', cfg, 'delta_t', cfg.delta_t, ...
    'ris_locations', cfg.ris_locations, 'acf', acf);
data.note = ['Maritime extension: RIS location changes cascaded geometry, ', ...
    'path balance, and projected mobility.'];
save_fas_ship_result(fig, data, 'acf_vs_ris_location', cfg);
