# 文件说明

Source：项目源文件，包括Verilog代码、coe文件等

Simulation：项目仿真文件，只有一个sim_1.v代码

> 注：coe文件未加入git跟踪，需自己写好放入Source文件夹
>
> （更新）由于IP core更改时涉及到很多文件更改，data_mem_d_IP和inst_mem_rom_IP两个文件夹也不加入git跟踪

# 使用说明

Source：创建项目时，在add source file对话框选择add directory，选择本文件夹

Simulation：在项目的源文件框中，选择add simulation file，选择本文件夹内的sim_1.v文件

# 项目日志

### 已跑通指令

```powershell
lw $t2, 16($0)
addi $t1, $t1, 0xffff
```

### 已知错误

+ ~~control unit 代码对于部分I型指令（如addi）无法正确解码~~
+ ~~lw 指令无法正确执行~~
+ jump指令无法正确执行

# 修改日志

### 20200813 —— xgh

+ main_decoder取消addiu功能
+ 改正main_decoder对addi的解码
+ DataPath.v 补上缺失语句 assign WriteRegE_HU = WriteRegE
+ DataPath.v 增加EqualD声明
+ 修复MUX_5_2_1的bug

