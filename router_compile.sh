#!/bin/bash
# 定义全局变量
# $scripts_dir 脚本所在目录
scripts_dir=$(cd "$(dirname "$0")";pwd)
# $lede_dir lede所在目录
lede_dir=$(pwd)
# 时间
date =`date +"%Y-%m-%d %H:%M:%S"`
# 固件输出目录
firmware_dir = ${scripts_dir}/Firmware_${date}/Router
# 复制配置文件
cp ${scripts_dir}/Firmware/Router.buildinfo ${lede_dir}/.config
# 开始编译
${scripts_dir}/compile.sh
rm -rf $(find ${lede_dir}/bin/targets/ -type d -name "packages")
mkdir -vp ${firmware_dir}/{firmware,buildinfo}/
# 移动固件文件
mv -rf $(find ${lede_dir}/bin/targets/ -type f) ${firmware_dir}/firmware/
mv -rf $(find ${lede_dir}/bin/targets/ -type f -name "*.buildinfo" -o -name "*.manifest") ${firmware_dir}/buildinfo/
tree ${firmware_dir}
