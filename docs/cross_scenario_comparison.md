# Cross-Scenario Comparison

| Aspect | RIS-V2V | FAS-UAV | Maritime UAV-RIS-Shipborne-FAS |
| --- | --- | --- | --- |
| Reconfigurable technology | RIS | FAS | RIS + FAS |
| Scenario | Vehicle-to-vehicle | UAV-to-ground | UAV-to-ship maritime communication |
| Main model role | Beam-domain channel statistics | Dynamic port-reconfigurable channel | Integrated maritime extension |
| Main metrics | CCF, ACF, FCF, capacity, sparsity | Modeling error, capacity | Temporal ACF, FAS selection gain |
| Key parameters | RIS size, spacing, mobility state | Active ports, port spacing, aperture, UAV motion | Link distance, Rician factor, RIS location, selectable ports |
| Project role | Benchmark implementation | Benchmark implementation | Scenario extension based on previous modules |

The three modules form a staged research-engineering project:

1. Implement and validate RIS-assisted dynamic channel statistics.
2. Extend the platform to terminal-side FAS port reconfiguration.
3. Integrate RIS, FAS, UAV mobility, and maritime scattering in a new scenario.

The maritime module is intended for reproducible qualitative trend analysis,
not as a claim of measurement-validated maritime propagation.
