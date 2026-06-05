projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(genpath(fullfile(projectRoot, 'src')));

cfg = default_ris_v2v_config();
ensure_output_dirs(cfg);

risSizes = [10, 20, 30, 40];
curves = zeros(numel(cfg.axis.delta_t), numel(risSizes));

for k = 1:numel(risSizes)
    cfgK = cfg;
    cfgK.ris.Mx = risSizes(k);
    cfgK.ris.Mz = risSizes(k);
    resultK = compute_temporal_acf(cfgK);
    assert_no_invalid_values(resultK, sprintf('RIS sweep M=%d', risSizes(k)));
    curves(:, k) = resultK.combined_bdcm(:);
end

fig = figure('Color', 'w', 'Position', [100, 100, 760, 560]);
hold on;
styles = {'k-', 'b--', 'm-.', 'r:'};
for k = 1:numel(risSizes)
    plot(cfg.axis.delta_t, curves(:, k), styles{k}, 'LineWidth', 1.65, ...
        'DisplayName', sprintf('$M_x=M_z=%d$', risSizes(k)));
end
xlabel('Time difference, $\Delta t$, [s]', 'Interpreter', 'latex');
ylabel('Temporal ACFs', 'Interpreter', 'latex');
title('RIS size impact on temporal ACFs of BDCM');
xlim([0, 0.02]);
ylim([0, 1.03]);
legend('Location', 'northeast', 'Interpreter', 'latex', 'FontSize', 10);
apply_plot_style(gca);

data = struct('cfg', cfg, 'risSizes', risSizes, 'delta_t', cfg.axis.delta_t, 'curves', curves);
data.note = ['Extension experiment using the project compact model. ', ...
    'The original STF-CF RIS rho-functions hard-code Mx=Mz=30 internally, ', ...
    'so strict RIS-size sweeping is kept separate from the original-code reproduction.'];
save_experiment_outputs(fig, cfg, 'ris_parameter_sweep_temporal_acf_extension', data);
