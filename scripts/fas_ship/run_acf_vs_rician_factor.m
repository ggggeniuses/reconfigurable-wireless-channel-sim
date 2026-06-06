projectRoot = fileparts(fileparts(fileparts(mfilename('fullpath'))));
addpath(genpath(fullfile(projectRoot, 'src')));

cfg = default_fas_ship_config();
acf = zeros(numel(cfg.K_list), numel(cfg.delta_t));
for k = 1:numel(cfg.K_list)
    acf(k, :) = compute_maritime_acf(cfg, 'D0', cfg.reference_distance, ...
        'K', cfg.K_list(k), 'ris_center', cfg.ris_locations(1, :));
end

fig = create_paper_figure();
hold on;
markerIdx = paper_marker_indices(cfg.delta_t);
for k = 1:numel(cfg.K_list)
    plot_paper_curve(cfg.delta_t, acf(k, :), k, markerIdx, ...
        'DisplayName', sprintf('$K=%g$', cfg.K_list(k)));
end
xlabel('Time difference, $\Delta t$ [s]', 'Interpreter', 'latex');
ylabel('Temporal ACF', 'Interpreter', 'latex');
title('Temporal ACF under Different Rician Factors');
ylim([0, 1]);
lgd = legend('Location', 'northeast', 'Interpreter', 'latex');
format_paper_legend(lgd);
apply_plot_style(gca);

data = struct('cfg', cfg, 'delta_t', cfg.delta_t, ...
    'K_list', cfg.K_list, 'acf', acf);
data.note = ['Maritime extension: Rician weighting combines the coherent ', ...
    'RIS-assisted path and sea-surface-inspired clustered paths.'];
save_fas_ship_result(fig, data, 'acf_vs_rician_factor', cfg);
