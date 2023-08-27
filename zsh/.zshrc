if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.config/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

autoload -U colors && colors
bindkey -e

zstyle :compinstall filename "${HOME}/.config/zsh/.zshrc"
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

export PATH=$HOME/.local/bin:$PATH

if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

# plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

colorscript random
# pfetch
# neofetch

# youtube playlist downloading
function download_playlist() {
	yt-dlp --cookies-from-browser brave -x --audio-format wav -o "$2/%(playlist_index)s-%(title)s.%(ext)s" $1
}

alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'
alias vim="nvim"
alias make="make -j 24" 
alias ..="cd .."
alias home="cd ~"
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Changing 'ls' to 'exa' so it looks good :)
alias ls='exa -al --icons --color=always --group-directories-first' # my preferred listing
alias la='exa -a --icons --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --icons --color=always --group-directories-first'  # long format
alias lt='exa -aT --icons --color=always --group-directories-first' # tree listing
alias l.='exa --icons -a | egrep "^\."'

alias cat='bat'
alias htop='btop -p 0'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
