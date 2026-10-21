#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$DOTFILES_DIR/.bash_aliases"
TARGET="$HOME/.bash_aliases"

if [[ -L "$TARGET" ]] && [[ "$(readlink -f "$TARGET")" == "$(readlink -f "$SOURCE")" ]]; then
	echo "========== 已经存在正确链接 =========="
	echo "========== $TARGET -> $SOURCE =========="
	echo "========== 运行 source ~/.bash_aliases 以重新加载aliases =========="
	exit 0
fi

if [[ -e "$TARGET" || -L "$TARGET" ]]; then
    rm -f -- "$TARGET"
fi

ln -s "$SOURCE" "$TARGET"

echo "========== 安装完成 =========="
echo "========== $TARGET -> $SOURCE =========="
echo "========== 运行 source ~/.bash_aliases 以重新加载aliases =========="
