# Maritime UAV-Aerial-RIS-Shipborne-FAS Model Notes

## 1. Scenario

A mobile UAV transmitter communicates with a shipborne FAS receiver. An aerial
rectangular RIS provides a coherent cascaded path, while distributed scatterers
near the sea surface provide a compact NLoS component.

## 2. Geometry

- UAV, ship, and RIS use three-dimensional Cartesian coordinates.
- The UAV and ship have independent velocity vectors.
- The RIS is a rectangular array in the x-z plane.
- The shipborne FAS is a centered linear aperture with correlated ports.

## 3. Link Components

### Aerial RIS-Assisted Cascaded Path

The RIS path uses element-wise UAV-RIS and RIS-ship distances, free-space phase,
distance-dependent amplitude, and ideal phase alignment. The clustered path
aggregates randomly phased two-hop contributions through sea-surface-inspired
scatterers.

### Maritime NLoS Cluster Path

The clustered path uses distributed, randomly phased two-hop contributions
through scatterers placed near the sea surface. A Rician factor and
geometry-derived path balance mix the cascaded and clustered ACF components.

## 4. Temporal ACF

The first version uses a compact nonnegative trend model. Its coherence time
depends on link distance and Rician factor. Its oscillation rate depends on
relative motion projected onto the cascaded geometry. This makes distance,
Rician factor, and RIS placement produce interpretable curve changes while
keeping the ACF normalized and finite.

## 5. Shipborne FAS Port Selection

Ports follow an exponential spatial-correlation matrix. For each realization,
the receiver chooses the strongest instantaneous port among the available
subset. Capacity gain is reported relative to a single selectable port.

## 6. Simulated Metrics and Experiments

- ACF versus link distance.
- ACF versus Rician factor.
- Capacity gain versus selectable FAS ports.
- ACF versus aerial RIS location.

## 7. Limitations and Future Work

The model currently targets qualitative trends. Planned improvements include
measurement-calibrated sea-state parameters, time-evolving scatterers, hardware
phase constraints, path-loss calibration, outage probability, and comparison
against no-RIS and fixed-antenna baselines.
