# 文件说明

Source：项目源文件，包括Verilog代码、coe文件等

Simulation：项目仿真文件，只有一个sim_1.v代码

> 注：coe文件未加入git跟踪，需自己写好放入Source文件夹

# 使用说明

Source：创建项目时，在add source file对话框选择add directory，选择本文件夹

Simulation：在项目的源文件框中，选择add simulation file，选择本文件夹内的sim_1.v文件

# 项目日志

### 已跑通指令

```powershell
lw $t2, 16($0)
lw $t1, 4($0)
add $s0, $t1, $t2
sub $t0, $t1, $t2
sw $t0, 20($t0)
sw $s0, -12($t2)
lw $t3, 4($0)
lw $t4, 16($0)
```

### 已知错误

+ ~~control unit 代码对于部分I型指令（如addi）无法正确解码~~
+ jump指令无法正确执行

# 修改日志

### 20200813 —— xgh

+ main_decoder取消addiu功能
+ 改正main_decoder对addi的解码

