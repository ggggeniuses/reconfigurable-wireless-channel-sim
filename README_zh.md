# RIS/FAS 辅助动态信道建模仿真项目

[English README](README.md) | [中文说明](README_zh.md)

## 项目定位

本项目是一个面向 RIS/FAS 辅助无线通信场景的 MATLAB 动态信道建模仿真项目，主要用于学习、整理和验证可重构无线系统中的信道建模方法。
项目围绕 RIS（Reconfigurable Intelligent Surface，可重构智能表面）与 FAS（Fluid Antenna System，流体天线系统）在移动通信环境中
的应用展开，重点分析不同场景下的信道统计特性、参数敏感性以及系统性能变化。

项目采用三阶段递进式研究路线：

1. 实现 RIS-V2V 波束域信道统计分析，研究 RIS 辅助车辆通信中的动态信道建模
   与 CCF、ACF、FCF 分析方法。
2. 实现 FAS-UAV 动态端口可重构信道建模，分析流体天线端口配置对建模误差和
   信道容量的影响。
3. 在前两类模型基础上，扩展 UAV-空中 RIS-船载 FAS 海上通信场景，分析
   链路距离、Rician 因子、RIS 部署位置和 FAS 端口选择对时间相关性与容量增益
   的影响。

本项目不宣称从零提出全部通信信道模型，而是基于代表性 RIS/FAS 动态信道建模
文献，完成基准模型实现、工程化整理、参数扩展和场景融合，形成可运行、可复查
且便于继续扩展的 MATLAB 仿真工程。

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

### 模块三：UAV-空中 RIS-船载 FAS 海上通信场景扩展

该模块基于 RIS-V2V 与 FAS-UAV 两个模块中的建模思路，进一步扩展到海上
UAV-to-Ship 通信场景，综合考虑：

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

该模块用于整理和实验 RIS、FAS、移动平台与海面散射共同作用下的信道变化趋势。

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
- [`docs/original_extension_notes.md`](docs/original_extension_notes.md)：扩展模块定位。
- [`docs/project_overview_and_roadmap.md`](docs/project_overview_and_roadmap.md)：项目路线。

## 项目特点

- **结构清晰**：区分 `scripts/`、`src/`、`results/`、`docs/` 和 `tests/`。
- **可复查**：提供统一运行入口、固定随机种子和数值测试。
- **可解释**：每类结果配有模型说明和图像解释。
- **可扩展**：从 RIS-V2V 和 FAS-UAV 扩展到海上 UAV-RIS-Shipborne-FAS。

## 说明

前两个模块用于实现和整理典型 RIS/FAS 动态信道建模框架。海上模块是基于前面
建模组件继续扩展得到的场景实验，不定位为某一篇文献的直接实现，也不宣称已经
完成实测标定。
