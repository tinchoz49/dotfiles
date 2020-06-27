# Save history so we get auto suggestions
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE

# Options
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances
unsetopt correct_all
setopt interactive_comments # allow comments in interactive shells
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # autocomplete case insensitive
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

# Plugins

ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]=1

# oh-my-zsh
function omzPlugin() {
  zinit ice svn lucid $2
  zinit snippet OMZ::plugins/$1
}

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=true
omzPlugin tmux
omzPlugin shrink-path
omzPlugin node wait"1"
omzPlugin npm wait"1"
omzPlugin yarn wait"1"
omzPlugin git wait"1"
omzPlugin jump
omzPlugin z
zinit snippet OMZ::lib/key-bindings.zsh

# Additional completion definitions for Zsh
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# Autosuggestions & fast-syntax-highlighting
zinit ice wait lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# zsh-autosuggestions
zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

# This is a clean-room implementation of the Fish shell's history search feature
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zdharma/history-search-multi-word. ctrl + r
zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

# nvm
zinit ice wait"1" lucid
zinit light lukechilds/zsh-nvm

# navi
zinit ice wait"1" lucid
zinit light denisidoro/navi

alias vim='nvim'
alias onivim='~/apps/onivim.AppImage'
alias am='atom'
alias vs='code'
alias cat='bat'
alias d='sudo docker'
alias d:start='sudo systemctl start docker'
alias d:stop='sudo systemctl stop docker'
alias d:volume-lso='d volume ls -qf dangling=true'
alias d:volume-rmo='d volume rm (docker volume ls -qf dangling=true)'
alias d:container-kall='d stop (docker ps -a -q) && d rm (docker ps -a -q)'
alias browser-runner='node ~/projects/dxos/browser-runner/bin/cli.js'
export FZF_DEFAULT_COMMAND='rg --files'

#SPACESHIP_PROMPT_ORDER=(
  #time          # Time stamps section
  #user          # Username section
  #dir           # Current directory section
  #host          # Hostname section
  #git           # Git section (git_branch + git_status)
  #exec_time     # Execution time
  #line_sep      # Line break
  #battery       # Battery level and status
  #vi_mode       # Vi-mode indicator
  #jobs          # Background jobs indicator
  #exit_code     # Exit code section
  #char          # Prompt character
#)

function term_title() {
  printf '\033]0;%s\007' ${1//[^[:print:]]/} $(shrink_path -f)
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd term_title
add-zsh-hook preexec term_title

# before: yaourt -S starship-bin
eval "$(starship init zsh)"
