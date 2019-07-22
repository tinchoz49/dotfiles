# Plugins
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# plugin necessary to work with tmux-zen
fundle plugin 'oh-my-fish/plugin-config'

fundle plugin 'jethrokuan/fzf'
fundle plugin 'jorgebucaran/fish-nvm'
fundle plugin 'jhillyerd/plugin-git'
fundle plugin 'sagebind/tmux-zen'
fundle plugin 'matchai/spacefish'

fundle init

set fish_greeting ''
alias network:restart 'sudo systemctl restart NetworkManager.service'
alias vim 'nvim'
alias am 'atom'
alias vs 'code'
alias docker:start 'sudo systemctl start docker'
alias docker:stop 'sudo systemctl stop docker'
alias docker:volume-lso 'docker volume ls -qf dangling=true'
alias docker:volume-rmo 'docker volume rm (docker volume ls -qf dangling=true)'
alias docker:container-kall 'docker stop (docker ps -a -q); and docker rm (docker ps -a -q)'
alias docker:node-box 'docker run --rm -v $PWD:/src -w /src -u node -it node bash'
alias rn:reload 'adb connect (adb shell ip route | awk \'{print $9}\'); adb shell input keyevent 82; adb shell input keyevent 23; adb shell input keyevent 23';
alias cat 'bat'

set -x VISUAL "nvim"
set -x NVM_DIR "$HOME/.nvm"
set -x EDITOR "nvim"
set -x GOENV_ROOT ~/.goenv
set -x GOPATH ~/.gocode
set -x CARGO ~/.cargo/bin
set -x COMPOSER_BIN ~/.config/composer/vendor/bin
set -x RUBY_BIN ~/.gem/ruby/2.3.0/bin
set -x JAVA_BIN /usr/lib/jvm/java-8-openjdk/bin
set -x NNN_USE_EDITOR 1

set PATH $PATH $CARGO $COMPOSER_BIN $RUBY_BIN $GOPATH/bin $GOENV_ROOT/bin

# android stuff
set -x ANDROID_HOME ~/apps/android
set -x ANDROID_NDK_HOME $ANDROID_HOME/ndk-bundle
set PATH $PATH $JAVA_BIN $ANDROID_HOME/tools $ANDROID_HOME/platform-tools
#~/.local/bin
#$ANDROID_HOME/build-tools/25.0.3

function fish_title
    prompt_pwd
end

function emulator
    eval (dirname (which emulator))/emulator $argv
end

function git_branch_delete_by -d "Delete all branches started with a prefix"
  for val in (git branch --list "$argv/*")
      git branch -D (string trim $val)
  end
end

function fishcognito
    env fish_history='' fish
end

set -gx FZF_DEFAULT_COMMAND  'rg --files'

# spacefish
set SPACEFISH_PROMPT_ORDER time user dir host git exec_time line_sep battery jobs exit_code char

# Style
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline
