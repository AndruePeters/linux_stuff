# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Add this lines at the top of .bashrc:
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
[ -z "$TMUX"  ] && { exec tmux new-session && exit;}


bind 'set completion-ignore-case on'

source ~/.local/share/blesh/ble.sh
eval "$(starship init bash)"

# SSH Agent should be running, once
runcount=$(ps -ef | grep "ssh-agent" | grep -v "grep" | wc -l)
if [ $runcount -eq 0 ]; then
    echo Starting SSH Agent
    eval $(ssh-agent -s)
fi


# Add this line at the end of .bashrc:
[[ ! ${BLE_VERSION-} ]] || ble-attach

