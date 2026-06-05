projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(genpath(fullfile(projectRoot, 'src')));

cfg = default_ris_v2v_config();
cfg.axis.delta_t = 0:0.001:0.2;
ensure_output_dirs(cfg);

spacingList = [cfg.lambda/8, cfg.lambda/4, cfg.lambda/2, cfg.lambda];
labels = {'$\lambda/8$', '$\lambda/4$', '$\lambda/2$', '$\lambda$'};
curves = zeros(numel(cfg.axis.delta_t), numel(spacingList));

for k = 1:numel(spacingList)
    cfgK = cfg;
    cfgK.ris.dmx = spacingList(k);
    cfgK.ris.dmz = spacingList(k);
    resultK = compute_temporal_acf(cfgK);
    assert_no_invalid_values(resultK, sprintf('RIS spacing sweep %g', spacingList(k)));
    curves(:, k) = resultK.vlos_bdcm(:);
end

fig = figure('Color', 'w', 'Position', [100, 100, 760, 560]);
hold on;
styles = {'k-', 'b--', 'm-.', 'r:'};
for k = 1:numel(spacingList)
    plot(cfg.axis.delta_t, curves(:, k), styles{k}, 'LineWidth', 1.65, ...
        'DisplayName', labels{k});
end
xlabel('Time difference, $\Delta t$, [s]', 'Interpreter', 'latex');
ylabel('Temporal ACFs', 'Interpreter', 'latex');
title('RIS element spacing impact on RIS-assisted VLoS temporal ACFs');
xlim([0, 0.2]);
ylim([0.55, 1.01]);
legend('Location', 'northeast', 'Interpreter', 'latex', 'FontSize', 10);
apply_plot_style(gca);

data = struct('cfg', cfg, 'spacingList', spacingList, 'delta_t', cfg.axis.delta_t, ...
    'curves', curves, 'note', ['Extension experiment using the project RIS-array geometry model. ', ...
    'Strict STF-CF reproduction is kept in the *_strict outputs. ', ...
    'The plotted curves isolate the RIS-assisted VLoS component.']);
save_experiment_outputs(fig, cfg, 'ris_spacing_sweep_temporal_acf_extension', data);
