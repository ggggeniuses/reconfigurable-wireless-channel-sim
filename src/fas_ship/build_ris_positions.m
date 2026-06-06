function ris_pos = build_ris_positions(cfg, ris_center)
%BUILD_RIS_POSITIONS Generate a rectangular aerial RIS in the x-z plane.
xOffset = ((0:cfg.Mx - 1) - (cfg.Mx - 1) / 2) * cfg.dmx;
zOffset = ((0:cfg.Mz - 1) - (cfg.Mz - 1) / 2) * cfg.dmz;
[xGrid, zGrid] = ndgrid(xOffset, zOffset);
ris_pos = repmat(ris_center(:).', numel(xGrid), 1);
ris_pos(:, 1) = ris_pos(:, 1) + xGrid(:);
ris_pos(:, 3) = ris_pos(:, 3) + zGrid(:);
end
