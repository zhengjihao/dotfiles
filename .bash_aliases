# Claude Code

alias cdsp='claude --dangerously-skip-permissions'

# The Missing Semester

alias bat='batcat'

alias fd='fdfind'

# apt, snap, flatpak, brew, pipx

alias gx='sudo apt update && \
	brew update && \
	brew upgrade && \
	sudo apt upgrade -y && \
	sudo snap refresh && \
	tldr --update && \
	echo success for server && \
	flatpak update > /dev/null 2>&1 && \
	echo success for desktop'

# install and remove

alias az='sudo apt install -y ~/下载/*.deb && \
	rm -f ~/下载/*.deb'

