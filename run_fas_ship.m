projectRoot = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(projectRoot, 'src')));

fprintf('\n=== Maritime UAV-RIS-Shipborne-FAS Extension ===\n');
run(fullfile(projectRoot, 'scripts', 'fas_ship', 'run_acf_vs_distance.m'));
run(fullfile(projectRoot, 'scripts', 'fas_ship', 'run_acf_vs_rician_factor.m'));
run(fullfile(projectRoot, 'scripts', 'fas_ship', 'run_fas_selection_gain.m'));
run(fullfile(projectRoot, 'scripts', 'fas_ship', 'run_acf_vs_ris_location.m'));
fprintf('=== Maritime RIS-FAS extension completed. ===\n');
