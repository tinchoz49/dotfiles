#! /usr/bin/fish

if not test -d ~/.vim
    mkdir ~/.vim
end

set from "fish/config.fish" "omf" "alacritty/alacritty.yml" ".vimrc" "vim/plug.vim" "vim/plugins" "vim/coc-settings.json" "rofi" ".tmux.conf"
set to ~/.config/fish/config.fish ~/.config/omf ~/.config/alacritty/alacritty.yml ~/.vimrc ~/.vim/plug.vim ~/.vim/plugins ~/.vim/coc-settings.json ~/.config/rofi ~/.tmux.conf

for key in $from
  if set -l index (contains -i -- $key $from)
    ln -sf $PWD/$key $to[$index]
  end
end
