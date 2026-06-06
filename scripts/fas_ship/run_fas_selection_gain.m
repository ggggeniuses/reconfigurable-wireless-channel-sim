projectRoot = fileparts(fileparts(fileparts(mfilename('fullpath'))));
addpath(genpath(fullfile(projectRoot, 'src')));

cfg = default_fas_ship_config();
result = compute_fas_selection_gain(cfg);

fig = create_paper_figure();
markerIdx = paper_marker_indices(result.Qsub_list);
plot_paper_curve(result.Qsub_list, result.capacity_gain, 1, markerIdx, ...
    'DisplayName', sprintf('SNR = %g dB', result.snr_db));
xlabel('Number of selectable ports, $Q_{\mathrm{sub}}$', 'Interpreter', 'latex');
ylabel('Capacity gain [bit/s/Hz]', 'Interpreter', 'latex');
title('FAS Selection Gain versus Selectable Ports');
lgd = legend('Location', 'southeast', 'Interpreter', 'latex');
format_paper_legend(lgd);
apply_plot_style(gca);

data = result;
data.cfg = cfg;
data.note = ['Best-port selection over a correlated shipborne FAS aperture; ', ...
    'capacity gain is measured relative to one available port.'];
save_fas_ship_result(fig, data, 'fas_selection_gain', cfg);
