# Literature Map and Research Workflow

## Implemented Benchmark Modules

### RIS-V2V Beam-Domain Channel Statistics

Role:

- Provides a RIS-assisted vehicular dynamic-channel baseline.
- Supports spatial CCF, temporal ACF, frequency FCF, RIS parameter sweeps,
  mobility analysis, capacity invariance, and beam-domain sparsity analysis.

### FAS-UAV Dynamic Port-Reconfigurable Channel

Role:

- Provides a FAS-assisted UAV dynamic-port baseline.
- Supports modeling error, capacity, active-port, aperture, and UAV-motion
  analysis.

## Student-Designed Integrated Extension

### Maritime UAV-RIS-Shipborne-FAS

Role:

- Combines RIS-assisted propagation, FAS port selection, UAV mobility, and
  sea-surface-inspired maritime scattering.
- Studies temporal ACF sensitivity to distance, Rician factor, and aerial RIS
  location, plus capacity gain from selectable shipborne FAS ports.
- Serves as the main integrated extension of this repository.

## Reference-Only Literature

### RIS-FAS Air-Ground Channel Modeling

Used as background for joint RIS/FAS propagation and reconfigurable-port
modeling.

### RIS-Empowered UAV-to-Ship Maritime Channel Modeling

Used as background for maritime geometry, mobility, and UAV-to-ship scenario
design.

## Research Workflow

1. Implement representative channel-statistics and capacity baselines.
2. Refactor experiments into reusable MATLAB functions and repeatable scripts.
3. Add parameter extensions and automated numerical checks.
4. Integrate RIS, FAS, UAV mobility, and maritime scattering in a new scenario.
5. Treat the current maritime results as qualitative trends pending
   measurement-based calibration.
