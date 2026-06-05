clearvars -except projectRoot; close all;

if ~exist('projectRoot', 'var') || isempty(projectRoot)
    projectRoot = fileparts(mfilename('fullpath'));
end
addpath(genpath(fullfile(projectRoot, 'src')));

fprintf('\n[1/2] Running strict reproduction scripts...\n');
run(fullfile(projectRoot, 'scripts', 'run_spatial_ccf.m'));
run(fullfile(projectRoot, 'scripts', 'run_temporal_acf.m'));
run(fullfile(projectRoot, 'scripts', 'run_frequency_fcf.m'));
