projectRoot = fileparts(fileparts(fileparts(mfilename('fullpath'))));
addpath(genpath(fullfile(projectRoot, 'src')));

cfg = default_fas_ship_config();
acf = zeros(numel(cfg.D0_list), numel(cfg.delta_t));
for k = 1:numel(cfg.D0_list)
    acf(k, :) = compute_maritime_acf(cfg, 'D0', cfg.D0_list(k), ...
        'K', 10, 'ris_center', cfg.ris_locations(1, :));
end

fig = create_paper_figure();
hold on;
markerIdx = paper_marker_indices(cfg.delta_t);
for k = 1:numel(cfg.D0_list)
    plot_paper_curve(cfg.delta_t, acf(k, :), k, markerIdx, ...
        'DisplayName', sprintf('$D_0=%g$ m', cfg.D0_list(k)));
end
xlabel('Time difference, $\Delta t$ [s]', 'Interpreter', 'latex');
ylabel('Temporal ACF', 'Interpreter', 'latex');
title('Temporal ACF under Different Link Distances');
ylim([0, 1]);
lgd = legend('Location', 'northeast', 'Interpreter', 'latex');
format_paper_legend(lgd);
apply_plot_style(gca);

data = struct('cfg', cfg, 'delta_t', cfg.delta_t, ...
    'D0_list', cfg.D0_list, 'acf', acf);
data.note = ['Maritime extension: qualitative temporal-correlation trends ', ...
    'under different UAV-to-ship link distances.'];
save_fas_ship_result(fig, data, 'acf_vs_distance', cfg);
