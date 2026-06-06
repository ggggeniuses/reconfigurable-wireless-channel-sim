# Project Overview and Roadmap

## Positioning

This repository is a MATLAB engineering platform for dynamic channel modeling,
propagation statistics, and capacity analysis in reconfigurable wireless
systems. It covers RIS-enabled V2V, FAS-assisted UAV, and an integrated
maritime UAV-RIS-shipborne-FAS scenario.

## Implemented

### RIS-V2V

- Spatial, temporal, and frequency correlation baselines.
- RIS size, RIS spacing, and vehicle-motion sweeps.
- Array/beam-domain capacity invariance.
- Beam-domain sparsity metrics.
- Full-model and sparsity-aware complexity accounting.

### FAS-UAV

- Dynamic LoS/NLoS channel generation.
- Active-port selection.
- Modeling-error analysis.
- Aperture and motion-state capacity analysis.
- FAS and ULA capacity comparison.
- Reproducible Monte Carlo profiles.

### Maritime UAV-RIS-Shipborne-FAS

- Three-dimensional UAV, aerial RIS, and shipborne FAS geometry.
- Coherent cascaded RIS path and sea-surface-inspired clustered NLoS path.
- Temporal ACF sweeps over distance, Rician factor, and RIS location.
- Correlated FAS port selection and capacity-gain analysis.
- Independent experiment entry point and numerical tests.

## Engineering Structure

- `src/`: reusable model and metric functions.
- `scripts/`: experiment definitions.
- `tests/`: numerical and output validation.
- `results/`: generated figures and MAT data.
- `docs/`: theory, interpretation, and run guidance.

## Next Development

1. Add automated MATLAB CI on a self-hosted or licensed runner.
2. Add parameter files for repeatable experiment presets.
3. Export summary metrics to CSV for easier comparison.
4. Calibrate maritime scattering and Doppler parameters against measurements.
5. Add no-RIS, fixed-antenna, and hardware-constrained RIS baselines.
6. Add channel-estimation or learning-based prediction as a separate module.

## Suggested GitHub Metadata

Description:

```text
MATLAB simulator for RIS/FAS-enabled dynamic channels, including RIS-V2V statistics, FAS-UAV capacity analysis, and a maritime UAV-RIS-shipborne-FAS extension.
```

Topics:

```text
matlab wireless-communications channel-modeling ris fluid-antenna-system
v2v uav-communications maritime-communications beam-domain gbsm bdcm 6g
```
