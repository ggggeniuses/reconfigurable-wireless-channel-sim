# Literature Map

## Implemented Benchmark Models

### RIS-V2V Beam-Domain Channel Statistics

Role in this project:

- Provides the RIS-aided V2V baseline channel-statistics framework.
- Supports CCF, ACF, FCF, RIS-parameter sweeps, beam-domain sparsity, capacity
  invariance, and complexity analysis.
- Implemented as a reference-guided benchmark model with engineering
  refactoring and parameter extensions.

### FAS-UAV Dynamic Port-Reconfigurable Channel

Role in this project:

- Provides the FAS-assisted UAV benchmark channel framework.
- Supports active-port, aperture, port-spacing, motion-state, modeling-error,
  and capacity analysis.
- Implemented as a literature-guided benchmark model with reusable simulation
  and validation pipelines.

## Reference-Only Background Papers

### RIS-FAS Air-Ground Channel Modeling

Role:

- Supports the motivation for joint RIS/FAS modeling.
- Not implemented as a separate code module in the current repository.

### RIS-UAV-to-Ship Maritime Channel Modeling

Role:

- Supports the maritime UAV-to-ship scenario motivation.
- Not implemented as a separate code module in the current repository.

## Maritime UAV-RIS-Shipborne-FAS Scenario Extension

This module extends the modeling ideas used in the RIS-V2V and FAS-UAV modules
to a maritime UAV-to-ship communication scenario.

Role:

- Combines RIS-assisted propagation, maritime NLoS scattering, UAV/ship
  mobility, and shipborne FAS port selection.
- Supports temporal ACF sweeps over distance, Rician factor, and RIS location,
  plus FAS selection-gain analysis.
- Treated as a scenario extension built from the previous RIS/FAS modeling
  components rather than as a direct implementation of one reference paper.

## Research Workflow

1. Implement representative RIS/FAS benchmark channel models.
2. Refactor the experiments into reusable MATLAB functions and scripts.
3. Add parameter extensions, generated outputs, and automated checks.
4. Integrate the previous modeling ideas in a maritime UAV-to-ship scenario.
5. Preserve measurement calibration and hardware constraints as future work.
