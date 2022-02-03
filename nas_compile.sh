#!/bin/bash
# 定义全局变量
# $scripts_dir 脚本所在目录
scripts_dir=$(cd "$(dirname "$0")";pwd)
# $lede_dir lede所在目录
lede_dir=$(pwd)
# 复制配置文件
cp ${scripts_dir}/Firmware/Nas.buildinfo ${lede_dir}/.config
# 补齐配置文件
make defconfig
# 开始编译
${scripts_dir}/compile.sh
# 移动固件文件
rm -rf $(find ${lede_dir}/bin/targets/ -type d -name "packages")
mkdir -vp ${scripts_dir}/Firmware/Nas/firmware/
cp -rf $(find ${lede_dir}/bin/targets/ -type f) ${scripts_dir}/Firmware/Nas/firmware/
mkdir -vp ${scripts_dir}/Firmware/Nas/package/
cp -rf $(find ${lede_dir}/bin/packages/ -type f -name "*.ipk") ${scripts_dir}/Firmware/Nas/package/
mkdir -vp ${scripts_dir}/Firmware/Nas/buildinfo/
cp -rf $(find ${lede_dir}/bin/targets/ -type f -name "*.buildinfo" -o -name "*.manifest") ${scripts_dir}/Firmware/Nas/buildinfo/

