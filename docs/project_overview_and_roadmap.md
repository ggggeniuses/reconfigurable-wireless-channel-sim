# Research Project Overview and Roadmap

## 1. Project Positioning

This repository should be positioned as a MATLAB research-engineering project
for dynamic wireless channel modeling, with the current public version centered
on RIS-aided V2V beam-domain channel statistics and a planned extension toward
FAS-assisted UAV communications.

The project should not be described as only a V2V plotting repository. A more
accurate positioning is:

> Dynamic channel modeling and statistical simulation for reconfigurable
> wireless systems, covering RIS-aided vehicular links and planned FAS-assisted
> UAV links.

For recommendation or graduate-admission use, the core value is not that the
project invents a new channel model from scratch. Its value is that it turns
paper code and personal research materials into a reproducible, documented, and
extendable simulation platform.

## 2. Current Implemented Scope: RIS-V2V

The current repository implements the RIS-V2V part.

Reference paper:

> W. Shi et al., "RIS-Empowered V2V Communications: Three-Dimensional Beam
> Domain Channel Modeling and Analysis," IEEE Transactions on Wireless
> Communications, 2024.

Source code package:

- User-provided `STF-CF.zip`
- Imported into `vendor/original_stf_cf/`
- Organized around spatial, temporal, and frequency correlation functions

Implemented strict reproduction:

| Module | Script | Source basis | Status |
| --- | --- | --- | --- |
| Spatial CCF | `scripts/run_spatial_ccf.m` | Original `Spatial_CCF.m` and `rho_CCF_*` functions | Implemented |
| Temporal ACF | `scripts/run_temporal_acf.m` | Original `Temporal_ACF.m` and `rho_ACF_*` functions | Implemented |
| Frequency FCF | `scripts/run_frequency_fcf.m` | Original `Frequency_FCF.m` and `rho_FCF_*` functions | Implemented as original GBSM plotted curves |

Important note:

- The original FCF script comments out BDCM FCF computation and plotting.
- Therefore, this project treats the strict FCF figure as the GBSM curves that
  are actually plotted by the original code.
- This is more defensible than forcing uncommented BDCM helper functions into
  the main reproduction figure.

Implemented extension experiments:

| Extension | Script | Purpose |
| --- | --- | --- |
| RIS array size sweep | `scripts/run_ris_parameter_sweep.m` | Study RIS aperture impact on temporal correlation |
| RIS element spacing sweep | `scripts/run_ris_spacing_sweep.m` | Study element spacing impact on temporal correlation |
| Mobility-state sweep | `scripts/run_motion_state_sweep.m` | Compare temporal correlation under different V2V motion states |

The extension experiments are separated from strict reproduction because the
original RIS `rho_*` functions hard-code `M_x = M_z = 30` and reuse fixed
sub-array coordinates. The project extension uses a compact RIS-array geometry
model with explicit element coordinates.

## 3. Planned Scope: FAS-UAV

The user also has FAS-UAV materials. These should be treated as the second
research branch of the same broader project, not mixed directly into the
RIS-V2V scripts.

Reference paper:

> Dynamic Channel Modeling of Fluid Antenna Systems in UAV Communications.

Source code package:

- User-provided `FAS.zip`
- Root `matlab/` folder is treated as the main FAS-UAV code source
- `matlab/new/` appears to be a later branch or another manuscript's code and
  should not be imported into the first FAS-UAV version unless identified

Expected reproduced figures from the provided notes:

| Target result | Expected meaning | Planned module |
| --- | --- | --- |
| `11.png` | Likely modeling-error or supplementary final figure | `scripts/fas_uav/run_modeling_error.m` |
| `a.png` | Capacity versus active ports under different fluid antenna size `W` | `scripts/fas_uav/run_capacity_vs_ports_w.m` |
| `b.png` | Capacity versus active ports under different UAV motion states | `scripts/fas_uav/run_capacity_vs_ports_motion.m` |
| `c.png` | FAS and ULA capacity versus antenna length | `scripts/fas_uav/run_capacity_fas_vs_ula.m` |

The FAS-UAV branch should focus on:

- Dynamic channel modeling under UAV motion
- Fluid antenna port selection or active-port configuration
- Capacity analysis under different antenna aperture and mobility conditions
- Comparison between FAS and conventional ULA baselines

## 4. Recommended Repository Evolution

The current repository name is RIS-specific:

```text
ris-v2v-beam-domain-channel-sim
```

There are two possible paths.

### Path A: Keep This Repository RIS-V2V Only

This is clean and low-risk.

Recommended if:

- The GitHub link is mainly for one polished resume project.
- You want the repository title to match the current implemented results.
- FAS-UAV will become a separate second repository later.

Suggested second repository name:

```text
fas-uav-dynamic-channel-sim
```

Advantages:

- Each repository has a clear paper target.
- README and figures stay focused.
- Lower risk of reviewers thinking the project is unfinished.

Disadvantages:

- The broader research continuity between RIS-V2V and FAS-UAV is less visible.

### Path B: Expand Into a Unified Dynamic Channel Modeling Repository

