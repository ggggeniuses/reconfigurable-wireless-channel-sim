# RIS/FAS 辅助动态信道建模与海上场景扩展仿真平台

[English README](README.md) | [中文说明](README_zh.md)

本项目是一个面向可重构无线系统的 MATLAB 动态信道建模与传播统计仿真平台，
围绕 RIS（Reconfigurable Intelligent Surface，可重构智能表面）与
FAS（Fluid Antenna System，流体天线系统）在移动通信场景中的信道建模问题展开。

项目采用三阶段递进式研究路线：

1. 实现 RIS-V2V 波束域信道统计分析，研究 RIS 辅助车辆通信中的动态信道建模
   与 CCF、ACF、FCF 分析方法。
2. 实现 FAS-UAV 动态端口可重构信道建模，分析流体天线端口配置对建模误差和
   信道容量的影响。
3. 在前两类模型基础上，自主扩展 UAV-空中 RIS-船载 FAS 海上通信场景，分析
   链路距离、Rician 因子、RIS 部署位置和 FAS 端口选择对时间相关性与容量增益
   的影响。

本项目不宣称从零提出全部通信信道模型，而是基于代表性 RIS/FAS 动态信道建模
文献，完成基准模型实现、工程化整理、参数扩展和场景融合，最终形成一个可运行、
可复查、可展示的研究型 MATLAB 仿真工程。

## 项目模块

### 模块一：RIS-V2V 波束域信道统计分析

该模块面向 RIS 辅助 V2V（Vehicle-to-Vehicle）通信场景，实现三维动态信道
建模与波束域统计特性分析。

主要内容包括：

- GBSM 与 BDCM 信道统计分析。
- Spatial CCF（空间互相关函数）。
- Temporal ACF（时间自相关函数）。
- Frequency FCF（频率相关函数）。
- RIS 阵列尺寸和单元间距参数实验。
- 车辆运动状态对信道非平稳特性的影响。
- BDCM 信道矩阵稀疏性与 GBSM/BDCM 复杂度分析。

### 模块二：FAS-UAV 动态端口可重构信道建模

该模块面向 FAS 辅助 UAV-to-GU 通信场景，实现流体天线动态端口配置下的信道
建模与容量性能分析。

主要内容包括：

- FAS 端口配置对建模误差的影响。
- 活跃端口数和天线孔径对信道容量的影响。
- 不同端口间距下的容量变化。
- UAV 运动状态对信道容量的影响。
- FAS 与传统 ULA 阵列的容量性能对比。

### 模块三：UAV-空中 RIS-船载 FAS 海上通信扩展

该模块是项目中的自主拓展部分，面向海上 UAV-to-Ship 通信场景，融合：

- UAV 发射端移动特性。
- 空中 RIS 级联反射链路。
- 海面散射 NLoS 链路。
- 船载 FAS 端口选择机制。
- Rician 复合链路、时间相关性与容量增益分析。

主要实验包括：

- 不同链路距离下的 Temporal ACF。
- 不同 Rician 因子下的 Temporal ACF。
- FAS 可选端口数对容量增益的影响。
- 不同 RIS 部署位置下的 Temporal ACF。

该模块体现了项目从基准模型实现进一步走向场景融合与自主扩展的过程。

## 运行方式

运行全部实验：

```matlab
run_all
```

运行测试：

```matlab
run_tests
```

分别运行各模块：

```matlab
run_benchmarks
run_extensions
run_fas_uav
run_fas_ship
```

## 结果展示

### RIS-V2V

![空间 CCF](results/figures/spatial_ccf_model_baseline.png)

![时间 ACF](results/figures/temporal_acf_model_baseline.png)

![频率 FCF](results/figures/frequency_fcf_model_baseline.png)

### FAS-UAV

![建模误差](results/figures/fas_uav/fas_uav_modeling_error.png)

![FAS 与 ULA 容量对比](results/figures/fas_uav/fas_uav_capacity_fas_vs_ula.png)

### 海上 UAV-RIS-船载 FAS

![不同距离下的 ACF](results/figures/fas_ship/acf_vs_distance.png)

![不同 Rician 因子下的 ACF](results/figures/fas_ship/acf_vs_rician_factor.png)

![FAS 端口选择增益](results/figures/fas_ship/fas_selection_gain.png)

![不同 RIS 位置下的 ACF](results/figures/fas_ship/acf_vs_ris_location.png)

## 结果输出

实验图片和数据分别保存在：

```text
results/figures/
results/data/
```

其中 `ris_v2v/`、`fas_uav/` 和 `fas_ship/` 对应三个项目模块。

## 项目文档

- [`docs/model_validation.md`](docs/model_validation.md)：数值验证与边界说明。
- [`docs/figure_interpretation.md`](docs/figure_interpretation.md)：结果图物理意义。
- [`docs/literature_map.md`](docs/literature_map.md)：文献与模块关系。
- [`docs/cross_scenario_comparison.md`](docs/cross_scenario_comparison.md)：三模块对比。
- [`docs/fas_ship_model_notes.md`](docs/fas_ship_model_notes.md)：海上扩展建模思路。
- [`docs/original_extension_notes.md`](docs/original_extension_notes.md)：自主扩展定位。
- [`docs/resume_description.md`](docs/resume_description.md)：简历和面试表述。

## 项目特点

- **结构清晰**：区分 `scripts/`、`src/`、`results/`、`docs/` 和 `tests/`。
- **可复查**：提供统一运行入口、固定随机种子和数值测试。
- **可解释**：每类结果配有模型说明和图像解释。
- **可扩展**：从 RIS-V2V 和 FAS-UAV 扩展到海上 UAV-RIS-Shipborne-FAS。
- **适合展示**：可用于推免简历、科研面试和 GitHub 项目展示。

## 简历描述示例

**RIS/FAS 辅助动态信道建模与海上场景扩展仿真平台 | MATLAB**

构建面向可重构无线系统的 MATLAB 仿真平台，实现 RIS-V2V 波束域信道统计分析、
FAS-UAV 动态端口容量建模，并自主扩展 UAV-空中 RIS-船载 FAS 海上通信场景；
分析 RIS 参数、移动状态、FAS 端口选择和链路几何结构对信道非平稳性、时间相关性
与容量性能的影响，形成可一键运行、可复查、可展示的研究型工程。
