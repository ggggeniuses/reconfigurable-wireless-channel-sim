clear; clc; close all;

projectRoot = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(projectRoot, 'src')));

fprintf('RIS-V2V beam-domain channel simulation\n');
fprintf('Project root: %s\n', projectRoot);
fprintf('Strict CCF/ACF/FCF scripts call vendor/original_stf_cf functions.\n');

run(fullfile(projectRoot, 'run_reproduction.m'));
run(fullfile(projectRoot, 'run_extensions.m'));
run(fullfile(projectRoot, 'scripts', 'run_smoke_checks.m'));

fprintf('\nAll experiments finished. Figures: %s\n', fullfile(projectRoot, 'results', 'figures'));
fprintf('Data files: %s\n', fullfile(projectRoot, 'results', 'data'));
