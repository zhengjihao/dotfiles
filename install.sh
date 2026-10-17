#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$DOTFILES_DIR/.bash_aliases"
TARGET="$HOME/.bash_aliases"

if [[ ! -f "$SOURCE" ]]; then
    echo "错误：找不到配置文件 $SOURCE" >&2
    exit 1
fi

# 如果目标已经正确指向仓库，就不做任何修改
if [[ -L "$TARGET" ]] &&
   [[ "$(readlink -f "$TARGET")" == "$(readlink -f "$SOURCE")" ]]; then
    echo "$TARGET 已经正确链接到 dotfiles。"
    exit 0
fi

# 如果目标存在，先备份，不覆盖原文件
if [[ -e "$TARGET" || -L "$TARGET" ]]; then
    BACKUP="$TARGET.backup.$(date +%Y%m%d%H%M%S)"
    mv -- "$TARGET" "$BACKUP"
    echo "原配置已备份到：$BACKUP"
fi

# 创建指向仓库配置的符号链接
ln -s "$SOURCE" "$TARGET"

echo "安装完成：$TARGET -> $SOURCE"
echo "运行 source ~/.bash_aliases 以重新加载别名。"
