#!/bin/bash
# 脚本所在目录
scripts_dir=$(cd "$(dirname "$0")";pwd)
# lede所在目录
lede_dir=$(pwd)
# 复制配置文件
cp $scripts_dir/conf/CatDrive.buildinfo $lede_dir/.config
# 开始编译
$scripts_dir/compile.sh
if [ -e $lede_dir/bin/targets/**/**/sha256sums ]
then
    # 时间
    date=$(date +"%Y-%m-%d_%H:%M:%S")
    # 整理文件
    rm -rf $(find $lede_dir/bin/targets/ -type d -name "packages")
    # 创建目录
    mkdir -vp $lede_dir/Firmware/CatDrive/$date
    # 移动固件文件
    echo -e "\033[32m moving firmware file \033[0m"
    mv -f $(find $lede_dir/bin/targets/ -type f -name "*.buildinfo" -o -name "sha256sums" -o -name "*.gz" ! -name "*rootfs*" -o -name "*.img" ! -name "*rootfs*") ~/Firmware/CatDrive/$date/
    # 展示目录
    tree $lede_dir/Firmware/CatDrive/$date
fi
