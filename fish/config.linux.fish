if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ''
alias network:restart 'sudo systemctl restart NetworkManager.service'
alias vim 'nvim'
alias am 'atom'
# alias vs 'codium --enable-features=UseOzonePlatform --ozone-platform=wayland >/dev/null 2>/dev/null'
alias vs 'codium'
alias docker:start 'sudo systemctl start docker'
alias docker:stop 'sudo systemctl stop docker'
alias docker:volume-lso 'docker volume ls -qf dangling=true'
alias docker:volume-rmo 'docker volume rm (docker volume ls -qf dangling=true)'
alias docker:container-kall 'docker stop (docker ps -a -q); and docker rm (docker ps -a -q)'
alias docker:node-box 'docker run --rm -v $PWD:/src -w /src -u node -it node bash'
alias rn:reload 'adb connect (adb shell ip route | awk \'{print $9}\'); adb shell input keyevent 82; adb shell input keyevent 23; adb shell input keyevent 23';
alias cat 'bat'

set -x SHELL "/bin/fish"
set -x VISUAL "nvim"
set -x NVM_DIR "$HOME/.nvm"
set -x EDITOR "nvim"
set -x CARGO ~/.cargo/bin
set -x JAVA_BIN /usr/lib/jvm/java-8-openjdk/bin
set -x NNN_USE_EDITOR 1
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -x ZIG ~/Applications/zig-linux-x86_64-0.10.0
set -x ZLS ~/Applications/zls/zig-out/bin
set PATH $PATH $CARGO $PNPM_HOME $ZIG $ZLS

# android stuff
set -x ANDROID_HOME ~/apps/android
set -x ANDROID_NDK_HOME $ANDROID_HOME/ndk-bundle
set -x FLYCTL_INSTALL /home/tincho/.fly
set PATH $PATH $JAVA_BIN $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $FLYCTL_INSTALL/bin
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

set --export FZF_DEFAULT_COMMAND  'rg --files'

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

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

starship init fish | source
# Bun
set -Ux BUN_INSTALL "/home/tincho/.bun"
set -px --path PATH "/home/tincho/.bun/bin"
