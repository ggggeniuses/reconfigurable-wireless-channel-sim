# Material Notes

## RIS-V2V Code Package

- Source archive: user-provided `STF-CF.zip`
- The archive contains 46 entries grouped as:
  - `CCF/CCF_GBSM_BDCM/`
  - `ACF/ACF_GBSM_BDCM/`
  - `FCF/FCF_GBSM_BDCM/`
- It appears to be the STF/CF portion of the code for:
  - `RIS-Empowered V2V Communications: Three-Dimensional Beam Domain Channel Modeling and Analysis`
- The package covers spatial CCF, temporal ACF, and frequency FCF scripts and
  helpers. It does not appear to contain the paper's capacity, channel matrix,
  or complexity figure scripts.
- Current project status:
  - `scripts/run_spatial_ccf.m`, `scripts/run_temporal_acf.m`, and
    `scripts/run_frequency_fcf.m` directly call the imported original
    `rho_*` functions.
  - The original `Frequency_FCF.m` comments out BDCM plotting, but the BDCM
    helper functions exist. The project wrapper computes those BDCM curves
    using the original helper functions.
  - RIS-size sweeping is not done through the original `rho_ACF_RIS_*`
    functions because those functions hard-code `M_x = M_z = 30`.

## FAS-UAV Reference Package

- Source archive: user-provided `FAS.zip`
- Root `matlab/` files are dated mainly around 2025-09-04 to 2025-09-07 and
  align with:
  - `Dynamic Channel Modeling of Fluid Antenna Systems in UAV Communications`
- Root images include:
  - `11.png`
  - `a.png`
  - `b.png`
  - `c.png`
- Likely mapping:
  - `a.png`: FAS-UAV Fig. 5(a), capacity vs active ports under different W.
  - `b.png`: FAS-UAV Fig. 5(b), capacity vs active ports under motion states.
  - `c.png`: FAS-UAV Fig. 5(c), FAS/ULA capacity vs antenna length.
  - `11.png`: likely modeling-error or supplementary final figure.
- `matlab/new/` is dated later, mostly 2025-10 to 2025-11, and is treated as a
  later branch or another manuscript's code. It is not included in this v1
  RIS-V2V project.

## Recommended FAS/UAV Extension

If this project is expanded beyond RIS-V2V, add FAS-UAV as a separate module
instead of mixing it into the RIS-V2V STF-CF scripts. The clean target is to
organize the root `matlab/` FAS scripts into:

- Fig. 5(a): capacity versus active ports under different `W`.
- Fig. 5(b): capacity versus active ports under different UAV motion states.
- Fig. 5(c): FAS and ULA capacity versus antenna length.

Do not import `matlab/new/` into the first FAS extension unless its target
paper is identified.
