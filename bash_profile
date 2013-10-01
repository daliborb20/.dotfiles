# allows Ctrl+S to save on vim
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

# Only "exit" or "logout" will log off the system.
# set -o ignoreeof

#Set up text editing/viewing.
export LANG=en_US.utf-8
export CLICOLOR=1 #Colorizes output of ls and others.
export EDITOR=vi
export VISUAL=$EDITOR
export PAGER=less
# export LESS='-i-P%f (%i/%m) Line %lt/%L' #Better prompt, case-insensitive search by default.

export ENV=$HOME/.bashrc

# Set up command history.
export HISTSIZE=100000
export HISTFILESIZE=100000

# Make shells write to history immediately instead of on exit.
shopt -s histappend
export PROMPT_COMMAND='history -a'

# Aliases.
# alias alert='growlnotify -s'
# alias clear='ruby -e "puts %Q{\n} * 80"'
# alias find_source='find . -type f -not -path "*/target/*" -not -path "*/.svn/*" -not -path "*/.git/*" -not -name ".DS_Store" -not -iname "*.jar" -not -iname "*.gif" -not -iname "*.jpg" -not -iname "*.png"'
# alias jrake='jruby -S rake'
alias l='ls -alF'
alias gs='git status -sb'
alias gc='git commit'

#Functions.
function gitrm {
    git status | grep 'deleted' | awk '{print $3}' | xargs git rm
}
function toss {
    for filename; do
        if [ -e $HOME/.Trash/$filename ]; then
            mv "${filename}" "${HOME}/.Trash/${filename}$(date +%Y%m%d%H%M%S)"
        else
            mv "${filename}" "${HOME}/.Trash"
        fi
    done
}
function my_ip {
    ifconfig | grep 'broadcast' | awk '{print $6}'
}
function variables() {
  comm -23 <(declare) <(declare -f) ;
}

#The command line prompt.
case "$TERM" in
    xterm) color_prompt=yes;;
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
    # export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\n\[\033[00m\]\$ ' #No date
    # export PS1="\[\033[01;32m\][\$(date +%Y%m%d_%H%M%S)] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\n\[\033[00m\]\$ "
    #source /etc/bash_completion.d/git
    export PS1="\[\033[01;32m\][\$(date +%Y%m%d_%H%M%S)] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\033[01;31m \$(__git_ps1 \"(%s)\")\n\[\033[00m\]\$ "
else
    # export PS1='\u@\h:\w\n\$ ' #No date
    export PS1="[\$(date +%Y%m%d_%H%M%S)] \u@\h:\w\n\$ "
fi

#Keep this last so it can override general settings!
if [ -f $HOME/.dotfiles_local/bash_profile ]; then
    . $HOME/.dotfiles_local/bash_profile
fi

#Set starting directory.
# cd ~/Projects

#Set up fasd.
#eval "$(fasd --init auto)"
