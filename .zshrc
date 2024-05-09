## .zshrc
## Auhtor: Bit Byter

## Start

## theme and prompt setup
funciton default_prompt(){
	autoload -U colors && colors	# Load colors
	setopt promptsubst
	PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$ %"
	RPROMPT="[%*]"
}

zsh_theme=$HOME/dot-files/zsh-themes/custom-bb-theme.zsh
# zsh_theme=$HOME/dot-files/zsh-themes/refined.zsh-theme

## if the them scritpt available set the theme else set default prompt
[[ -f $zsh_theme ]] && source $zsh_theme || {default_prompt; echo "default prompt is set...";}

## auto cd to the directory
setopt autocd

## set vi mode in terminal
set -o vi

## zsh plugins directory
my_zsh_home="$HOME/.config/zsh"

## history file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

## zsh plugins
## zsh-autosuggestions - for autosuggestion/autocompletion
## zsh-syntax-highlighting - for syntax highlighting
declare -A plugin_source
plugin_source[zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
plugin_source[zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting.git"

zsh_plugins=(zsh-autosuggestions zsh-syntax-highlighting)

## plugins installation and activation
[[ ! -d $my_zsh_home ]] && mkdir -p $my_zsh_home
for plugin in $zsh_plugins
do
  plugin_script="$my_zsh_home/$plugin/$plugin.zsh"
  [[ ! -f $plugin_script ]] && git clone $plugin_source[$plugin] $my_zsh_home/$plugin>/dev/null 2>&1 && echo "$plugin installed..."
  [[ -f $plugin_script ]] && source $plugin_script
done

## init completion for current session
autoload -Uz compinit && compinit

## zsh-autosuggestions configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion) 	# history - autosuggestion from history file
## ZSH_AUTOSUGGEST_STRATEGY=(completion) 	# history - autosuggestion from history file
bindkey '^ ' autosuggest-accept
bindkey '^p' backward-word
bindkey '^n' forward-word

## syntax-highlight styles
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'


## aliases

# alias pacman="sudo pacman"

alias c=clear
alias rm='rm -i'
alias mv='mv -i'
alias ls='ls --color=auto'
# alias e=exit
# alias z="source $HOME/.zshrc"

# alias df="df -h"
# alias du1="du -h -d 1 | sort -rh"

# alias ls="exa -F"
# alias la="exa -Fa"
# alias ll=llt
# alias llt="exa -F --long --sort modified"
# alias llta="exa -Fa --long --sort modified"
# alias lls="exa -F --long --sort size"
# alias llsa="exa -Fa --long --sort size"

## End
