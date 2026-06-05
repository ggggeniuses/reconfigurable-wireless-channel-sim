function ensure_output_dirs(cfg)
%ENSURE_OUTPUT_DIRS Create results folders when needed.
if ~exist(cfg.output.figureDir, 'dir')
    mkdir(cfg.output.figureDir);
end
if ~exist(cfg.output.dataDir, 'dir')
    mkdir(cfg.output.dataDir);
end
end
