# Save history so we get auto suggestions
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE

# Enable autocompletions
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
zmodload -i zsh/complist

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
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Load antibody plugin manager
source <(antibody init)
export ANTIBODY_HOME="$HOME/.cache/antibody"

# Plugins
# oh-my-zsh

# Set ZSH_CACHE_DIR to the path where cache files should be created
# or else we will use the default cache/
export ZSH="$ANTIBODY_HOME/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
export ZSH_CACHE_DIR="$ZSH/cache"

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=true

antibody bundle robbyrussell/oh-my-zsh path:plugins/tmux
antibody bundle robbyrussell/oh-my-zsh path:plugins/node
antibody bundle robbyrussell/oh-my-zsh path:plugins/npm
antibody bundle robbyrussell/oh-my-zsh path:plugins/yarn
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/fzf
antibody bundle robbyrussell/oh-my-zsh path:plugins/jump
antibody bundle robbyrussell/oh-my-zsh path:plugins/shrink-path
antibody bundle robbyrussell/oh-my-zsh path:lib/key-bindings.zsh

antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle marzocchi/zsh-notify
antibody bundle denysdovhan/spaceship-prompt

alias vim='nvim'
alias am='atom'
alias vs='code'
alias cat='bat'
export FZF_DEFAULT_COMMAND='rg --files'

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# fnm
export PATH=/home/tincho/.fnm:$PATH
eval "`fnm env --multi`"

function term_title() {
  printf '\033]0;%s\007' ${1//[^[:print:]]/} $(shrink_path -f)
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd term_title
add-zsh-hook preexec term_title
