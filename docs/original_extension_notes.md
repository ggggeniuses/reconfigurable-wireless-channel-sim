# Scenario Extension Notes

## Purpose

The Maritime UAV-Aerial-RIS-Shipborne-FAS module is developed as a scenario
extension based on the RIS-V2V and FAS-UAV modules.

It combines:

- RIS-assisted propagation and parameter sensitivity from the RIS-V2V module.
- Fluid antenna port correlation and selection gain from the FAS-UAV module.
- Maritime UAV-to-ship mobility and sea-surface-inspired NLoS scattering.

## Relationship to the Previous Modules

This module is not organized as an implementation of one specific paper. It
combines aerial RIS-assisted propagation, maritime scattering, and shipborne
FAS port selection to form a compact simulation scenario for UAV-to-ship
communication.

The experiments investigate:

- Link-distance impact on temporal ACF.
- Rician-factor impact on temporal ACF.
- Selectable-port impact on FAS capacity gain.
- Aerial RIS placement impact on temporal ACF.

## Current Limitations

This is a reproducible prototype for qualitative trend analysis. It is not
presented as a fully measurement-validated maritime channel model. Future work
should add measured maritime scattering parameters, sea-state-dependent
Doppler spread, RIS phase quantization, and end-to-end path-loss calibration.
