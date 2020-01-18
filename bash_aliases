# Navigation and File Management Commands
ll() { ls -Hlhp "$@" | more; }
lf() { ls -Hhp "$@" | more; }
la() { ls -AHlhp "$@" | more; }
cd() { builtin cd "$@"; lf; }
mkd() { mkdir -p "$1" && cd "$1"; }
trash() { command mv "$@" ${HOME}/.Trash ; }
alias cd..='cd ../'
alias numFiles='echo $(ls -1 | wc -l)'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias dir='ls -ba'
alias ss="ps -aux"
alias dot='ls .[a-zA-Z0-9_]*'

code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }
code-insiders() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCodeInsiders" --args $*; }
alias edit=$EDITOR
alias which='type -all'
alias update='brew update && brew upgrade; brew cleanup; gem update; softwareupdate -l && softwareupdate -i'

psgrep() { ps -aux | grep $1 | grep -v grep; }

# Server Access Commands
sshl1() { ssh alexdubois@linode01.alextall.com; }
sshl2() { ssh alexdubois@linode02.alextall.com; }
sshs1() { ssh alexdubois@server01.alextall.com; }

# Network Commands
myip() { curl ip.appspot.com; echo; }
alias netCons='lsof -i'
alias flushDNS='dscacheutil -flushcache'
alias lsock='sudo /usr/sbin/lsof -i -P'
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'
alias ipInfo0='ipconfig getpacket en0'
alias ipInfo1='ipconfig getpacket en1'
alias openPorts='sudo lsof -i | grep LISTEN'
alias showBlocked='sudo ipfw list'

# Process commands
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias topForever='top -l 9999999 -s 10 -o cpu'
alias ttop="top -R -F -s 10 -o rsize"

# Just for fun
alias fucking=sudo
eval "$(thefuck --alias fuck)"

# Development Shortcuts
carthage-clean() { rm -rf Carthage/Build; }
git() {
    if [[ $@ == 'add .' ]]; then
        command echo Don\'t be lazy!
    else
        command git "$@"
    fi
}
sudo() {
    if [[ $@ == 'gem'* ]]; then
        command echo Don\'t install gems with sudo!
    else
        command sudo "$@"
    fi
}