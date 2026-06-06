# Resume Description

## 中文详细版

**RIS/FAS 辅助动态信道建模与海上通信场景扩展仿真平台 | MATLAB**

- 构建面向 RIS/FAS 辅助无线系统的 MATLAB 动态信道建模与传播统计仿真平台，
  实现 RIS-V2V、FAS-UAV 和 UAV-空中 RIS-船载 FAS 三类场景的模型分析与
  参数实验。
- 在 RIS-V2V 模块中实现 GBSM/BDCM 波束域信道统计分析，完成 Spatial CCF、
  Temporal ACF、Frequency FCF、RIS 阵列尺寸、单元间距和车辆运动状态等参数
  敏感性实验。
- 在 FAS-UAV 模块中实现动态端口可重构信道建模，分析 active ports、
  antenna length、port spacing 和 UAV motion states 对建模误差与信道容量的影响。
- 在前两类模型基础上，自主设计 UAV-Aerial RIS-Shipborne FAS 海上通信扩展
  场景，融合 RIS 级联链路、海面散射 NLoS 链路和船载 FAS 端口选择机制，分析
  链路距离、Rician 因子、RIS 位置和可选端口数对 temporal ACF 与容量增益的影响。
- 建立统一配置、脚本入口、结果保存、自动绘图和 MATLAB 数值测试流程，使项目
  具备可运行、可复查和 GitHub 展示能力。

## 中文压缩版

**RIS/FAS 辅助动态信道建模与海上场景扩展仿真 | MATLAB**

构建面向可重构无线系统的 MATLAB 仿真平台，实现 RIS-V2V 波束域信道统计分析、
FAS-UAV 动态端口容量建模，并自主扩展 UAV-空中 RIS-船载 FAS 海上通信场景，
分析 RIS 参数、移动状态、链路几何结构和 FAS 端口选择对信道非平稳性与容量
性能的影响。

## English Version

**RIS/FAS-Enabled Dynamic Channel Modeling and Maritime Extension Simulator | MATLAB**

- Built a MATLAB simulation platform for dynamic channel modeling in
  RIS/FAS-enabled reconfigurable wireless systems.
- Implemented RIS-V2V beam-domain channel statistics, including spatial CCF,
  temporal ACF, frequency FCF, RIS-parameter sweeps, and mobility-state analysis.
- Implemented FAS-UAV dynamic port-reconfigurable channel simulations to
  analyze the impact of active ports, antenna length, port spacing, and UAV
  mobility on modeling error and channel capacity.
- Designed a maritime UAV-aerial-RIS-shipborne-FAS extension that combines
  RIS-assisted cascaded propagation, maritime NLoS scattering, and FAS port
  selection to study temporal ACF and capacity-gain trends.

## Interview Talking Points

- Why RIS/FAS mobile channels are non-stationary.
- What spatial CCF, temporal ACF, and frequency FCF measure.
- Why a unitary DFT preserves ideal MIMO capacity.
- How correlated FAS ports trade aperture size against selection diversity.
- How distance, Rician factor, and RIS placement affect maritime temporal ACF.
- Why the maritime module is a qualitative prototype rather than a
  measurement-validated channel model.
