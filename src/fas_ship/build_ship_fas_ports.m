function port_pos = build_ship_fas_ports(cfg, ship_center)
%BUILD_SHIP_FAS_PORTS Generate a centered linear shipborne FAS aperture.
axisVector = cfg.port_axis(:).' / max(norm(cfg.port_axis), eps);
offset = ((0:cfg.Q_total - 1) - (cfg.Q_total - 1) / 2) * cfg.port_spacing;
port_pos = repmat(ship_center(:).', cfg.Q_total, 1) + offset(:) * axisVector;
end
