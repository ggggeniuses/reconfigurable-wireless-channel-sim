clearvars -except projectRoot; close all;

if ~exist('projectRoot', 'var') || isempty(projectRoot)
    projectRoot = fileparts(mfilename('fullpath'));
end
addpath(genpath(fullfile(projectRoot, 'src')));

fprintf('\n[2/2] Running extension experiments...\n');
run(fullfile(projectRoot, 'scripts', 'run_ris_parameter_sweep.m'));
run(fullfile(projectRoot, 'scripts', 'run_ris_spacing_sweep.m'));
run(fullfile(projectRoot, 'scripts', 'run_motion_state_sweep.m'));
