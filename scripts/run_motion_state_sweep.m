projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(genpath(fullfile(projectRoot, 'src')));

cfg = default_ris_v2v_config();
ensure_output_dirs(cfg);

motionStates = [5 5; 10 10; 20 10; 30 20];
labels = {'$v_T=5,v_R=5$', '$v_T=10,v_R=10$', '$v_T=20,v_R=10$', '$v_T=30,v_R=20$'};
curves = zeros(numel(cfg.axis.delta_t), size(motionStates, 1));

for k = 1:size(motionStates, 1)
    cfgK = cfg;
    cfgK.motion.vT = motionStates(k, 1);
    cfgK.motion.vR = motionStates(k, 2);
    resultK = compute_temporal_acf(cfgK);
    assert_no_invalid_values(resultK, sprintf('motion sweep %d', k));
    curves(:, k) = resultK.combined_bdcm(:);
end

fig = figure('Color', 'w', 'Position', [100, 100, 760, 560]);
hold on;
styles = {'k-', 'b--', 'm-.', 'r:'};
for k = 1:size(motionStates, 1)
    plot(cfg.axis.delta_t, curves(:, k), styles{k}, 'LineWidth', 1.65, ...
        'DisplayName', labels{k});
end
xlabel('Time difference, $\Delta t$, [s]', 'Interpreter', 'latex');
ylabel('Temporal ACFs', 'Interpreter', 'latex');
title('Mobility-state impact on temporal ACFs of BDCM');
xlim([0, 0.02]);
ylim([0, 1.03]);
legend('Location', 'northeast', 'Interpreter', 'latex', 'FontSize', 10);
apply_plot_style(gca);

data = struct('cfg', cfg, 'motionStates', motionStates, 'delta_t', cfg.axis.delta_t, ...
    'curves', curves, 'note', ['Extension experiment using the project compact model. ', ...
    'It studies qualitative mobility impact beyond the strict STF-CF reproduction.']);
save_experiment_outputs(fig, cfg, 'motion_state_sweep_temporal_acf_extension', data);
