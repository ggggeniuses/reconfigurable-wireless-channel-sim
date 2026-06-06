# Cross-Scenario Comparison

| Aspect | RIS-V2V | FAS-UAV | Maritime UAV-RIS-Shipborne-FAS |
| --- | --- | --- | --- |
| Reconfigurable technology | RIS | FAS | RIS + FAS |
| Mobility scenario | Vehicle-to-vehicle | UAV-to-ground | UAV-to-ship maritime |
| Main channel components | VLoS / NLoS / Rician | LoS / NLoS with FAS ports | RIS cascaded path / maritime NLoS / FAS selection |
| Main metrics | CCF / ACF / FCF / capacity / complexity | Modeling error / capacity | Temporal ACF / selection gain |
| Main parameters | RIS size, spacing, mobility | Active ports, antenna length, UAV motion | Distance, Rician factor, RIS location, selectable ports |
| Project role | Benchmark statistics module | Benchmark FAS module | Student-designed integrated extension |

The three modules form a staged project: channel-statistics implementation,
dynamic port-reconfiguration analysis, and an integrated maritime scenario.
The final module is intended for qualitative trend analysis rather than a claim
of measurement-validated maritime propagation.
