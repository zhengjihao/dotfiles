# Clash Verge

alias clashverge='export https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897'

# Claude Code

alias cdsp='claude --dangerously-skip-permissions'

# The Missing Semester

alias bat='batcat'

alias fd='fdfind'

# apt, snap, brew

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

    clashverge &&
    sudo apt update &&
    sudo apt upgrade -y &&
    brew update &&
    brew upgrade &&
    sudo snap refresh &&
    if [[ "$mode" == "desktop" ]]; then
        gext update
    fi &&
    sudo apt clean &&
    brew cleanup &&
    echo '更新已完成，记得手动重启'
}

# 安装并且删除

alias az='sudo apt install -y ~/下载/*.deb && rm -f ~/下载/*.deb'