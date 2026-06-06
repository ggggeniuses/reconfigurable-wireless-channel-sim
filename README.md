# RIS/FAS-Enabled Dynamic Channel Modeling and Maritime Extension Simulator

MATLAB research-engineering simulator for dynamic channel modeling in
RIS/FAS-enabled reconfigurable wireless systems. It covers RIS-V2V beam-domain
statistics, FAS-UAV dynamic port analysis, and a student-designed maritime
UAV-RIS-shipborne-FAS extension.

## Module Overview

| Module | Scenario | Main focus | Role |
| --- | --- | --- | --- |
| RIS-V2V Beam-Domain Channel Statistics | RIS-aided vehicle-to-vehicle links | CCF, ACF, FCF, RIS parameters, mobility states | Benchmark model implementation and extension |
| FAS-UAV Dynamic Port-Reconfigurable Channel | UAV-to-ground links with fluid antenna ports | Modeling error, channel capacity, active ports, UAV motion | Benchmark model implementation and extension |
| Maritime UAV-RIS-Shipborne-FAS Extension | UAV-to-ship maritime communication | Distance, Rician factor, RIS location, FAS port selection | Student-designed integrated extension |

## Repository Layout

```text
.
|-- run_all.m
|-- run_benchmarks.m
|-- run_extensions.m
|-- run_fas_uav.m
|-- run_fas_ship.m
|-- run_tests.m
|-- scripts/
|   |-- fas_uav/
|   |-- fas_ship/
|-- src/
|   |-- common/
|   |-- fas_uav/
|   |-- fas_ship/
|   |-- ris_v2v/
|-- tests/
|-- results/
|   |-- figures/
|   |-- data/
|-- docs/
```

## Requirements

- MATLAB R2024b or a compatible recent MATLAB release.
- No additional MATLAB toolbox is required by the project code.

## Quick Start

From the repository root:

```matlab
run_all
run_tests
```

Run individual modules:

```matlab
run_benchmarks
run_extensions
run_fas_uav
run_fas_ship
```

FAS modules use quick Monte Carlo profiles by default. For final-quality runs:

```powershell
$env:FAS_UAV_PROFILE = "final"
$env:FAS_SHIP_PROFILE = "final"
matlab -batch "run_all"
matlab -batch "run_tests"
```

## Selected Results

### RIS-V2V Correlation and Beam-Domain Analysis

![Spatial CCF](results/figures/spatial_ccf_model_baseline.png)

![Temporal ACF](results/figures/temporal_acf_model_baseline.png)

![Capacity](results/figures/ris_v2v/channel_capacity_gbsm_bdcm_extension.png)

### FAS-UAV Dynamic Port Analysis

![Modeling error](results/figures/fas_uav/fas_uav_modeling_error.png)

![FAS versus ULA](results/figures/fas_uav/fas_uav_capacity_fas_vs_ula.png)

## Maritime UAV-RIS-Shipborne-FAS Extension

This module combines UAV mobility, aerial RIS-assisted cascaded propagation,
sea-surface-inspired NLoS scattering, and shipborne FAS port selection.

### Temporal ACF under Different Link Distances

![ACF vs Distance](results/figures/fas_ship/acf_vs_distance.png)

### Temporal ACF under Different Rician Factors

![ACF vs Rician Factor](results/figures/fas_ship/acf_vs_rician_factor.png)

### FAS Selection Gain

![FAS Selection Gain](results/figures/fas_ship/fas_selection_gain.png)

### Temporal ACF under Different RIS Locations

![ACF vs RIS Location](results/figures/fas_ship/acf_vs_ris_location.png)

## Validation

`run_tests` checks numerical finiteness, dimensions, deterministic behavior,
capacity invariance, FAS port validity, maritime ACF normalization, monotonic
selection performance, and the expected output manifest.

## Scope Clarification

This project does not claim that every module proposes a measurement-validated
channel model from scratch. Its goal is to implement, organize, validate, and
extend representative RIS/FAS dynamic channel modeling ideas into reusable
MATLAB simulation pipelines. The maritime module is a compact, student-designed
prototype for qualitative trend analysis and is not yet calibrated against
field measurements.

## Documentation

- [Theory notes](docs/theory_notes.md)
- [Run guide](docs/benchmark_run_guide.md)
- [Model validation](docs/model_validation.md)
- [Cross-scenario comparison](docs/cross_scenario_comparison.md)
- [Literature map](docs/literature_map.md)
- [Maritime model notes](docs/fas_ship_model_notes.md)
- [Original extension notes](docs/original_extension_notes.md)
- [Resume description](docs/resume_description.md)

## Research Basis

The benchmark modules are informed by the publications listed in
[CITATION.md](CITATION.md). The public repository distributes project code and
generated results only; source papers and internal reference assets remain
local.

## License

MIT License. See [LICENSE](LICENSE).
