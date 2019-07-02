#! /usr/bin/fish

if not test -d ~/.vim
    mkdir ~/.vim
end

set from "fish/config.fish" "omf" "alacritty/alacritty.yml" ".vimrc" "vim/plug.vim" "vim/plugins" "vim/coc-settings.json" "rofi"
set to ~/.config/fish/config.fish ~/.config/omf ~/.config/alacritty/alacritty.yml ~/.vimrc ~/.vim/plug.vim ~/.vim/plugins ~/.vim/coc-settings.json ~/.config/rofi

for key in $from
  if set -l index (contains -i -- $key $from)
    ln -s $PWD/$key $to[$index]
  end
end
