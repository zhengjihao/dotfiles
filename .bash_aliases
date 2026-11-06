# Claude Code

alias cdsp='claude --dangerously-skip-permissions'

# The Missing Semester

alias bat='batcat'

alias fd='fdfind'

# apt, snap, gext, claude, codex, opencode, clean

alias az='sudo apt update && sudo apt install -y'

gx() {
    local mode="${1:-desktop}" # 不传参数就是 desktop

    if [[ "$mode" != "server" && "$mode" != "desktop" ]]; then
        echo "用法: gx [desktop|server] # 不传参数就是 desktop"
        return 1
    fi

    read -p "模式：$mode, 确认更新?(yes/no) " confirm
    if [[ "$confirm" != "yes" ]]; then
        echo "已取消"
        return 1
    fi

    sudo apt update &&
    sudo apt upgrade -y &&
    sudo snap refresh &&
    if [[ "$mode" == "desktop" ]]; then
        gext update
    fi &&
    claude update &&
    codex update &&
    opencode update &&
    sudo apt clean &&
    echo '更新已完成，记得手动重启'
}

alias xz='sudo apt remove --purge'
