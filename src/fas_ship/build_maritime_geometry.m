function geometry = build_maritime_geometry(cfg, varargin)
%BUILD_MARITIME_GEOMETRY Construct UAV, RIS, ship, and scatterer geometry.
parser = inputParser;
addParameter(parser, 'D0', cfg.reference_distance);
addParameter(parser, 'ris_center', cfg.ris_locations(1, :));
parse(parser, varargin{:});

geometry.uav = cfg.uav_position;
geometry.ship = cfg.ship_position;
direction = geometry.ship - geometry.uav;
direction = direction / max(norm(direction), eps);
geometry.ship = geometry.uav + parser.Results.D0 * direction;
geometry.ris_center = parser.Results.ris_center;
geometry.ris_positions = build_ris_positions(cfg, geometry.ris_center);
geometry.fas_ports = build_ship_fas_ports(cfg, geometry.ship);

rng(cfg.random_seed);
azimuth = 2 * pi * rand(cfg.num_scatterers, 1);
radius = cfg.scatter_radius * sqrt(rand(cfg.num_scatterers, 1));
height = 0.5 + 2.5 * rand(cfg.num_scatterers, 1);
geometry.scatterers = [ ...
    geometry.ship(1) + radius .* cos(azimuth), ...
    geometry.ship(2) + radius .* sin(azimuth), ...
    height];
end
