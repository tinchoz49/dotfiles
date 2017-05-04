# list plugins: pure getopts tmux-zen lookup config bass spin upto
set fish_greeting ''
#set -x TERM xterm-256color
alias network:restart 'sudo systemctl restart NetworkManager.service'
alias vi 'nvim'
alias vim 'nvim'
alias am 'atom'
alias vs 'code'
alias docker:start 'sudo systemctl start docker'
alias docker:stop 'sudo systemctl stop docker'
alias docker:volume-lso 'docker volume ls -qf dangling=true'
alias docker:volume-rmo 'docker volume rm (docker volume ls -qf dangling=true)'

set -x VISUAL "nvim"
set -x NVM_DIR "$HOME/.nvm"

function nvm
    if test -e "$NVM_DIR/nvm.sh"
        bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
    end
end
bass source "$NVM_DIR/nvm.sh"

set -x ANDROID_HOME ~/Android/Sdk
set -x GOPATH ~/.gocode
set -x CARGO ~/.cargo/bin

set PATH $PATH ~/.config/composer/vendor/bin ~/.gem/ruby/2.3.0/bin $GOPATH/bin $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $CARGO

set fish_color_command white --bold

set fish_prompt_pwd_dir_length 3
function __parse_current_folder -d "Replace '$HOME' with '~'"
    prompt_pwd | sed "s|$HOME|~|"
end

function fish_title
    prompt_pwd
end

function npm-do
    set -lx PATH (npm bin) $PATH
    eval $argv
end

set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
