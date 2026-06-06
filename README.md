# RIS/FAS-Enabled Dynamic Channel Modeling Simulator

[中文说明](README_zh.md) | [English README](README.md)

This repository is a MATLAB simulation project for learning, organizing, and
experimenting with dynamic channel modeling methods in RIS/FAS-enabled wireless
communication systems.

## Project Scope

This repository develops a MATLAB research-engineering simulator for dynamic
channel modeling in RIS/FAS-enabled reconfigurable wireless systems.

The project is organized into three connected modules:

1. **RIS-V2V Beam-Domain Channel Statistics Module**

   Implements representative RIS-aided vehicular channel statistics,
   parameter sweeps, and beam-domain analysis.
2. **FAS-UAV Dynamic Port-Reconfigurable Channel Module**

   Implements FAS-assisted UAV channel simulations for active-port
   configuration, modeling error, mobility, and capacity analysis.
3. **Maritime UAV-Aerial-RIS-Shipborne-FAS Scenario Extension Module**

   Extends the previous RIS/FAS modeling components to a maritime UAV-to-ship
   scenario with aerial RIS-assisted propagation, sea-surface-inspired NLoS
   scattering, and shipborne FAS port selection.

## Module Overview

| Module | Scenario | Main focus | Role |
| --- | --- | --- | --- |
| RIS-V2V Beam-Domain Channel Statistics | RIS-aided vehicle-to-vehicle links | CCF, ACF, FCF, RIS parameters, mobility states | Reference-guided benchmark implementation and extension |
| FAS-UAV Dynamic Port-Reconfigurable Channel | UAV-to-ground links with fluid antenna ports | Modeling error, channel capacity, active ports, UAV motion | Literature-guided benchmark implementation and extension |
| Maritime UAV-Aerial-RIS-Shipborne-FAS | UAV-to-ship maritime communication | Distance, Rician factor, RIS location, FAS port selection | Scenario extension based on the previous modules |

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

## Run

Run the full project:

```matlab
run_all
```

Run tests:

```matlab
run_tests
```

Run individual modules:

```matlab
run_benchmarks
run_extensions
run_fas_uav
run_fas_ship
```

FAS modules use quick Monte Carlo profiles by default. For higher-sample runs:

```powershell
$env:FAS_UAV_PROFILE = "final"
$env:FAS_SHIP_PROFILE = "final"
matlab -batch "run_all"
matlab -batch "run_tests"
```

## Selected Results

### Module 1: RIS-V2V Channel Statistics

The module covers spatial CCF, temporal ACF, frequency FCF, RIS parameter
sweeps, mobility analysis, beam-domain sparsity, capacity invariance, and
complexity analysis.

![Spatial CCF](results/figures/spatial_ccf_model_baseline.png)

![Temporal ACF](results/figures/temporal_acf_model_baseline.png)

![Frequency FCF](results/figures/frequency_fcf_model_baseline.png)

![Beam-domain capacity](results/figures/ris_v2v/channel_capacity_gbsm_bdcm_extension.png)

### Module 2: FAS-UAV Dynamic Port Channel

The module evaluates modeling error, active-port and aperture effects, UAV
motion states, and FAS-versus-ULA capacity.

![Modeling error](results/figures/fas_uav/fas_uav_modeling_error.png)

![Capacity versus active ports](results/figures/fas_uav/fas_uav_capacity_vs_ports_w.png)

![Capacity under motion states](results/figures/fas_uav/fas_uav_capacity_vs_ports_motion.png)

![FAS versus ULA](results/figures/fas_uav/fas_uav_capacity_fas_vs_ula.png)

### Module 3: Maritime UAV-RIS-Shipborne-FAS Scenario Extension

The module studies temporal correlation under different link distances,
Rician factors, and aerial RIS locations, plus capacity gain from selectable
shipborne FAS ports.

![ACF vs distance](results/figures/fas_ship/acf_vs_distance.png)

![ACF vs Rician factor](results/figures/fas_ship/acf_vs_rician_factor.png)

![FAS selection gain](results/figures/fas_ship/fas_selection_gain.png)

![ACF vs RIS location](results/figures/fas_ship/acf_vs_ris_location.png)

## Validation

`run_tests` checks numerical finiteness, dimensions, fixed-seed determinism,
capacity invariance, FAS port validity, maritime ACF normalization, monotonic
selection performance, and the expected PNG/MAT output manifest.

## Scope Clarification

This project does not claim to propose all baseline channel models from
scratch. The RIS-V2V and FAS-UAV parts are implemented as literature-guided
benchmark models with engineering refactoring, validation, and parameter
extensions. The maritime UAV-RIS-shipborne-FAS module extends these modeling
components to a unified UAV-to-ship communication scenario.

## Documentation

- [Theory notes](docs/theory_notes.md)
- [Run guide](docs/benchmark_run_guide.md)
- [Model validation](docs/model_validation.md)
- [Figure interpretation](docs/figure_interpretation.md)
- [Cross-scenario comparison](docs/cross_scenario_comparison.md)
- [Literature map](docs/literature_map.md)
- [Maritime model notes](docs/fas_ship_model_notes.md)
- [Extension notes](docs/original_extension_notes.md)
- [Project overview and roadmap](docs/project_overview_and_roadmap.md)

## Research Basis

The simulator is developed from representative RIS/FAS dynamic channel
modeling literature. The RIS-V2V and FAS-UAV modules are reference-guided
benchmark simulations. The maritime module extends their modeling components
by integrating RIS-assisted propagation, shipborne FAS port selection, and
maritime scattering into a unified UAV-to-ship simulation scenario.

Source publications are listed in [CITATION.md](CITATION.md). Source papers,
exploratory scripts, and internal reference assets are not distributed in the
public repository.

## License

MIT License. See [LICENSE](LICENSE).
