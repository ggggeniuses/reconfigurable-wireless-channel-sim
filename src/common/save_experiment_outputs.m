function save_experiment_outputs(fig, cfg, stem, data)
%SAVE_EXPERIMENT_OUTPUTS Save a figure as FIG/PNG and matching MAT data.
ensure_output_dirs(cfg);
figPath = fullfile(cfg.output.figureDir, [stem, '.fig']);
pngPath = fullfile(cfg.output.figureDir, [stem, '.png']);
matPath = fullfile(cfg.output.dataDir, [stem, '.mat']);

savefig(fig, figPath);
exportgraphics(fig, pngPath, 'Resolution', 220);
save(matPath, '-struct', 'data');
fprintf('Saved %s\n', pngPath);
end
