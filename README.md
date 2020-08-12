# 项目文件说明

+ ALU：存放处理器ALU的所有子模块及顶层模块的verilog设计文件
+ VIVADO_project：导入所有源文件后的vivado project，可以直接用VIVADO打开
+ 5_stage_pipeline：存放5级流水处理器的verilog设计代码。顶层代码为[5_stage_pipeline.v](https://github.com/KwokhoTsui/MCU/blob/5_stage_pipeline/5_stage_pipeline/5_stage_pipeline.v)；数据通路及其子模块代码在[这里](https://github.com/KwokhoTsui/MCU/tree/5_stage_pipeline/5_stage_pipeline/DataPath_modules/design)；控制通路及其子模块代码在[这里](https://github.com/KwokhoTsui/MCU/tree/5_stage_pipeline/5_stage_pipeline/control_unit)；冲突单元只有一个[设计代码文件](https://github.com/KwokhoTsui/MCU/blob/5_stage_pipeline/5_stage_pipeline/Hazard_Unit/Hazard_unit.v)。
+ 5_pipeline_Project：VIVADO项目文件，源文件可能与/5_stage_pipeline中的源文件不同
