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
alias nrc='npm run format && npm run lint'
alias rbt='rush build -t'
alias rbo='rush build --only'
alias rlo='rush lint --only'
alias nri='npm run integration-test:node'
alias nrib='npm run integration-test:browser'
alias nrt='npm run build:test'
alias nru='npm run unit-test:node'
alias nrub='npm run unit-test:browser'
alias nv='npm view'

alias upnpm='git checkout upstream/main common/config/rush/pnpm-lock.yaml && rush update && git add common/config/rush/pnpm-lock.yaml'

alias ta='tmux attach'
alias td='tmux detach'

alias mgt='emacsclient -nw -e "(magit-status)"'

source ~/.bash_prompt

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
