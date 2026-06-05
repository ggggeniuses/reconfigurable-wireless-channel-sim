# Reproduction Guide

## Run Everything

From MATLAB, open the project root and run:

```matlab
run_all
```

This runs strict reproduction, extension experiments, and smoke checks.

## Strict Reproduction Only

```matlab
run_reproduction
```

Generated files:

- `results/figures/spatial_ccf_gbsm_bdcm_strict.png`
- `results/figures/temporal_acf_gbsm_bdcm_strict.png`
- `results/figures/frequency_fcf_gbsm_bdcm_strict.png`
- matching `.fig` and `.mat` files

The scripts call `vendor/original_stf_cf/**/rho_*.m` directly.

## Extension Experiments

```matlab
run_extensions
```

Generated files:

- `ris_parameter_sweep_temporal_acf_extension`
- `ris_spacing_sweep_temporal_acf_extension`
- `motion_state_sweep_temporal_acf_extension`

These are not claimed as direct paper-figure reproductions. They show how the
modeling framework can be used for additional analysis.

## Smoke Checks

```matlab
run scripts/run_smoke_checks.m
```

The smoke checks verify that expected `.mat` outputs exist and contain finite
non-empty arrays.

## Expected Runtime

The current project runs in under one minute on the tested Windows MATLAB
environment.
