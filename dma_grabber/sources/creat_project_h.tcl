# 设置工程名
set project_name dma_grabber
# 设置芯片型号
set chip_type xc7z020clg484-2
# 设定目标时钟
set clk_period 8
# 设定IP版本
set ip_verion 1.0.0

# 创建工程
file delete -force $project_name
open_project $project_name
open_solution sol1
set_part $chip_type
create_clock -period $clk_period -name default
config_rtl -module_prefix $project_name\_

# 添加设计文件
add_files "../sources/HLS/$project_name.cpp" -cflags "-std=c++14"
add_files "../sources/HLS/$project_name.h" -cflags "-std=c++14"
add_files -tb "../sources/HLS/$project_name\_test.cpp" -cflags "-std=c++14"
set_top $project_name

# 导出IP
file delete -force ../../my_ip/$project_name
file mkdir ../../my_ip/$project_name
csynth_design
csim_design
csynth_design
config_export -description wyxee2000@163.com -display_name $project_name -format ip_catalog -output ../../my_ip/$project_name -rtl verilog -vendor xilinx.com -library user -taxonomy /UserIP -version $ip_verion
export_design -rtl verilog -format ip_catalog -output ../../my_ip/$project_name

# 调用系统命令解压ZIP文件
exec unzip "../../my_ip/$project_name/export.zip" -d "../../my_ip/$project_name"
file delete "../../my_ip/$project_name/export.zip"

exit
