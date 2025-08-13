#!/bin/bash

BUILD_SH="build/build.sh"

if [[ ! -f "$BUILD_SH" ]]; then
  echo "错误: $BUILD_SH 不存在！"
  exit 1
fi


# 要查找的行
TARGET_LINE='echo " Building kernel"'

# 要插入的新行
INSERT_LINE='[[ -f "LXC-DOCKER-OPEN-CONFIG.sh" ]] && ./LXC-DOCKER-OPEN-CONFIG.sh ${OUT_DIR}/.config -w'

# 使用 sed 在匹配行之后插入新内容
sed -i.bak "/$TARGET_LINE/a\\
$INSERT_LINE
" "$BUILD_SH"

# 检查是否插入成功
if grep -q "LXC-DOCKER-OPEN-CONFIG.sh" "$BUILD_SH"; then
  echo "✅ 成功：已插入 LXC 配置更新命令。"
else
  echo "❌ 错误：未能插入命令，请检查 build/build.sh 中是否存在 'echo \" Building kernel\"'"
  exit 1
fi