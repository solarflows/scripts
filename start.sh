#!/bin/bash
# 定义全局变量
# $scripts_dir 脚本所在目录
scripts_dir=$(cd "$(dirname "$0")";pwd)
# 脚本开始，设置输出文字的颜色
# \033[32m 绿色
echo -e "\033[32m Strat $0 \033[0m"
# 执行openwrt固件自带的升级脚本
$(pwd)/scripts/feeds update -a
# 检索安装所有已有插件到编译环境
$(pwd)/scripts/feeds install -a
# 上一条指令执行正常则输出以下语句
if [ $? ]; then
  echo -e "\033[32m Install Feeds Well \033[0m"
else
  # 异常输出
  echo -e "\033[31m Install Feeds Fail ! \033[0m"
  exit 1
fi
