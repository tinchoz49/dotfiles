set fish_greeting ''
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

set -x ANDROID_HOME ~/apps/android/sdk
set -x GOPATH ~/.gocode
set -x CARGO ~/.cargo/bin
set -x COMPOSER_BIN ~/.config/composer/vendor/bin
set -x RUBY_BIN ~/.gem/ruby/2.3.0/bin
set -x JAVA_BIN /usr/lib/jvm/java-8-openjdk/bin

set PATH $PATH $CARGO $COMPOSER_BIN $RUBY_BIN $GOPATH/bin

# android staff
set PATH $PATH $JAVA_BIN $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $ANDROID_HOME/build-tools/25.0.3

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