This is more ambitious.

Recommended if:

- You want one larger research portfolio project.
- You are willing to reorganize the repo structure.
- You want to emphasize a coherent research direction: reconfigurable wireless
  channel modeling under mobility.

Possible future repository name:

```text
reconfigurable-wireless-channel-sim
```

Suggested future structure:

```text
reconfigurable-wireless-channel-sim/
  README.md
  run_all.m
  modules/
    ris_v2v/
      run_reproduction.m
      run_extensions.m
      scripts/
      src/
      results/
      vendor/
    fas_uav/
      run_reproduction.m
      run_extensions.m
      scripts/
      src/
      results/
      vendor/
  docs/
    project_overview_and_roadmap.md
    model_validation.md
    figure_interpretation.md
    resume_description.md
  references/
    material_notes.md
```

Advantages:

- Stronger as a long-term research portfolio.
- Shows a consistent academic direction across RIS, V2V, FAS, and UAV.
- Easier to explain as "dynamic channel modeling for reconfigurable wireless
  systems."

Disadvantages:

- Requires careful documentation to avoid looking like unrelated code packages
  pasted together.
- The current repository name would become too narrow unless renamed or a new
  repository is created.

## 5. Recommended Strategy for Resume Competitiveness

For the user's current goal, the best strategy is a staged one:

### Stage 1: Stabilize RIS-V2V as Version 1.0

Already mostly complete.

Remaining recommended tasks:

- Add `docs/model_validation.md`
- Add `docs/figure_interpretation.md`
- Remove or ignore MATLAB `.asv` backup files
- Add GitHub description and topics
- Create a GitHub release `v1.0.0`

Resume wording:

> Built a MATLAB reproduction and extension platform for RIS-aided V2V
> beam-domain channel modeling, reproducing spatial CCF, temporal ACF, and
> frequency FCF characteristics from original STF-CF code and extending the
> study to RIS size, element spacing, and mobility-state impacts.

### Stage 2: Add FAS-UAV as a Second Module

Recommended next implementation target.

Do not immediately merge raw FAS code into the root directory. First create a
separate module:

```text
modules/fas_uav/
  README.md
  run_reproduction.m
  scripts/
  src/
  results/
  vendor/original_fas_uav/
```

Initial FAS-UAV deliverables:

- Reproduce `a.png`, `b.png`, `c.png`, and `11.png`
- Save `.png`, `.fig`, and `.mat` outputs
- Add a short explanation for each figure
- Add a comparison table: FAS-UAV versus RIS-V2V

Suggested module title:

```text
FAS-UAV Dynamic Channel Modeling and Capacity Simulation
```

### Stage 3: Add Cross-Theme Summary

After RIS-V2V and FAS-UAV both work, add a high-level comparison:

| Aspect | RIS-V2V | FAS-UAV |
| --- | --- | --- |
| Reconfigurable technology | RIS | Fluid Antenna System |
| Mobility scenario | Vehicular communication | UAV communication |
| Main metric | CCF/ACF/FCF | Capacity/modeling error |
| Modeling emphasis | Beam-domain channel statistics | Port selection and dynamic antenna geometry |
| Extension direction | RIS physical parameters and motion states | Active ports, antenna length, UAV motion |

This table will help reviewers quickly see that the project has a coherent
research direction.

## 6. Suggested Final Project Narrative

Chinese version:

> 本项目围绕可重构无线系统中的动态信道建模展开，第一阶段完成 RIS 辅助
> V2V 三维波束域信道模型的 MATLAB 复现与工程化整理，复现空间 CCF、时间
> ACF 和频率 FCF 等统计特性，并扩展分析 RIS 阵列尺寸、单元间距和车辆运动
> 状态对信道非平稳性的影响。第二阶段计划纳入 FAS-UAV 动态信道建模与容量
> 仿真，复现流体天线系统在 UAV 场景下的容量和建模误差结果，形成面向
> RIS/FAS、V2V/UAV 的可重构无线信道仿真平台。

English version:

> This project develops a MATLAB simulation platform for dynamic channel
> modeling in reconfigurable wireless systems. The current stage focuses on
> RIS-aided V2V beam-domain channel modeling, reproducing spatial CCF, temporal
> ACF, and frequency FCF statistics from original STF-CF code and extending the
> analysis to RIS size, element spacing, and mobility-state impacts. The next
> stage will incorporate FAS-assisted UAV channel modeling and capacity
> simulation, forming a broader research-oriented platform for RIS/FAS-enabled
> mobile wireless channels.

## 7. Immediate Next Steps

Recommended order:

1. Keep the current RIS-V2V repository stable and tag it as `v1.0.0`.
2. Clean repository artifacts such as MATLAB `.asv` backup files.
3. Add `model_validation.md` and `figure_interpretation.md`.
4. Start a separate `modules/fas_uav/` branch or a new repository for FAS-UAV.
5. Reproduce the four FAS-UAV target figures.
6. Decide whether to keep two focused repositories or merge them into a unified
   reconfigurable-wireless-channel simulation portfolio.
