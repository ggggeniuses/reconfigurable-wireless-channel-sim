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

## Student-Designed Integrated Extension

### Maritime UAV-Aerial-RIS-Shipborne-FAS

Role:

- Combines RIS-assisted propagation, maritime NLoS scattering, UAV/ship
  mobility, and shipborne FAS port selection.
- Supports temporal ACF sweeps over distance, Rician factor, and RIS location,
  plus FAS selection-gain analysis.
- Implemented as an integrated extension rather than a direct paper-code
  implementation.

## Research Workflow

1. Implement representative RIS/FAS benchmark channel models.
2. Refactor the experiments into reusable MATLAB functions and scripts.
3. Add parameter extensions, generated outputs, and automated checks.
4. Integrate the previous modeling ideas in a maritime UAV-to-ship scenario.
5. Preserve measurement calibration and hardware constraints as future work.
