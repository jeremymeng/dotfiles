alias scr='screen -dRR'
alias cls='printf "\033c"'

alias ll='ls -alF --color'
alias l='ls -aF --color'

alias m='less'

alias envgrep='printenv | grep --color'
alias psgrep='ps -aux | grep -v "grep --color" | grep --color'
alias hgrep='history | grep --color'

alias e='/home/azuser/git/emacs/lib-src/emacsclient -t'
alias ed='/home/azuser/git/emacs/src/emacs --daemon'
alias em='emacsclient -t'
alias ew='emacsclient --c'
alias emd='emacs --daemon'
alias ek='emacsclient -nw -e "(kill-emacs)"'

alias h='history'

alias nr='npm run'
alias rbt='rush build -t'
alias nri='npm run integration-test:node'
alias nrt='npm run build:test'
alias nru='npm run unit-test:node'
alias upnpm='git checkout upstream/main common/config/rush/pnpm-lock.yaml && rush update && git add common/config/rush/pnpm-lock.yaml'

alias ta='tmux attach'
alias td='tmux detach'

alias mgt='emacsclient -nw -e "(magit-status)"'

# I don't want to maintain another rc file for bash so put everything here.
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

export COLORTERM=truecolor

vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end(){
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
PS1=$PS1'\[$(vterm_prompt_end)\]'
