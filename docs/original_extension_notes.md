# Original Extension Notes

## Purpose

The Maritime UAV-RIS-Shipborne-FAS module is an integrated extension of the
existing RIS/FAS dynamic channel modeling platform.

It combines:

- RIS-assisted propagation and parameter sensitivity from the RIS-V2V module.
- Fluid antenna port correlation and selection gain from the FAS-UAV module.
- Maritime UAV-to-ship mobility and sea-surface-inspired NLoS scattering.

## What Is New in This Module

Unlike the two benchmark modules, this module is not organized as an
implementation of one specific paper. It defines a simulation scenario where a
UAV communicates with a shipborne FAS receiver through an aerial RIS and
clustered maritime scattering.

The experiments investigate:

- Link-distance impact on temporal ACF.
- Rician-factor impact on temporal ACF.
- Selectable-port impact on FAS capacity gain.
- Aerial RIS placement impact on temporal ACF.

## Current Limitations

This is a compact prototype for qualitative trend analysis. It is not validated
by field measurements. Future work should add measured maritime scattering
parameters, sea-state-dependent Doppler spread, RIS phase quantization, and
end-to-end path-loss calibration.
