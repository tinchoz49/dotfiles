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
alias docker:container-kall 'docker stop (docker ps -a -q); and docker rm (docker ps -a -q)'
alias docker:node-box 'docker run --rm -v $PWD:/src -w /src -u node -it node bash'
alias rn:reload 'adb connect (adb shell ip route | awk \'{print $9}\'); adb shell input keyevent 82; adb shell input keyevent 23; adb shell input keyevent 23';
alias cat 'bat'

set -x VISUAL "nvim"
set -x NVM_DIR "$HOME/.nvm"
set -x EDITOR "nvim"
#function nvm
    #if test -e "$NVM_DIR/nvm.sh"
        #bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
    #end
#end
#bass source "$NVM_DIR/nvm.sh"

set -x ANDROID_HOME ~/apps/android/sdk
set -x GOENV_ROOT ~/.goenv
set -x GOPATH ~/.gocode
set -x CARGO ~/.cargo/bin
set -x COMPOSER_BIN ~/.config/composer/vendor/bin
set -x RUBY_BIN ~/.gem/ruby/2.3.0/bin
set -x JAVA_BIN /usr/lib/jvm/java-8-openjdk/bin
set -x NNN_USE_EDITOR 1

set PATH $PATH $CARGO $COMPOSER_BIN $RUBY_BIN $GOPATH/bin $GOENV_ROOT/bin

# android staff
#set PATH $PATH $JAVA_BIN $ANDROID_HOME/tools $ANDROID_HOME/platform-tools ~/.local/bin
#$ANDROID_HOME/build-tools/25.0.3

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

function emulator
    eval (dirname (which emulator))/emulator $argv
end

function git_branch_delete_by
  for val in (git branch --list "$argv/*")
      git branch -D (string trim $val)
  end
end

function load_env --description 'Load environment variables from .env file'
  set -l envfile ".env"
  if [ (count $argv) -gt 0 ]
    set envfile $argv[1]
  end

  if test -e $envfile
    for line in (cat $envfile)
      if not string match -q "#*" $line
        set -xg (echo $line | cut -d = -f 1) (echo $line | cut -d = -f 2-)
      end
    end
  end
end

set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[ -f /home/tincho/.nvm/versions/node/v8.11.1/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.fish ]; and . /home/tincho/.nvm/versions/node/v8.11.1/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.fish

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/tincho/projects/geut/darkstar/node_modules/tabtab/.completions/serverless.fish ]; and . /home/tincho/projects/geut/darkstar/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/tincho/projects/geut/darkstar/node_modules/tabtab/.completions/sls.fish ]; and . /home/tincho/projects/geut/darkstar/node_modules/tabtab/.completions/sls.fish
