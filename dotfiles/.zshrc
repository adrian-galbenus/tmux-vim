alias chrome='chromium-browser'
alias github='chromium-browser https://github.com'
alias c='clear &&'
alias tmux='tmux -2' 
alias tma='tmux a -t' 
alias tmk='tmux kill-session -t' 
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH


function box_out()
{
  local s=("$@") b w
  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done
  tput setaf 3
  echo " ##${b//?/#}##
## ${b//?/ } ##"
  for l in "${s[@]}"; do
    printf '## %s%*s%s ##\n' "$(tput setaf 4)" "-$w" "$l" "$(tput setaf 3)"
  done
  echo "## ${b//?/ } ##
 ##${b//?/#}##"
  tput sgr 0
}
#force caps act like control

[[ -f $(which setxkbmap) ]] &&  setxkbmap -layout us -option ctrl:nocaps || echo "setxkbmap not found"


source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme https://gist.github.com/xfanwu/18fd7c24360c68bab884 xxf
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Tell antigen that you're done.
antigen apply
DISABLE_AUTO_TITLE="true"
