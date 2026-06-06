# Resume Description

## 中文详细版

**RIS/FAS 辅助动态信道建模与海上通信场景扩展仿真平台 | MATLAB**

- 构建面向 RIS/FAS 辅助无线系统的 MATLAB 动态信道建模与传播统计仿真平台，
  实现 RIS-V2V、FAS-UAV 和 UAV-空中 RIS-船载 FAS 三类场景的模型分析。
- 在 RIS-V2V 模块中实现空间 CCF、时间 ACF、频率 FCF、RIS 阵列参数和车辆
  运动状态实验，并分析波束域能量集中、容量一致性与稀疏计算复杂度。
- 在 FAS-UAV 模块中实现动态端口可重构信道建模，分析有效端口、天线孔径、
  端口间距和 UAV 运动状态对建模误差与信道容量的影响。
- 自主设计 UAV-空中 RIS-船载 FAS 海上通信扩展场景，融合 RIS 级联链路、
  海面散射 NLoS 链路和相关 FAS 端口选择，分析距离、Rician 因子、RIS
  位置和可选端口数对时间 ACF 与容量增益的影响。
- 建立统一配置、结果保存、自动绘图和 MATLAB 数值测试流程。

## 中文压缩版

**RIS/FAS 辅助动态信道建模与海上场景扩展仿真 | MATLAB**

构建可重构无线系统 MATLAB 仿真平台，实现 RIS-V2V 波束域信道统计、
FAS-UAV 动态端口容量建模，并自主扩展 UAV-空中 RIS-船载 FAS 海上通信
场景，分析移动状态、链路几何和端口选择对信道非平稳性与容量的影响。

## English Version

**RIS/FAS-Enabled Dynamic Channel Modeling and Maritime Extension Simulator | MATLAB**

- Built a MATLAB simulator for dynamic channel modeling in RIS/FAS-enabled
  reconfigurable wireless systems.
- Implemented RIS-V2V beam-domain statistics, including spatial CCF, temporal
  ACF, frequency FCF, RIS parameter sweeps, and mobility-state analysis.
- Implemented FAS-UAV dynamic port simulations to evaluate modeling error and
  capacity under active-port, aperture, spacing, and mobility changes.
- Designed a maritime UAV-RIS-shipborne-FAS extension combining cascaded
  RIS propagation, maritime NLoS scattering, and correlated FAS port selection.
- Added reproducible configurations, automated tests, figures, MAT outputs,
  and research documentation.

## Interview Talking Points

- Why RIS/FAS mobile channels are non-stationary.
- What spatial CCF, temporal ACF, and frequency FCF measure.
- Why a unitary DFT preserves ideal MIMO capacity.
- How correlated FAS ports trade aperture size against selection diversity.
- How distance, Rician factor, and RIS placement affect maritime temporal ACF.
- Why the maritime module is a qualitative prototype rather than a
  measurement-validated channel model.
