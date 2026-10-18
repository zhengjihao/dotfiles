# claude code的alias

alias cdsp='claude --dangerously-skip-permissions'

# 安装的mit程序的alias

alias bat='batcat'

alias fd='fdfind'

# 安装、更新、卸载的alias

alias az='sudo apt update && sudo apt install -y'

gx() {
    sudo apt update &&
    sudo apt upgrade -y &&
    echo ; echo '========== apt 更新完成 ==========' ; echo

    sudo snap refresh &&
    echo ; echo '========== snap 更新完成 ==========' ; echo

    opencode upgrade &&
    echo ; echo '========== opencode 更新完成 ==========' ; echo

    if command -v codex >/dev/null 2>&1; then
        codex update &&
        echo ; echo '========== codex 更新完成 ==========' ; echo
    else
        echo ; echo '========== 未安装 codex，跳过更新 ==========' ; echo
    fi

    if command -v claude >/dev/null 2>&1; then
        claude update &&
        echo ; echo '========== claude 更新完成 ==========' ; echo
    else
        echo ; echo '========== 未安装 claude，跳过更新 ==========' ; echo
    fi

    echo "========== 全部更新命令已执行，重启以加载最新配置 ==========" ; echo
}

alias xz='sudo apt remove --purge'
