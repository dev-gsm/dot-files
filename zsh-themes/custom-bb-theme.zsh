autoload -Uz vcs_info

PR_RST="%f"

## use extended color palette if available
if [[ $terminfo[colors] -ge 256 ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="%F{cyan}"
    orange="%F{yellow}"
    purple="%F{magenta}"
    hotpink="%F{red}"
    limegreen="%F{green}"
fi

## symbols
TICK=$(echo -e "\u2713")
BRANCH=$(echo -e "\ue0a0")
CROSS=$(echo -e "\u2718")
# LIGHTNING=$(echo -e "\u26a1")
PLUSMINUS=$(echo -e "\u00b1")

zstyle ':vcs_info:*' stagedstr "%F{green}$PLUSMINUS"
zstyle ':vcs_info:*' unstagedstr "%{$orange%}$PLUSMINUS"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn

## set git prompt
set_git_prompt () {
  if [[ -z "$(git status --porcelain 2> /dev/null)" ]]; then
    zstyle ':vcs_info:git:*' formats "%F{green}$BRANCH$PR_RST(%{$turquoise%}%b %c%u%F{green}$TICK$PR_RST)"
  elif [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    zstyle ':vcs_info:git:*' formats "$BRANCH(%{$turquoise%}%b %c%u$PR_RST)"
  else
    zstyle ':vcs_info:git:*' formats "%F{red}$BRANCH$PR_RST(%{$turquoise%}%b %c%u%{$hotpink%}$PLUSMINUS$PR_RST)"
  fi
  vcs_info
}

setopt prompt_subst

PROMPT=$'╭─%{$purple%}%n${PR_RST} at %{$orange%}%m${PR_RST} in %{$limegreen%}%~/${PR_RST} $vcs_info_msg_0_
╰─%(?:%F{green}\$:%F{red}%B\$) ${PR_RST}'

RPROMPT=$'${PR_RST}[%*]'

autoload -U add-zsh-hook
add-zsh-hook precmd  set_git_prompt
