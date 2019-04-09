# MIPS-Experiment
此项目用于哈尔滨工业大学（威海）的体系结构 MIPS五级流水 实验协作编码

## 实验内容
### 第一阶段 带阻塞的流水线设计
1. 将单周期MIPS处理器设计改造成5级流水的MIPS处理器设计
  
   /rtl_code/20_one_cycle_simple_cpu.v/pipeline_cpu

2. SOC设计，增加指令存储器和数据存储器
3. 编写测试程序和testbench进行仿真测试
### 进阶设计一
4. SOC设计增加数码管单元，下载调试
### 第二阶段(进阶设计)
5. 要求考虑数据相关，设计并实现数据相关的功能

## 有关文档说明

- 1 实验材料-静态5级流水 MIPS CPU实现.docx	实验内容文档
- 2 体系结构实验课_V1.ppt				讲解PPT
- 3 报告模板.docx					报告封皮
- 4 Basys3实验指导手册-V1.0.pdf			basys3 板卡资料
- 5 verilog示例代码rtl_code			ppt讲解代码示例（流水线代码，单周期CPU代码）	
- 6 pipelinecpu_prj_err				方案1题目建立的工程（工程示例，未调试通过。1，修改CPU设计代码 2,testbench验证 3.下载板卡验证）
- 6.2 pipelinecpu_code				方案1原始代码，未创建工程
- 7 minimipsb3					柴可版本的实验题目（方案2）	
- 8 mips编译器					用于编译生成2进制文件
