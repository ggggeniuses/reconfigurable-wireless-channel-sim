function cfg = default_fas_ship_config()
%DEFAULT_FAS_SHIP_CONFIG Parameters for the maritime RIS-FAS extension.
cfg.c = 3e8;
cfg.fc = 5e9;
cfg.lambda = cfg.c / cfg.fc;

cfg.delta_t = linspace(0, 0.04, 201);
cfg.D0_list = [30, 50, 100, 150, 300];
cfg.K_list = [0.03, 0.3, 3, 30];
cfg.reference_distance = 150;

cfg.Q_total = 20;
cfg.Qsub_list = [1, 2, 4, 6, 8, 10, 12, 16, 20];
cfg.W = 4;
cfg.port_spacing = cfg.W * cfg.lambda / max(cfg.Q_total - 1, 1);
cfg.port_axis = [0, 1, 0];
cfg.port_correlation_scale = 0.85;

cfg.Mx = 40;
cfg.Mz = 20;
cfg.dmx = cfg.lambda / 4;
cfg.dmz = cfg.lambda / 4;
cfg.ris_locations = [
    30, 25, 30;
    30, 50, 30;
    90, 50, 30;
    30, 100, 30;
    60, 150, 30
];

cfg.uav_position = [0, 0, 120];
cfg.ship_position = [150, 0, 5];
cfg.uav_velocity = [5, -5, -2];
cfg.ship_velocity = [8, 4, 0];

cfg.num_scatterers = 64;
cfg.scatter_radius = 45;
cfg.random_seed = 7;
cfg.num_realizations = 300;
cfg.snr_db = 10;
cfg.pathloss_exponent = 2.0;

profile = lower(strtrim(getenv('FAS_SHIP_PROFILE')));
if isempty(profile)
    profile = 'quick';
end
cfg.profile = profile;
switch profile
    case 'final'
        cfg.num_realizations = 3000;
    case 'calibration'
        cfg.num_realizations = 1000;
    otherwise
        cfg.profile = 'quick';
        cfg.num_realizations = 300;
end

cfg.output.figureDir = fullfile(project_root(), 'results', 'figures', 'fas_ship');
cfg.output.dataDir = fullfile(project_root(), 'results', 'data', 'fas_ship');
end
