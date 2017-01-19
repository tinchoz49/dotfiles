# list plugins: pure getopts tmux-zen lookup config bass spin upto
set fish_greeting ''

alias network:restart 'sudo systemctl restart NetworkManager.service'
alias vi 'nvim'
alias vim 'nvim'
alias am 'atom'
alias vs 'code'
alias docker:start 'sudo systemctl start docker'
alias docker:rmo-volume 'docker volume rm (docker volume ls -qf dangling=true)'

set -x VISUAL "nvim"

set -x NVM_DIR "$HOME/.nvm"

function nvm
  if test -e "$NVM_DIR/nvm.sh"
    bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
  end
end
bass source "$NVM_DIR/nvm.sh"

set PATH $PATH ~/.config/composer/vendor/bin ~/.gem/ruby/2.3.0/bin ~/.gocode/bin

set -x GOPATH ~/.gocode

set fish_color_command white --bold

set fish_prompt_pwd_dir_length 3
function __parse_current_folder -d "Replace '$HOME' with '~'"
  prompt_pwd | sed "s|$HOME|~|"
end

function fish_title
  prompt_pwd
end

